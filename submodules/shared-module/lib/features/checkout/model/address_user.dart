import 'package:json_annotation/json_annotation.dart';

part 'address_user.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class AddressUserId {
  final String? id;
  final String? createdAt;
  final String? createdBy;
  final String? updatedAt;
  final String? updatedBy;
  final String? userFullName;
  final String? userPhoneNumber;
  final String? address;
  final String? countryId;
  final String? country;
  final String? cityId;
  final String? cityCode;
  final String? city;
  final String? districtId;
  final String? districtCode;
  final String? district;
  final String? wardId;
  final String? wardCode;
  final String? ward;
  final String? userId;
  final String addressType;
  final String? countryCode;
  final bool isDefault;

  AddressUserId(
      this.id,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.userFullName,
      this.userPhoneNumber,
      this.address,
      this.countryId,
      this.country,
      this.cityId,
      this.cityCode,
      this.city,
      this.districtId,
      this.districtCode,
      this.district,
      this.wardId,
      this.wardCode,
      this.ward,
      this.userId,
      this.addressType,
      this.countryCode,
      this.isDefault);

  factory AddressUserId.fromJson(Map<String, dynamic> json) {
    return _$AddressUserIdFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressUserIdToJson(this);
  }
}
