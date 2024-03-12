import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderRequest {
  final String addressId;
  final List<String> voucherIds;
  final String successCallback;
  final String failCallback;
  final List<Order> orders;

  OrderRequest(
      {required this.addressId,
      this.voucherIds = const [],
      required this.successCallback,
      required this.failCallback,
      required this.orders});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Order {
  final String? vendorId;
  final List<Offering> data;
  final List<String> voucherIds;
  final String? note;
  final String shippingCode;
  final num amount;
  final bool isInvoiceExact;

  Order(
      {required this.vendorId,
      required this.data,
      required this.voucherIds,
      required this.note,
      required this.shippingCode,
      required this.amount,
      required this.isInvoiceExact});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Offering {
  final String stockId;
  final int quantity;

  Offering({required this.stockId, required this.quantity});

  factory Offering.fromJson(Map<String, dynamic> json) =>
      _$OfferingFromJson(json);

  Map<String, dynamic> toJson() => _$OfferingToJson(this);
}
