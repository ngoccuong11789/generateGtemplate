// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provinces _$ProvincesFromJson(Map<String, dynamic> json) => Provinces(
      provinceId: json['province_id'] as String?,
      countryId: json['country_id'] as String?,
      countryName: json['country_name'] as String?,
      provinceName: json['province_name'] as String?,
      code: json['code'] as num?,
      codeName: json['code_name'] as String?,
      supportType: json['support_type'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as num?,
      updatedAt: json['updated_at'] as num?,
      districts: json['districts'],
      longitude: json['longitude'] as num?,
      latitude: json['latitude'] as num?,
    );

Map<String, dynamic> _$ProvincesToJson(Provinces instance) => <String, dynamic>{
      'province_id': instance.provinceId,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'province_name': instance.provinceName,
      'code': instance.code,
      'code_name': instance.codeName,
      'support_type': instance.supportType,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'districts': instance.districts,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
