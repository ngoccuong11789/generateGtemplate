part of 'my_cart_bloc.dart';

abstract class MyCartEvent extends Equatable {
  const MyCartEvent();
}

class GetDataMyCart extends MyCartEvent {
  final BUYTYPE buyType;
  final void Function(num, List<String>)? onData;

  const GetDataMyCart({required this.buyType, this.onData});

  @override
  List<Object?> get props => [];
}

class CalculatorDiscount extends MyCartEvent {
  final DataItemShopVoucher data;
  final num price;
  final void Function(num, List<String>)? onData;
  const CalculatorDiscount({required this.data, required this.price, required this.onData});

  @override
  List<Object?> get props => [data, price];
}

class CheckAll extends MyCartEvent {
  final bool isCheck;

  const CheckAll({required this.isCheck});
  @override
  List<Object?> get props => [isCheck];
}

class GetVoucher extends MyCartEvent {
  final EntityDtos shop;
  final void Function(List<DataItemShopVoucher>, List<DataItemVoucher>, num, String shopId)? onEvent;

  const GetVoucher({required this.shop, this.onEvent});

  @override
  List<Object?> get props => [shop, onEvent];
}

class CheckShopItem extends MyCartEvent {
  final bool isCheck;
  final String idShop;

  const CheckShopItem({
    required this.isCheck,
    required this.idShop,
  });
  @override
  List<Object?> get props => [isCheck, idShop];
}

class UpdateCartById extends MyCartEvent {
  final int quantity;
  final String productId;
  final String stockId;
  final String shopId;
  final String id;
  final UpdateCartByIdType type;
  const UpdateCartById(
      {required this.quantity,
      required this.productId,
      required this.stockId, required this.type,
      required this.shopId,
      required this.id});

  @override
  List<Object?> get props => [quantity, productId, stockId, shopId, id];
}

class CheckProductInShop extends MyCartEvent {
  final bool isCheck;
  final String idStock;
  final String idShop;

  const CheckProductInShop({
    required this.isCheck,
    required this.idStock,
    required this.idShop,
  });
  @override
  List<Object?> get props => [isCheck, idStock, idShop];
}

class DeleteItemCart extends MyCartEvent {
  final String id;
  final String stockId;
  const DeleteItemCart(
      {required this.stockId,
      required this.id});

  @override
  List<Object?> get props => [id, stockId];
}

class UpdateDiscount extends MyCartEvent {
  final List<ItemVoucherShop> list;
  final List<ItemVoucherShipping> listShipping;
  const UpdateDiscount({this.list = const [], this.listShipping = const []});

  @override
  List<Object?> get props => [];
}

class FetchDataShopVoucher extends MyCartEvent {
  final List<EntityDtos> shops;

  const FetchDataShopVoucher({required this.shops});

  @override
  List<Object?> get props => [shops,];
}