import 'package:json_annotation/json_annotation.dart';

part 'add_product.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class AddProduct {
  final String? productId;
  final String? stockId;
  final String? shopId;
  final num? quantity;

  AddProduct(this.productId, this.stockId, this.shopId, this.quantity);

  factory AddProduct.fromJson(Map<String, dynamic> json) {
    return _$AddProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductToJson(this);
  }
}
