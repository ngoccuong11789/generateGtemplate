import 'package:equatable/equatable.dart';

// merchantName,
// address1,

class ShopModel extends Equatable {
  final String merchantName;
  final String addressShop;
  final String subStreet;

  const ShopModel({
    this.merchantName = "",
    this.addressShop = "",
    this.subStreet = "",
  });

  ShopModel copyWith({
    String? merchantName,
    String? addressShop,
    String? subStreet
  }) {
    return ShopModel(
      merchantName: merchantName ?? this.merchantName,
      addressShop: addressShop ?? this.addressShop,
      subStreet: subStreet ?? this.subStreet
    );
  }

  @override
  List<Object?> get props => [
        merchantName,
        addressShop,
        subStreet,
      ];
}
