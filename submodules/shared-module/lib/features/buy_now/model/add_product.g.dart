// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProduct _$AddProductFromJson(Map<String, dynamic> json) => AddProduct(
      json['product_id'] as String?,
      json['stock_id'] as String?,
      json['shop_id'] as String?,
      json['quantity'] as num?,
    );

Map<String, dynamic> _$AddProductToJson(AddProduct instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'stock_id': instance.stockId,
      'shop_id': instance.shopId,
      'quantity': instance.quantity,
    };
