// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      countryId: json['country_id'] as String?,
      countryName: json['country_name'] as String?,
      code: json['code'] as num?,
      codeName: json['code_name'] as String?,
      supportType: json['support_type'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as num?,
      updatedAt: json['updated_at'] as num?,
      provinces: json['provinces'],
      longitude: json['longitude'] as num?,
      latitude: json['latitude'] as num?,
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'code': instance.code,
      'code_name': instance.codeName,
      'support_type': instance.supportType,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'provinces': instance.provinces,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
