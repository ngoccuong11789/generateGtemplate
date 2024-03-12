// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provinces _$ProvincesFromJson(Map<String, dynamic> json) => Provinces(
      data: (json['data'] as List<dynamic>?)
          ?.map(DataProvinces.fromJson)
          .toList(),
    );

Map<String, dynamic> _$ProvincesToJson(Provinces instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
