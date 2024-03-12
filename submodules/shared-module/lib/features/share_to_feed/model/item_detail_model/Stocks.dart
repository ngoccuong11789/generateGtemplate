import 'VariationFirst.dart';

class Stocks {
  Stocks({
      this.id, 
      this.productId, 
      this.variationFirstId, 
      this.variationSecondId, 
      this.variationFirst, 
      this.variationSecond, 
      this.orderFirst, 
      this.orderSecond, 
      this.quantity, 
      this.price, 
      this.originalPrice, 
      this.sku,});

  Stocks.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    variationFirstId = json['variation_first_id'];
    variationSecondId = json['variation_second_id'];
    variationFirst = json['variation_first'] != null ? VariationFirst.fromJson(json['variation_first']) : null;
    variationSecond = json['variation_second'];
    orderFirst = json['order_first'];
    orderSecond = json['order_second'];
    quantity = json['quantity'];
    price = json['price'];
    originalPrice = json['original_price'];
    sku = json['sku'];
  }
  String? id;
  String? productId;
  String? variationFirstId;
  dynamic variationSecondId;
  VariationFirst? variationFirst;
  dynamic variationSecond;
  num? orderFirst;
  num? orderSecond;
  num? quantity;
  num? price;
  num? originalPrice;
  String? sku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['variation_first_id'] = variationFirstId;
    map['variation_second_id'] = variationSecondId;
    if (variationFirst != null) {
      map['variation_first'] = variationFirst?.toJson();
    }
    map['variation_second'] = variationSecond;
    map['order_first'] = orderFirst;
    map['order_second'] = orderSecond;
    map['quantity'] = quantity;
    map['price'] = price;
    map['original_price'] = originalPrice;
    map['sku'] = sku;
    return map;
  }

}