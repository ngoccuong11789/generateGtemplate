part of 'shop_voucher_bloc.dart';

abstract class ShopVoucherEvent extends Equatable {
  const ShopVoucherEvent();
}

class SelectItemVouchers extends ShopVoucherEvent {
  final DataItemShopVoucher value;
  final String shopId;
  final num price;
  const SelectItemVouchers({required this.value, required this.shopId, required this.price});

  @override
  List<Object?> get props => [value, shopId, price];
}

class SelectItemShippingVouchers extends ShopVoucherEvent {
  final DataItemVoucher value;
  final String shopId;
  const SelectItemShippingVouchers({required this.value, required this.shopId});

  @override
  List<Object?> get props => [value, shopId];
}

class CalculatorDiscount extends ShopVoucherEvent {
  final void Function(List<ItemVoucherShop>, List<ItemVoucherShipping>)? onData;
  final num? price;
  const CalculatorDiscount({required this.onData, this.price});

  @override
  List<Object?> get props => [];
}

class SetData extends ShopVoucherEvent {
  final List<DataItemShopVoucher>? data;
  final List<DataItemVoucher>? dataShipping;
  final List<ItemVoucherShop>? list;
  final num price;
  final List<ItemVoucherShipping>? listShipping;
  const SetData({this.data, this.dataShipping, this.list, this.listShipping, required this.price});

  @override
  List<Object?> get props => [data, dataShipping, price];
}
