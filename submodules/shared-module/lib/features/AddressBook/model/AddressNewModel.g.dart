// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddressNewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressNewModel _$AddressNewModelFromJson(Map<String, dynamic> json) =>
    AddressNewModel(
      userFullName: json['user_full_name'] as String?,
      userPhoneNumber: json['user_phone_number'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      ward: json['ward'] as String?,
      addressType: json['address_type'] as String?,
      isDefault: json['is_default'] as bool?,
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
      countryId: json['country_id'] as String?,
      country: json['country'] as String?,
      cityId: json['city_id'] as String?,
      cityCode: json['city_code'] as String?,
      districtId: json['district_id'] as String?,
      districtCode: json['district_code'] as String?,
      wardId: json['ward_id'] as String?,
      wardCode: json['ward_code'] as String?,
      userId: json['user_id'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$AddressNewModelToJson(AddressNewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'user_full_name': instance.userFullName,
      'user_phone_number': instance.userPhoneNumber,
      'address': instance.address,
      'country_id': instance.countryId,
      'country': instance.country,
      'city_id': instance.cityId,
      'city_code': instance.cityCode,
      'city': instance.city,
      'district_id': instance.districtId,
      'district_code': instance.districtCode,
      'district': instance.district,
      'ward_id': instance.wardId,
      'ward_code': instance.wardCode,
      'ward': instance.ward,
      'user_id': instance.userId,
      'address_type': instance.addressType,
      'country_code': instance.countryCode,
      'is_default': instance.isDefault,
    };
