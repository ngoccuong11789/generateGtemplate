part of 'my_cart_bloc.dart';

class GetMyCartState extends Equatable {
  final BUYTYPE? buyType;
  final CartResponse? data;
  final List<EntityDtos> shops;
  final List<CheckVoucherShop> checkVoucherShop;
  final Set<String> selectedShops;
  final Set<String> selectedVouchers;
  final Set<String> selectedProducts;
  final int selectedItemCount;
  final bool isSelectedAll;
  final num price;
  final num discount;
  final num deliveryFee;
  final num totalProduct;
  final MyCartStatus status;
  final bool loading;
  final List<ItemVoucherShop> listVoucherSelect;
  final List<ItemVoucherShipping> listVoucherSelectShipping;

  const GetMyCartState(
      {this.shops = const [],
      this.data,
      this.checkVoucherShop = const [],
      this.selectedShops = const {},
      this.selectedVouchers = const {},
      this.selectedProducts = const {},
      this.selectedItemCount = 0,
      this.isSelectedAll = false,
      this.price = 0,
      this.status = MyCartStatus.init,
      this.discount = 0,
      this.buyType,
      this.loading = false,
      this.deliveryFee = 0,
      this.totalProduct = 0,
      this.listVoucherSelect = const [],
      this.listVoucherSelectShipping = const []});

  @override
  List<Object?> get props => [
        shops,
        data,
        selectedShops,
        selectedProducts,
        checkVoucherShop,
        selectedVouchers,
        selectedItemCount,
        isSelectedAll,
        price,
        discount,
        deliveryFee,
        totalProduct,
        status,
        loading,
        listVoucherSelect,
        listVoucherSelectShipping
      ];

  GetMyCartState copyWith(
      {BUYTYPE? buyType,
      List<EntityDtos>? shops,
      CartResponse? data,
      Set<String>? selectedShops,
      Set<String>? selectedProducts,
      Set<String>? selectedVouchers,
      List<CheckVoucherShop>? checkVoucherShop,
      int? selectedItemCount,
      bool? isSelectedAll,
      num? price,
      num? discount,
      num? deliveryFee,
      num? totalProduct,
      bool? loading,
      MyCartStatus? status,
      List<ItemVoucherShop>? listVoucherSelect,
      List<ItemVoucherShipping>? listVoucherSelectShipping}) {
    return GetMyCartState(
        shops: shops ?? this.shops,
        data: data ?? this.data,
        selectedShops: selectedShops ?? this.selectedShops,
        selectedProducts: selectedProducts ?? this.selectedProducts,
        selectedItemCount: selectedItemCount ?? this.selectedItemCount,
        selectedVouchers: selectedVouchers ?? this.selectedVouchers,
        isSelectedAll: isSelectedAll ?? this.isSelectedAll,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        buyType: buyType ?? this.buyType,
        totalProduct: totalProduct ?? this.totalProduct,
        checkVoucherShop: checkVoucherShop ?? this.checkVoucherShop,
        status: status ?? this.status,
        loading: loading ?? this.loading,
        listVoucherSelect: listVoucherSelect ?? this.listVoucherSelect,
        listVoucherSelectShipping:
            listVoucherSelectShipping ?? this.listVoucherSelectShipping);
  }
}

class LoadingData extends GetMyCartState {}
