// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      data: (json['data'] as List<dynamic>?)
          ?.map(DataCountries.fromJson)
          .toList(),
      error: json['error'],
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'error': instance.error,
      'success': instance.success,
    };
