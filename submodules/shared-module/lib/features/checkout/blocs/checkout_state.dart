part of 'checkout_bloc.dart';

enum PaymentStatus {
  unknown,
  inProgress,
  succeeded,
  failed,
}

class CheckoutState extends Equatable {
  final CheckoutResponse? dataCheckout;
  final List<EntityDtos>? data;
  final PaymentStatus? paymentStatus;
  final num totalDiscount;
  final Map<String, List<ItemShipment>>? shipments;
  final num deliveryFee;
  final num deliveryDiscount;
  final AddressNewModel? addressSelected;
  final String token;
  final num priceProducts;
  final bool isCompareTotalShipmentSelected;

  const CheckoutState(
      {this.dataCheckout,
      this.totalDiscount = 0,
      this.priceProducts = 0,
      this.deliveryFee = 0,
      this.deliveryDiscount = 0,
      this.paymentStatus = PaymentStatus.unknown,
      this.addressSelected,
      this.token = '',
      this.isCompareTotalShipmentSelected = false,
      this.shipments,
      this.data});

  @override
  List<Object?> get props =>
      [dataCheckout, deliveryDiscount, paymentStatus, data, totalDiscount, shipments, deliveryFee, addressSelected, token, priceProducts, isCompareTotalShipmentSelected];

  CheckoutState copyWith({
    CheckoutResponse? dataCheckout,
    MethodPayment? methodPayments,
    DataMethodPayment? selectMethodPayment,
    PaymentStatus? paymentStatus,
    List<EntityDtos>? data,
    num? totalDiscount,
    Map<String, List<ItemShipment>>? shipments,
    num? deliveryFee,
    bool? isCompareTotalShipmentSelected,
    num? deliveryDiscount,
    num? priceProducts,
    AddressNewModel? addressSelected,
    String? token
  }) {
    return CheckoutState(
      dataCheckout: dataCheckout ?? this.dataCheckout,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      data: data ?? this.data,
      shipments: shipments ?? this.shipments,
      deliveryDiscount: deliveryDiscount ?? this.deliveryDiscount,
      addressSelected: addressSelected ?? this.addressSelected,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      token: token ?? this.token,
      isCompareTotalShipmentSelected: isCompareTotalShipmentSelected ?? this.isCompareTotalShipmentSelected,
      priceProducts: priceProducts ?? this.priceProducts,
      totalDiscount: totalDiscount ?? this.totalDiscount,
    );
  }
}

class CheckoutLoading extends CheckoutState {}
