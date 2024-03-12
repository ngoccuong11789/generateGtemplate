// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ward _$WardFromJson(Map<String, dynamic> json) => Ward(
      data: (json['data'] as List<dynamic>?)?.map(DataWard.fromJson).toList(),
    );

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
