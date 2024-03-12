part of 'checkout_bloc.dart';

sealed class CheckoutEvent {}

class LoadListAddress extends CheckoutEvent {
  LoadListAddress();

  List<Object?> get props => [];
}

class ActionCheckOut extends CheckoutEvent {
  final List<EntityDtos> shop;
  final String addressId;
  final BuildContext context;
  final BUYTYPE? buyType;
  Map<String, String> note = {};
  Map<String, ItemShipment> shippingCode = {};
  Map<String, bool> invoices = {};
  List<ItemVoucherShipping> listSelectVoucherShipping;
  List<ItemVoucherShop> listSelectVoucher;

  ActionCheckOut(
      {required this.addressId,
      required this.shop,
      required this.context,
      required this.buyType,
      required this.note,
      required this.shippingCode,
      required this.invoices,
      required this.listSelectVoucherShipping,
      required this.listSelectVoucher});

  List<Object?> get props => [
        context,
        shop,
        addressId,
        note,
        invoices,
        shippingCode,
        listSelectVoucherShipping,
        listSelectVoucher
      ];
}

class SelectedAddress extends CheckoutEvent {
  final AddressNewModel address;
  final List<EntityDtos> data;
  SelectedAddress({required this.address, required this.data});
  List<Object?> get props => [address, data];
}

class SetDefaultAddress extends CheckoutEvent {
  final AddressNewModel address;
  SetDefaultAddress({required this.address});
  List<Object?> get props => [address];
}

class SetDefaultShipment extends CheckoutEvent {
  final List<EntityDtos> dataShop;
  final Map<String, ItemShipment> shippingCode;
  SetDefaultShipment({required this.dataShop, required this.shippingCode});
  List<Object?> get props => [dataShop, shippingCode];
}

class GetShipment extends CheckoutEvent {
  final AddressNewModel address;
  final EntityDtos shop;

  GetShipment({required this.address, required this.shop});

  List<Object?> get props => [address, shop];
}

class SetPriceDelivery extends CheckoutEvent {
  final ItemShipment item;
  final String shopId;
  final List<ItemVoucherShipping> listSelectVoucherShipping;

  SetPriceDelivery({required this.item, required this.listSelectVoucherShipping, required this.shopId});

  List<Object?> get props => [item, listSelectVoucherShipping, shopId];
}
