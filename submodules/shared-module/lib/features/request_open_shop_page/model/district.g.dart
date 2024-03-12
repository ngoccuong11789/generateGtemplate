// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      data:
          (json['data'] as List<dynamic>?)?.map(DataDistrict.fromJson).toList(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
