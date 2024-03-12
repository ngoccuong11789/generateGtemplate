import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/vouchers/api/shop_voucher_controller.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/shared_module.dart';

part 'shop_voucher_event.dart';
part 'shop_voucher_state.dart';

class ShopVoucherBloc extends Bloc<ShopVoucherEvent, ShopVoucherState> {
  final ShopVouchersController controller =
      ShopVouchersController(SharedModule.appDelegates!.dio);

  num calculator(List<dynamic> list, num priceItem) {
    late num discount = 0;
    if (priceItem == 0) return 0;
    if (list.isNotEmpty) {
      final data = list[0].voucherId;
      if (data?.discountType == DiscountType.PRICE.name) {
        discount = data?.discountAmount ?? 0;
        if (discount > priceItem) {
          discount = priceItem;
        }
      } else if (data?.discountType == DiscountType.PERCENTAGE.name) {
        discount = (priceItem * (data?.discountAmount ?? 0)) / 100;
        if (data?.isLimitDiscountPrice ?? false) {
          if (discount > (data?.maxDiscountPrice ?? 0)) {
            discount = (data?.maxDiscountPrice ?? 0);
          }
        }
      }
    }
    return discount;
  }

  ShopVoucherBloc() : super(LoadingVouchers()) {
    on<SelectItemVouchers>((event, emit) async {
      List<ItemVoucherShop> list = [];
      num priceTemp = 0;
      list.addAll(state.listItemVoucher ?? []);
      if (list.isNotEmpty) {
        final check = list.where((element) => element.shopId == event.shopId);
        if (check.isNotEmpty) {
          for (ItemVoucherShop item in list) {
            if (event.shopId == item.shopId) {
              if (event.value.id != (item.voucherId?.id ?? '')) {
                list.remove(item);
                ItemVoucherShop voucher =
                ItemVoucherShop(shopId: event.shopId, voucherId: event.value);
                list.add(voucher);
              } else {
                //TODO
              }
            }
          }
        } else {
          ItemVoucherShop item =
              ItemVoucherShop(shopId: event.shopId, voucherId: event.value);
          list.add(item);
        }
      } else {
        ItemVoucherShop item =
            ItemVoucherShop(shopId: event.shopId, voucherId: event.value);
        list.add(item);
      }
      emit(state.copyWith(listItemVoucher: list));
    });

    on<SelectItemShippingVouchers>((event, emit) async {
      final List<ItemVoucherShipping> list = [];
      final List<ItemVoucherShipping> listNew = [];
      list.addAll(state.listItemVoucherShipping ?? []);
      if (list.isNotEmpty) {
        final check = list.where((element) => element.shopId == event.shopId);
        if (check.isNotEmpty) {
          for (ItemVoucherShipping item in list) {
            if (event.shopId == item.shopId) {
              if (event.value.id != (item.voucherId?.id ?? '')) {
                list.remove(item);
                ItemVoucherShipping voucher =
                ItemVoucherShipping(shopId: event.shopId, voucherId: event.value);
                list.add(voucher);
              }
            }
          }
        } else {
          ItemVoucherShipping item =
          ItemVoucherShipping(shopId: event.shopId, voucherId: event.value);
          list.add(item);
        }
      } else {
        ItemVoucherShipping item =
        ItemVoucherShipping(shopId: event.shopId, voucherId: event.value);
        list.add(item);
      }

      list.addAll(listNew);
      emit(state.copyWith(listItemVoucherShipping: list));
    });

    on<SetData>((event, emit) async  {
      for (var i in (event.data ?? [])) {
        if ((event.price < i.minimumOrderPrice!)) {
          i.isVisible = false;
        } else {
          i.isVisible = true;
        }
      }
      //TODO calculator shipping
      // num priceTemp = (event.price) - calculator(event.list ?? [], event.price);
      for (var i in (event.dataShipping ?? [])) {
        if ((event.price < i.minimumOrderPrice!)) {
          i.isVisible = false;
        } else {
          i.isVisible = true;
        }
      }
      emit(state.copyWith(
        data: event.data,
        dataShipping: event.dataShipping,
        listItemVoucher: event.list,
        listItemVoucherShipping: event.listShipping
      ));
    });

    on<CalculatorDiscount>((event, emit) {
      if ((state.listItemVoucherShipping ?? []).every((element) => element.voucherId?.isVisible == false)) {
        event.onData!(state.listItemVoucher ?? [], []);
      } else {
        event.onData!(state.listItemVoucher ?? [], state.listItemVoucherShipping ?? []);
      }
    });
  }
}

enum DiscountType { PRICE, PERCENTAGE }
