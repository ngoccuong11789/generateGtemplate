// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDetailModel _$ItemDetailModelFromJson(Map<String, dynamic> json) =>
    ItemDetailModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as num?,
      originalPrice: json['original_price'] as num?,
      strSku: json['str_sku'] as String?,
      quantity: json['quantity'] as num?,
      avatar: json['avatar'] == null ? null : Avatar.fromJson(json['avatar']),
      description: json['description'] as String?,
      subLabel: json['sub_label'] as String?,
      prices: (json['prices'] as List<dynamic>?)?.map(Prices.fromJson).toList(),
      stocks: (json['stocks'] as List<dynamic>?)?.map(Stocks.fromJson).toList(),
      point: json['point'] as num?,
      sumReview: json['sum_review'] as num?,
      reviews:
          (json['reviews'] as List<dynamic>?)?.map(Reviews.fromJson).toList(),
      restaurantSectionIds: json['restaurant_section_ids'],
      restaurantFood: json['restaurant_food'] == null
          ? null
          : RestaurantFood.fromJson(json['restaurant_food']),
      catalogs:
          (json['catalogs'] as List<dynamic>?)?.map(Catalogs.fromJson).toList(),
      catalogIds: (json['catalog_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attributes: json['attributes'] as List<dynamic>?,
      hashtags: (json['hashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map(Attachments.fromJson)
          .toList(),
      restaurantDetailDTO: json['restaurant_detail_d_t_o'],
      isPricingDefault: json['is_pricing_default'] as bool?,
      isPublic: json['is_public'] as bool?,
      isBookmark: json['is_bookmark'] as bool?,
    );

Map<String, dynamic> _$ItemDetailModelToJson(ItemDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'str_sku': instance.strSku,
      'quantity': instance.quantity,
      'avatar': instance.avatar?.toJson(),
      'description': instance.description,
      'sub_label': instance.subLabel,
      'prices': instance.prices?.map((e) => e.toJson()).toList(),
      'stocks': instance.stocks?.map((e) => e.toJson()).toList(),
      'point': instance.point,
      'sum_review': instance.sumReview,
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
      'restaurant_section_ids': instance.restaurantSectionIds,
      'restaurant_food': instance.restaurantFood?.toJson(),
      'catalogs': instance.catalogs?.map((e) => e.toJson()).toList(),
      'catalog_ids': instance.catalogIds,
      'hashtags': instance.hashtags,
      'attributes': instance.attributes,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'restaurant_detail_d_t_o': instance.restaurantDetailDTO,
      'is_pricing_default': instance.isPricingDefault,
      'is_public': instance.isPublic,
      'is_bookmark': instance.isBookmark,
    };
