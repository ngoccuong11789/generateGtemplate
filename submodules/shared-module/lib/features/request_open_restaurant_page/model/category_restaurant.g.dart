// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRestaurant _$CategoryRestaurantFromJson(Map<String, dynamic> json) =>
    CategoryRestaurant(
      data: (json['data'] as List<dynamic>?)?.map(Category.fromJson).toList(),
    );

Map<String, dynamic> _$CategoryRestaurantToJson(CategoryRestaurant instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
