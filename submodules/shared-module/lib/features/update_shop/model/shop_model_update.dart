import 'package:equatable/equatable.dart';

class ShopModelUpdate extends Equatable {
  final String merchantName;
  final String addressLineOne;
  final String addressLineTwo;

  const ShopModelUpdate({
    this.merchantName = "",
    this.addressLineOne = "",
    this.addressLineTwo = "",
  });

  ShopModelUpdate copyWith({
    String? merchantName,
    String? addressLineOne,
    String? addressLineTwo
  }) {
    return ShopModelUpdate(
        merchantName: merchantName ?? this.merchantName,
        addressLineOne: addressLineOne ?? this.addressLineOne,
        addressLineTwo: addressLineTwo ?? this.addressLineTwo
    );
  }

  @override
  List<Object?> get props => [
    merchantName,
    addressLineOne,
    addressLineTwo,
  ];
}
