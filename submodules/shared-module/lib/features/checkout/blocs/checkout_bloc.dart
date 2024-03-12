import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/checkout/model/checkout_response.dart';
import 'package:shared_module/features/checkout/model/city_model.dart';
import 'package:shared_module/features/checkout/model/countries.dart';
import 'package:shared_module/features/checkout/model/district_model.dart';
import 'package:shared_module/features/checkout/model/dto_billing_address.dart';
import 'package:shared_module/features/checkout/model/dto_get_shipment.dart';
import 'package:shared_module/features/checkout/model/dto_payment_request.dart';
import 'package:shared_module/features/checkout/model/method_payment.dart';
import 'package:shared_module/features/checkout/model/order_request.dart';
import 'package:shared_module/features/checkout/model/payment_response.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookService.dart';
import 'package:shared_module/features/checkout/api/checkout_controller.dart';
import 'package:shared_module/features/vouchers/api/shop_voucher_controller.dart';
import 'package:shared_module/features/vouchers/bloc/shop_voucher_bloc.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/ecommerce_and_food_payment_util.dart';

import '../../my_cart/view/my_cart_screen.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final AddressBookService service;
  final CheckoutController checkOutController =
      CheckoutController(SharedModule.appDelegates!.dio);
  final ShopVouchersController controller =
  ShopVouchersController(SharedModule.appDelegates!.dio);
  late num totalDiscount = 0;
  late num deliveryFee = 0;
  late num discountDelivery = 0;
  late Map<String, ItemShipment> listSelectedShipment = {};
  late String nameVoucherShop = '';
  late String nameVoucherShipping = '';

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

  num calculatorShipping(List<dynamic> list, num priceDelivery) {
    late num discount = 0;
    if (priceDelivery == 0) return 0;
    if (list.isNotEmpty) {
      final data = list[0].voucherId;
      discount += (priceDelivery * (data.discountPercent ?? 0)) / 100;
      if (data.isLimitDiscountAmount ?? false) {
        if (discount > (data.maxDiscountPrice ?? 0)) {
          discount = (data.maxDiscountPrice ?? 0);
        }
      }
    }
    return discount;
  }

  void genNameVoucher(List<ItemVoucherShop> listVoucherShop, List<ItemVoucherShipping> listVoucherShipping, String shopId ) {
    final voucherShop = listVoucherShop.where((element) => element.shopId == shopId).toList();
    if (voucherShop.isNotEmpty) {
      nameVoucherShop = voucherShop[0].voucherId?.name?? '';
    }
    final voucherShipping = listVoucherShipping.where((element) => element.shopId == shopId).toList();
    if (voucherShipping.isNotEmpty) {
      nameVoucherShipping = voucherShipping[0].voucherId?.name?? '';
    }
  }

  double roundDouble(double value, int places){
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  CheckoutBloc({
    required this.service,
  }) : super(CheckoutLoading()) {
    on<ActionCheckOut>(((event, emit) async {
      final List<Order> orders = [];
      num priceProducts = 0;
      num subtotal = 0;
      num totalDiscount = 0;
      num discount = 0;
      num discountDelivery = 0;
      String shopVoucher = '';
      String shippingVoucher = '';
      List<String> vouchersName = [];

      for (EntityDtos item in event.shop) {
        List<Offering> products = [];
        final isInvoice = event.invoices[item.id] ?? false;
        final shippingCode = event.shippingCode[item.id];
        final note = event.note[item.id];

        genNameVoucher(event.listSelectVoucher, event.listSelectVoucherShipping, item.id ?? '');
        if (nameVoucherShipping != '') {
          vouchersName.add(nameVoucherShipping);
          if (nameVoucherShop != '') {
            vouchersName.add(nameVoucherShop);
          }
        } else {
          if (nameVoucherShop != '') {
            vouchersName.add(nameVoucherShop);
          }
        }

        final checkVoucherShop = event.listSelectVoucher.where((element) => element.shopId == item.id).toList();
        if (checkVoucherShop.isNotEmpty) {
          shopVoucher = checkVoucherShop[0].voucherId?.id ?? '';
        }
        //TODO
        // final checkVoucherShipping = event.listSelectVoucherShipping.where((element) => element.shopId == item.id).toList();
        // if (checkVoucherShipping.isNotEmpty) {
        //   shippingVoucher = checkVoucherShipping[0].voucherId?.id ?? '';
        // }

        for (ObjectDtOs i in item.objectDTOs ?? []) {
          priceProducts += (i.quantity ?? 0) * (i.stockDetail?.price ?? 0);
          products.add(Offering(
              quantity: i.quantity?.toInt() ?? 0, stockId: i.stockId ?? ""));
        }

        String totalFee = ((shippingCode?.totalFee ?? 0) / 20000).toStringAsFixed(3);
        double deliveryFee = double.parse(totalFee);
        double totalFeeDouble = roundDouble(deliveryFee, 2);

        discount = calculator(checkVoucherShop, priceProducts);
        totalDiscount += discount;
        discountDelivery = 0;
        //TODO
        // discountDelivery += calculatorShipping(checkVoucherShipping, totalFeeDouble);

        if (shopVoucher != '') {
          if (shippingVoucher != '') {
            orders.add(Order(
                vendorId: item.id,
                data: products,
                voucherIds: [shopVoucher, shippingVoucher],
                note: note,
                amount: (priceProducts - discount + totalFeeDouble - discountDelivery),
                isInvoiceExact: isInvoice,
                shippingCode: shippingCode?.id ?? ''));
          } else {
            orders.add(Order(
                vendorId: item.id,
                data: products,
                voucherIds: [shopVoucher],
                note: note,
                amount: (priceProducts - discount + totalFeeDouble),
                isInvoiceExact: isInvoice,
                shippingCode: shippingCode?.id ?? ''));
          }
        } else {
          if (shippingVoucher != '') {
            orders.add(Order(
                vendorId: item.id,
                data: products,
                voucherIds: [shippingVoucher],
                note: note,
                amount: (priceProducts +  totalFeeDouble - discountDelivery),
                isInvoiceExact: isInvoice,
                shippingCode: shippingCode?.id ?? ''));
          } else {

            print("object $totalFeeDouble");
            print("priceProducts $priceProducts");
            print("discount $discount");
            print("discountDelivery $discountDelivery");

            orders.add(Order(
                vendorId: item.id,
                data: products,
                voucherIds: [],
                note: note,
                amount: (priceProducts + totalFeeDouble),
                isInvoiceExact: isInvoice,
                shippingCode: shippingCode?.id ?? ''));
          }
        }

        subtotal += priceProducts;
        priceProducts = 0;
        shopVoucher = '';
        shippingVoucher = '';
        nameVoucherShop = '';
        nameVoucherShipping = '';
      }
      if (event.buyType == BUYTYPE.ecommerce) {
        final orderResult = await checkOutController.placeOrder(OrderRequest(
            addressId: event.addressId,
            successCallback: EcommerceAndFoodPaymentUtils.successCallbackUrl,
            failCallback: EcommerceAndFoodPaymentUtils.failCallbackUrl,
            orders: orders));
        emit(state.copyWith(
            token: orderResult.token,
            totalDiscount: totalDiscount,
            priceProducts: subtotal));
      } else {
        // TODO handle other cases.
      }
    }));

    on<SetPriceDelivery>(((event, emit) async {
      num deliveryDiscount = state.deliveryDiscount;
      if (listSelectedShipment.containsKey(event.shopId)) {

        String totalFeeOld = ((listSelectedShipment[event.shopId]?.totalFee ?? 0) / 20000).toStringAsFixed(3);
        double tamp = double.parse(totalFeeOld);
        double deliveryDiscountOld = roundDouble(tamp, 2);

        String totalFeeNew = ((event.item.totalFee ?? 0) / 20000).toStringAsFixed(3);
        double deliveryDiscountNew = double.parse(totalFeeNew);
        double fee = roundDouble(deliveryDiscountNew, 2);

        num deliverFeeTemp = (state.deliveryFee) - (deliveryDiscountOld) + fee;

        final checkVoucherShipping = event.listSelectVoucherShipping.where((element) => element.shopId == event.shopId).toList();
        if (checkVoucherShipping.isNotEmpty) {
          deliveryDiscount = calculatorShipping(checkVoucherShipping, deliveryDiscountNew);
        }

        listSelectedShipment[event.shopId] = event.item;
        emit(state.copyWith(deliveryDiscount: deliveryDiscount, deliveryFee: deliverFeeTemp));

      } else {
        listSelectedShipment[event.shopId] = event.item;
        String totalFee = ((event.item.totalFee ?? 0) / 20000).toStringAsFixed(3);
        double totalFeeDouble = double.parse(totalFee);
        double fee = roundDouble(totalFeeDouble, 2);

        deliveryFee = state.deliveryFee + fee;

        final checkVoucherShipping = event.listSelectVoucherShipping.where((element) => element.shopId == event.shopId).toList();
        discountDelivery += calculatorShipping(checkVoucherShipping, totalFeeDouble);
        emit(state.copyWith(deliveryDiscount: discountDelivery, deliveryFee: deliveryFee));
      }
    }));

    on<SelectedAddress>(((event, emit) async {
      for (var i in event.data) {
        add(GetShipment(address: event.address, shop: i));
      }
      emit(state.copyWith(addressSelected: event.address));
    }));

    on<SetDefaultAddress>(((event, emit) async {
      emit(state.copyWith(addressSelected: event.address));
    }));

    on<SetDefaultShipment>(((event, emit) async {
      int count = 0;
      for (var item in event.dataShop) {
        final shipment = event.shippingCode[item.id];
        if (shipment != null) {
          count ++;
        }
      }

      if (count == event.dataShop.length) {
        emit(state.copyWith(isCompareTotalShipmentSelected: true));
      }
    }));

    on<GetShipment>(((event, emit) async {
      List<ProductsShipment> list = [];
      AddressFrom addressFrom = AddressFrom(
          name: event.shop.shopAddress?.name ?? '',
          phone: event.shop.shopAddress?.phone ?? '',
          ward: event.shop.shopAddress?.ward?.id ?? '',
          district: event.shop.shopAddress?.district?.id ?? '',
          city: event.shop.shopAddress?.province?.id ?? '');

      AddressTo addressTo = AddressTo(
          name: event.address.userFullName,
          phone: event.address.userPhoneNumber,
          ward: event.address.wardId,
          district: event.address.districtId,
          city: event.address.cityId);

      for (ObjectDtOs item in (event.shop.objectDTOs ?? [])) {
        list.add(ProductsShipment(stockId: item.stockId ?? '', quantity: item.quantity ?? 0));
      }
      DtoGetShipment dto = DtoGetShipment(addressFrom: addressFrom, addressTo: addressTo, products: list);

      final data = await checkOutController.getShipment(dto);
      final shopId = event.shop.id!;
      emit(state.copyWith(shipments: {...?state.shipments, shopId: data}));
    }));
  }
}
