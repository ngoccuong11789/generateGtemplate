import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AddressNewModel.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class AddressNewModel extends Equatable {
  AddressNewModel({
    this.userFullName,
    this.userPhoneNumber,
    this.address,
    this.city,
    this.district,
    this.ward,
    this.addressType,
    this.isDefault,
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.countryId,
    this.country,
    this.cityId,
    this.cityCode,
    this.districtId,
    this.districtCode,
    this.wardId,
    this.wardCode,
    this.userId,
    this.countryCode,
  });

  String? id;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? userFullName;
  String? userPhoneNumber;
  String? address;
  String? countryId;
  String? country;
  String? cityId;
  String? cityCode;
  String? city;
  String? districtId;
  String? districtCode;
  String? district;
  String? wardId;
  String? wardCode;
  String? ward;
  String? userId;
  String? addressType;
  String? countryCode;
  bool? isDefault;

  factory AddressNewModel.fromJson(Map<String, dynamic> json) {
    json["ward_id"] ??= json["wardId"];
    json["district_id"] ??= json["districtId"];
    json["city_id"] ??= json["cityId"];
    json["country_id"] ??= json["countryId"];
    return _$AddressNewModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressNewModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  AddressNewModel copyWith({
    String? id,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    String? userFullName,
    String? userPhoneNumb,
    String? address,
    String? countryId,
    String? country,
    String? cityId,
    String? cityCode,
    String? city,
    String? districtId,
    String? districtCode,
    String? district,
    String? wardId,
    String? wardCode,
    String? ward,
    String? userId,
    String? addressType,
    String? countryCode,
    bool? isDefault,
  }) =>
      AddressNewModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
        userFullName: userFullName ?? this.userFullName,
        userPhoneNumber: userPhoneNumb ?? userPhoneNumber,
        address: address ?? this.address,
        countryId: countryId ?? this.countryId,
        country: country ?? this.country,
        cityId: cityId ?? this.cityId,
        cityCode: cityCode ?? this.cityCode,
        city: city ?? this.city,
        districtId: districtId ?? this.districtId,
        districtCode: districtCode ?? this.districtCode,
        district: district ?? this.district,
        wardId: wardId ?? this.wardId,
        wardCode: wardCode ?? this.wardCode,
        ward: ward ?? this.ward,
        userId: userId ?? this.userId,
        addressType: addressType ?? this.addressType,
        countryCode: countryCode ?? this.countryCode,
        isDefault: isDefault ?? this.isDefault,
      );

  @override
  List<Object?> get props => [];

  clearCity() {
    city = null;
    cityCode = null;
    cityId = null;
  }

  clearDistrict() {
    district = null;
    districtCode = null;
    districtId = null;
  }

  clearWard() {
    ward = null;
    wardCode = null;
    wardId = null;
  }

  bool validate() {
    if ((ward == null || ward!.isEmpty) ||
        (city == null || city!.isEmpty) ||
        (country == null || country!.isEmpty) ||
        (userFullName == null || userFullName!.isEmpty) ||
        (district == null || district!.isEmpty) ||
        (address == null || address!.isEmpty) ||
        (userPhoneNumber == null || userPhoneNumber!.isEmpty)) {
      return true;
    }
    return false;
  }


}
