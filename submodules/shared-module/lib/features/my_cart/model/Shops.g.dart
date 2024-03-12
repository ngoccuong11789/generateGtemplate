// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Shops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataMyCart _$DataMyCartFromJson(Map<String, dynamic> json) => DataMyCart(
      userId: json['user_id'] as String?,
      shops: (json['shops'] as List<dynamic>?)?.map(Shops.fromJson).toList(),
      totalItems: json['total_items'] as int?,
    );

Map<String, dynamic> _$DataMyCartToJson(DataMyCart instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'shops': instance.shops?.map((e) => e.toJson()).toList(),
      'total_items': instance.totalItems,
    };
