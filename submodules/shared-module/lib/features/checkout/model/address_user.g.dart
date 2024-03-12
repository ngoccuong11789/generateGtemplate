// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressUserId _$AddressUserIdFromJson(Map<String, dynamic> json) =>
    AddressUserId(
      json['id'] as String?,
      json['created_at'] as String?,
      json['created_by'] as String?,
      json['updated_at'] as String?,
      json['updated_by'] as String?,
      json['user_full_name'] as String?,
      json['user_phone_number'] as String?,
      json['address'] as String?,
      json['country_id'] as String?,
      json['country'] as String?,
      json['city_id'] as String?,
      json['city_code'] as String?,
      json['city'] as String?,
      json['district_id'] as String?,
      json['district_code'] as String?,
      json['district'] as String?,
      json['ward_id'] as String?,
      json['ward_code'] as String?,
      json['ward'] as String?,
      json['user_id'] as String?,
      json['address_type'] as String,
      json['country_code'] as String?,
      json['is_default'] as bool,
    );

Map<String, dynamic> _$AddressUserIdToJson(AddressUserId instance) =>
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
