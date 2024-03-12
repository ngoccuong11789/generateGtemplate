// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoShop _$LogoShopFromJson(Map<String, dynamic> json) => LogoShop(
      data: json['data'] == null ? null : DataFile.fromJson(json['data']),
      success: json['success'] as bool?,
      error: json['error'],
    );

Map<String, dynamic> _$LogoShopToJson(LogoShop instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
      'success': instance.success,
      'error': instance.error,
    };
