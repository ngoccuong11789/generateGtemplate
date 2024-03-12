import 'package:json_annotation/json_annotation.dart';

part 'cod_response.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class CodResponse {
  final String? status;
  final num? orderTotal;
  final num? discounts;
  final num? paymentTotal;
  final String? createdAt;
  final List<Orders>? orders;
  final String? redirectUrl;
  final String? qrData;

  CodResponse(
      {this.status,
        this.orderTotal,
        this.discounts,
        this.paymentTotal,
        this.createdAt,
        this.orders,
        this.redirectUrl,
        this.qrData});

  factory CodResponse.fromJson(Map<String, dynamic> json) {
    return _$CodResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CodResponseToJson(this);
  }

  CodResponse copyWith({
    String? status,
    num? orderTotal,
    num? discounts,
    num? paymentTotal,
    String? createdAt,
    List<Orders>? orders,
    String? redirectUrl,
    String? qrData,
  }) {
    return CodResponse(
      status: status ?? this.status,
      orderTotal: orderTotal ?? this.orderTotal,
      discounts: discounts ?? this.discounts,
      paymentTotal: paymentTotal ?? this.paymentTotal,
      createdAt: createdAt ?? this.createdAt,
      orders: orders ?? this.orders,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      qrData: qrData ?? this.qrData,
    );
  }
}

/// id : "12085f28-ae61-4d47-af85-c7455187bbcc"

class Orders {
  Orders({
    String? id,}){
    _id = id;
  }

  Orders.fromJson(dynamic json) {
    _id = json['id'];
  }
  String? _id;
  Orders copyWith({  String? id,
  }) => Orders(  id: id ?? _id,
  );
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }

}
