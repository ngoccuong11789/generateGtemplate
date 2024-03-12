part of 'shop_voucher_bloc.dart';

class ShopVoucherState extends Equatable {
  final List<DataItemShopVoucher>? data;
  final List<DataItemVoucher>? dataShipping;
  final List<ItemVoucherShop>? listItemVoucher;
  final List<ItemVoucherShipping>? listItemVoucherShipping;

  const ShopVoucherState(
      {this.data,
      this.dataShipping,
      this.listItemVoucher,
      this.listItemVoucherShipping});

  ShopVoucherState copyWith(
      {List<DataItemShopVoucher>? data,
      List<DataItemVoucher>? dataShipping,
      List<ItemVoucherShop>? listItemVoucher, num? priceTemp,
      List<ItemVoucherShipping>? listItemVoucherShipping}) {
    return ShopVoucherState(
        data: data ?? this.data,
        dataShipping: dataShipping ?? this.dataShipping,
        listItemVoucher: listItemVoucher ?? this.listItemVoucher,
        listItemVoucherShipping:
            listItemVoucherShipping ?? this.listItemVoucherShipping);
  }

  @override
  List<Object?> get props =>
      [data, dataShipping, listItemVoucher, listItemVoucherShipping];
}

class LoadingVouchers extends ShopVoucherState {}
