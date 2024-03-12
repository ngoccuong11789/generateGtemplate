import 'package:json_annotation/json_annotation.dart';

import 'Avatar.dart';
import 'Prices.dart';
import 'Stocks.dart';
import 'Reviews.dart';
import 'RestaurantFood.dart';
import 'Catalogs.dart';
import 'Attachments.dart';

part 'ItemDetailModel.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true
)

class ItemDetailModel {
 final String? id;
 final String? name;
 final num? price;
 final num? originalPrice;
 final String? strSku;
 final num? quantity;
 final Avatar? avatar;
 final String? description;
 final String? subLabel;
 final List<Prices>? prices;
 final List<Stocks>? stocks;
 final num? point;
 final num? sumReview;
 final List<Reviews>? reviews;
 final dynamic restaurantSectionIds;
 final RestaurantFood? restaurantFood;
 final List<Catalogs>? catalogs;
 final List<String>? catalogIds;
 final List<String>? hashtags;
 final List<dynamic>? attributes;
 final List<Attachments>? attachments;
 final dynamic restaurantDetailDTO;
 final bool? isPricingDefault;
 final bool? isPublic;
 final bool? isBookmark;

  ItemDetailModel({
      this.id, 
      this.name, 
      this.price, 
      this.originalPrice, 
      this.strSku, 
      this.quantity, 
      this.avatar, 
      this.description, 
      this.subLabel, 
      this.prices, 
      this.stocks, 
      this.point, 
      this.sumReview, 
      this.reviews, 
      this.restaurantSectionIds, 
      this.restaurantFood, 
      this.catalogs, 
      this.catalogIds, 
      this.attributes, 
      this.hashtags, 
      this.attachments,
      this.restaurantDetailDTO, 
      this.isPricingDefault, 
      this.isPublic, 
      this.isBookmark,});

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetailModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}