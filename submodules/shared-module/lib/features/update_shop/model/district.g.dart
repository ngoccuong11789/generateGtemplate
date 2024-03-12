// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      districtId: json['district_id'] as String?,
      provinceId: json['province_id'] as String?,
      districtName: json['district_name'] as String?,
      code: json['code'] as num?,
      codeName: json['code_name'] as String?,
      supportType: json['support_type'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as num?,
      updatedAt: json['updated_at'] as num?,
      longitude: json['longitude'] as num?,
      latitude: json['latitude'] as num?,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'district_id': instance.districtId,
      'province_id': instance.provinceId,
      'district_name': instance.districtName,
      'code': instance.code,
      'code_name': instance.codeName,
      'support_type': instance.supportType,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
