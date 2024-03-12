
import 'package:json_annotation/json_annotation.dart';

part 'order_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createPerFieldToJson: true)
class OrderResult {
  final String token;
  final String? paymentUrl;
  final int? expiredAt;

  OrderResult(
      {required this.token, required this.paymentUrl, required this.expiredAt});

  factory OrderResult.fromJson(Map<String, dynamic> json) =>
      _$OrderResultFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResultToJson(this);
}
