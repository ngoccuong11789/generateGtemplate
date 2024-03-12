// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDetailModel _$CountryDetailModelFromJson(Map<String, dynamic> json) =>
    CountryDetailModel(
      countryId: json['country_id'] as String,
      countryName: json['country_name'] as String,
      provinces: (json['provinces'] as List<dynamic>)
          .map((e) => LocationProvince.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryDetailModelToJson(CountryDetailModel instance) =>
    <String, dynamic>{
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'provinces': instance.provinces.map((e) => e.toJson()).toList(),
    };

LocationProvince _$LocationProvinceFromJson(Map<String, dynamic> json) =>
    LocationProvince(
      provinceId: json['province_id'] as String,
      provinceName: json['province_name'] as String,
    );

Map<String, dynamic> _$LocationProvinceToJson(LocationProvince instance) =>
    <String, dynamic>{
      'province_id': instance.provinceId,
      'province_name': instance.provinceName,
    };
