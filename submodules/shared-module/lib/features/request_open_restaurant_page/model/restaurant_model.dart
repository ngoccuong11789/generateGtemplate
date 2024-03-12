import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String merchantName;
  final String addressLineOne;
  final String addressLineTwo;

  const RestaurantModel({
    this.merchantName = "",
    this.addressLineOne = "",
    this.addressLineTwo = "",
  });

  RestaurantModel copyWith({
    String? merchantName,
    String? addressLineOne,
    String? addressLineTwo
  }) {
    return RestaurantModel(
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
