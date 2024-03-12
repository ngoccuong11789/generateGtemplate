import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/exception/soctrip_exeception.dart';
import 'package:shared_module/features/checkout/model/method_payment.dart';
import 'package:shared_module/features/my_cart/api/my_cart_controller.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/my_cart/view/my_cart_screen.dart';
import 'package:shared_module/features/share_to_feed/model/ProductDetail.dart';
import 'package:shared_module/features/vouchers/api/shop_voucher_controller.dart';
import 'package:shared_module/features/vouchers/bloc/shop_voucher_bloc.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/shared_module.dart';
part 'my_cart_event.dart';
part 'my_cart_state.dart';

final EntityDtos _noShop = EntityDtos();

enum MyCartStatus { init, success, fail, waiting }
enum UpdateCartByIdType {increment, decrement, variation}

class MyCartBloc extends Bloc<MyCartEvent, GetMyCartState> {
    final MyCartController myCartController = MyCartController(SharedModule.appDelegates!.dio);
    final ShopVouchersController controller = ShopVouchersController(SharedModule.appDelegates!.dio);
    late num totalDiscount = 0;
    late List<CheckVoucherShop> checkVoucherShop = [];

  int _countSelectedItems(
      List<EntityDtos> shops, Set<String> selectedProducts) {
    int selectedCount = 0;
    for (EntityDtos shop in shops) {
      for (ObjectDtOs item in shop.objectDTOs ?? []) {
        if (selectedProducts.contains(item.stockId ?? "")) {
          selectedCount += 1;
        }
      }
    }
    return selectedCount;
  }

  bool _isCheckAll(List<EntityDtos> shops, Set<String> selectedShops) {
    return shops.every((shop) => selectedShops.contains(shop.id ?? ""));
  }

  num _calculatePrice(List<EntityDtos> shops, Set<String> selectedProducts) {
    num price = 0;
    for (EntityDtos shop in shops) {
      for (ObjectDtOs item in shop.objectDTOs ?? []) {
        if (selectedProducts.contains(item.stockId ?? "")) {
          price += ((item.stockDetail?.price ?? 0) * (item.quantity ?? 0));
        }
      }
    }
    return price;
  }

  Future<CartResponse> getData() async {
    Map<String, dynamic> objectType;
    if (state.buyType == BUYTYPE.ecommerce) {
      objectType = {"objectType": "PRODUCT"};
    } else {
      objectType = {"objectType": "FOOD"};
    }
    return await myCartController.getMyCart(objectType);
  }

    num validationVoucher(DataItemShopVoucher data, num price) {
      late num discount;
      if (data.discountType == DiscountType.PRICE.name) {
        discount = data.discountAmount!;
        if (discount > price) {
          discount = price;
        }
      } else if (data.discountType == DiscountType.PERCENTAGE.name) {
        discount = (price * data.discountAmount!) / 100;
        if (data.isLimitDiscountPrice!) {
          if (discount > data.maxDiscountPrice!) {
            discount = data.maxDiscountPrice!;
          }
        }
      }
      return discount;
    }

  DataShopVouchers checkValid(DataShopVouchers dataVoucher, num price, String shopId) {
    for (var i in dataVoucher.data!) {
      if ((price < i.minimumOrderPrice!)) {
        i.isVisible = false;
      } else {
        i.isVisible = true;
      }
    }
    List<DataItemShopVoucher> findVisible = dataVoucher.data!
        .where((element) => element.isVisible == true)
        .toList();

    if (findVisible.isNotEmpty) {
      for (var i = 0; i < (dataVoucher.data ?? []).length; i++) {
        var item = dataVoucher.data![i];
        final check = checkVoucherShop.where((element) => element.shopId == shopId).toList();

        if (check.isNotEmpty) {
          if (check[0].voucherId == item.id) {
            item.isSelect = true;
            totalDiscount = totalDiscount +
                validationVoucher(dataVoucher.data!.elementAt(i), price);
          }
        } else {
          if (item.id == findVisible.first.id)   {
            item.isSelect = true;
            totalDiscount = totalDiscount +
                validationVoucher(dataVoucher.data!.elementAt(i), price);
            checkVoucherShop.add(CheckVoucherShop(shopId: shopId, voucherId: item.id ?? ''));
          }
        }
      }
    }

    return dataVoucher;
  }

  MyCartBloc() : super(LoadingData()) {
    on<GetDataMyCart>((event, emit) async {
      emit(state.copyWith(buyType: event.buyType, status: MyCartStatus.init));
      try {
        final data = await getData();
        emit(state.copyWith(
            status: MyCartStatus.success,
            data: data,
            shops: data.entityDTOS,
            buyType: event.buyType,
            totalProduct: data.totalItems
        ));
      } on SoctripException catch (exception) {
        emit(state.copyWith(
            status: MyCartStatus.fail,
        ));
      }
    });

    num calculator(List<dynamic> list, num priceItem) {
      late num discount = 0;
      if (priceItem == 0) return 0;
      if (list.isNotEmpty) {
        final data = list[0].voucherId;
        if (data?.discountType == DiscountType.PRICE.name) {
          discount += data?.discountAmount ?? 0;
          if (discount > priceItem) {
            discount = priceItem;
          }
        } else if (data?.discountType == DiscountType.PERCENTAGE.name) {
          discount += (priceItem * (data?.discountAmount ?? 0)) / 100;
          if (data?.isLimitDiscountPrice ?? false) {
            if (discount > (data?.maxDiscountPrice ?? 0)) {
              discount = (data?.maxDiscountPrice ?? 0);
            }
          }
        }
      }
      return discount;
    }

    on<UpdateDiscount>(((event, emit) async {
      num priceItem = 0;
      late num discount = 0;
      late num deliveryFee = 0;
      for (EntityDtos itemShop in state.shops) {
        for (ObjectDtOs product in (itemShop.objectDTOs ?? [])) {
          for (var item in state.selectedProducts) {
            if (product.stockId == item) {
              priceItem = priceItem +
                  ((product.stockDetail?.price ?? 0) * (product.quantity ?? 0));
            }
          }
        }
        final check = event.list
            .where((element) => element.shopId.contains(itemShop.id ?? ''))
            .toList();
        discount += calculator(check, priceItem);

        priceItem = 0;
      }

      emit(state.copyWith(
          discount: discount,
          listVoucherSelect: event.list,
          listVoucherSelectShipping: event.listShipping));
    }));

    on<GetVoucher>((event, emit) async {
      DataShopVouchers dataShopVoucher = DataShopVouchers();
      DataShippingVouchers dataShippingVoucher = DataShippingVouchers();
      emit(state.copyWith(loading: true));
      final List<String> itemId = [];
      num priceItem = 0;
      Set<String> selectedShops = {};
      selectedShops.addAll(state.selectedShops);
      Set<String> selectedProducts = {};
      selectedProducts.addAll(state.selectedProducts);

      for (ObjectDtOs item in event.shop.objectDTOs ?? []) {
        if (selectedProducts.contains(item.stockId ?? "")) {
          itemId.add(item.objectId ?? '');
          priceItem += ((item.stockDetail?.price ?? 0) * (item.quantity ?? 0));
        }
      }

      try {
        dataShopVoucher = await controller.fetchShopVouchers(0, [event.shop.id ?? ''], itemId);
      } catch (ex) {}


      try {
        dataShippingVoucher = await controller.fetchShippingVouchers(0, [event.shop.id ?? ''], itemId);
      } catch (ex) {}

      event.onEvent!(dataShopVoucher.data ?? [], dataShippingVoucher.data ?? [], priceItem, event.shop.id ?? '');
      emit(state.copyWith(loading: false,));
    });

    on<CheckAll>((event, emit) async {
      emit(state.copyWith(loading: true));
      final data = await getData();
      num price = 0;
      late num discount = 0;

      final isCheck = !event.isCheck;
      Set<String> selectedShops = {};
      Set<String> selectedProducts = {};
      final shops = data.entityDTOS ?? [];
      if (!isCheck) {
        discount = 0;
      }

      for (EntityDtos shop in shops) {
        if (isCheck) {
          selectedShops.add(shop.id ?? "");
          for (ObjectDtOs item in shop.objectDTOs ?? []) {
            selectedProducts.add(item.stockId ?? "");
            price += ((item.stockDetail?.price ?? 0) * (item.quantity ?? 0));
          }
        }
      }
      final selectedItemCount = _countSelectedItems(shops, selectedProducts);
      emit(state.copyWith(
          shops: shops,
          loading: false,
          price: price,
          discount: discount,
          selectedItemCount: selectedItemCount,
          isSelectedAll: isCheck,
          selectedProducts: selectedProducts,
          selectedShops: selectedShops));

    });

    on<CheckShopItem>((event, emit) async {
      emit(state.copyWith(loading: true));
      final data = await getData();
      final shops = data.entityDTOS ?? [];

      Set<String> selectedShops = {};
      selectedShops.addAll(state.selectedShops);
      Set<String> selectedProducts = {};
      selectedProducts.addAll(state.selectedProducts);
      totalDiscount = 0;

      final isCheck = !event.isCheck;
      if (isCheck) {
        selectedShops.add(event.idShop);
      } else {
        checkVoucherShop.removeWhere((element) => element.shopId == event.idShop);
        selectedShops.remove(event.idShop);
      }

      final shop = shops.firstWhere((shop) => shop.id == event.idShop,
          orElse: () => _noShop);
      if (shop != _noShop) {
        for (ObjectDtOs item in shop.objectDTOs ?? []) {
          if (isCheck) {
            selectedProducts.add(item.stockId ?? "");
          } else {
            selectedProducts.remove(item.stockId ?? "");
          }
        }
      }
      num price = _calculatePrice(shops, selectedProducts);

      add(UpdateDiscount(list: state.listVoucherSelect, listShipping: state.listVoucherSelectShipping));

      final selectedItemCount = _countSelectedItems(shops, selectedProducts);
      emit(state.copyWith(
          shops: shops,
          price: price,
          loading: false,
          selectedItemCount: selectedItemCount,
          selectedShops: selectedShops,
          isSelectedAll: _isCheckAll(shops, selectedShops),
          selectedProducts: selectedProducts));
    });

    on<CheckProductInShop>((event, emit) async {
      emit(state.copyWith(loading: true));
      final data = await getData();
      final shops = data.entityDTOS ?? [];
      Set<String> selectedShops = {};
      selectedShops.addAll(state.selectedShops);
      Set<String> selectedProducts = {};
      selectedProducts.addAll(state.selectedProducts);

      final isCheck = !event.isCheck;

      final shop = shops.firstWhere((shop) => shop.id == event.idShop,
          orElse: () => _noShop);
      if (shop != _noShop) {
        if (isCheck) {
          selectedProducts.add(event.idStock);
        } else {
          selectedProducts.remove(event.idStock);
        }
        bool isShopCheck = shop.objectDTOs?.every(
                (product) => selectedProducts.contains(product.stockId)) ??
            false;
        if (isShopCheck) {
          selectedShops.add(shop.id ?? "");
        } else {
          selectedShops.remove(shop.id ?? "");
        }
      }

      final price = _calculatePrice(shops, selectedProducts);
      final selectedItemCount = _countSelectedItems(shops, selectedProducts);

      add(UpdateDiscount(list: state.listVoucherSelect, listShipping: state.listVoucherSelectShipping));

      emit(state.copyWith(
          shops: shops,
          price: price,
          loading: false,
          selectedItemCount: selectedItemCount,
          selectedShops: selectedShops,
          isSelectedAll: _isCheckAll(shops, selectedShops),
          selectedProducts: selectedProducts));
    });

    // update Cart
    updateCart(Emitter<GetMyCartState> emit) async {
      emit(state.copyWith(loading: true));
      final data = await getData();
      final shops = data.entityDTOS ?? [];
      totalDiscount = 0;

      final price = _calculatePrice(shops, state.selectedProducts);

      add(UpdateDiscount(list: state.listVoucherSelect, listShipping: state.listVoucherSelectShipping));

      final selectedItemCount =
          _countSelectedItems(shops, state.selectedProducts);
      emit(state.copyWith(
          shops: shops, price: price, selectedItemCount: selectedItemCount, loading: false,));
    }

    on<UpdateCartById>(((event, emit) async {
      int quantity = event.quantity;
      switch (event.type) {
        case UpdateCartByIdType.increment:
          quantity = quantity + 1;
          break;
        case UpdateCartByIdType.decrement:
          quantity = quantity - 1;
          break;
        case UpdateCartByIdType.variation:
          quantity = quantity;
          break;
      }

      CartRequest dto = CartRequest(
          objectType: state.buyType == BUYTYPE.ecommerce ? "PRODUCT" : "FOOD",
          objectId: event.productId,
          stockId: event.stockId,
          entityId: event.shopId,
          quantity: quantity);
      await myCartController.updateCartById(dto, event.id);
      await updateCart(emit);
    }));

    on<DeleteItemCart>(((event, emit) async {
      totalDiscount = 0;
      Set<String> selectedProducts = {};
      selectedProducts.addAll(state.selectedProducts);
      selectedProducts.remove(event.stockId);
      num price = _calculatePrice(state.shops, selectedProducts);
      await myCartController.deleteItemCart(event.id);
      await updateCart(emit);
      emit(state.copyWith(
        price: price,
        selectedProducts: selectedProducts,
        // discount: totalDiscount,
      ));
    }));
  }
}
