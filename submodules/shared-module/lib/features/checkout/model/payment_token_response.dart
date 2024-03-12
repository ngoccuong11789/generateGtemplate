import 'package:json_annotation/json_annotation.dart';

part 'payment_token_response.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PaymentTokenResponse {
  final String? id;
  final String? orderType;
  final String? addressId;
  final List<dynamic>? voucherIds;
  final List<Orders>? orders;
  final String? callBackUrl;
  final num? subtotalFee;
  final num? deliveryFee;
  final num? deliveryDiscount;
  final num? discount;
  final List<String>? voucherNames;
  final bool? isInvoiceExact;

  PaymentTokenResponse(
      {this.id,
      this.orderType,
      this.addressId,
      this.voucherIds,
      this.orders,
      this.callBackUrl,
      this.subtotalFee,
      this.deliveryFee,
      this.deliveryDiscount,
      this.discount,
      this.voucherNames,
      this.isInvoiceExact});

  factory PaymentTokenResponse.fromJson(Map<String, dynamic> json) {
    return _$PaymentTokenResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentTokenResponseToJson(this);
  }

  PaymentTokenResponse copyWith({
    String? id,
    String? orderType,
    String? addressId,
    List<dynamic>? voucherIds,
    List<Orders>? orders,
    String? callBackUrl,
    num? subtotalFee,
    num? deliveryFee,
    num? deliveryDiscount,
    num? discount,
    List<String>? voucherNames,
    bool? isInvoiceExact,
  }) {
    return PaymentTokenResponse(
      id: id ?? this.id,
      orderType: orderType ?? this.orderType,
      addressId: addressId ?? this.addressId,
      voucherIds: voucherIds ?? this.voucherIds,
      orders: orders ?? this.orders,
      callBackUrl: callBackUrl ?? this.callBackUrl,
      subtotalFee: subtotalFee ?? this.subtotalFee,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      deliveryDiscount: deliveryDiscount ?? this.deliveryDiscount,
      discount: discount ?? this.discount,
      voucherNames: voucherNames ?? this.voucherNames,
      isInvoiceExact: isInvoiceExact ?? this.isInvoiceExact,
    );
  }
}

/// vendor_id : "ba9f4ea4-03ec-4b66-81af-1b80eccb5e96"
/// data : [{"stock_id":"77e71230-7472-11ee-b337-3f5edd264f23","quantity":1}]
/// voucher_ids : ["08b6e99c-d84a-4be7-99cd-1537bdca1949","5827220e-fa3a-4fcc-a32e-452e94bbe9c6"]
/// note : ""
/// shipping_code : "MTFfMTFfMTcyNw=="
/// amount : 440.0
/// is_invoice_exact : true

class Orders {
  Orders({
      String? vendorId, 
      List<Data>? data, 
      List<String>? voucherIds, 
      String? note, 
      String? shippingCode, 
      num? amount, 
      bool? isInvoiceExact,}){
    _vendorId = vendorId;
    _data = data;
    _voucherIds = voucherIds;
    _note = note;
    _shippingCode = shippingCode;
    _amount = amount;
    _isInvoiceExact = isInvoiceExact;
}

  Orders.fromJson(dynamic json) {
    _vendorId = json['vendor_id'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _voucherIds = json['voucher_ids'] != null ? json['voucher_ids'].cast<String>() : [];
    _note = json['note'];
    _shippingCode = json['shipping_code'];
    _amount = json['amount'];
    _isInvoiceExact = json['is_invoice_exact'];
  }
  String? _vendorId;
  List<Data>? _data;
  List<String>? _voucherIds;
  String? _note;
  String? _shippingCode;
  num? _amount;
  bool? _isInvoiceExact;
Orders copyWith({  String? vendorId,
  List<Data>? data,
  List<String>? voucherIds,
  String? note,
  String? shippingCode,
  num? amount,
  bool? isInvoiceExact,
}) => Orders(  vendorId: vendorId ?? _vendorId,
  data: data ?? _data,
  voucherIds: voucherIds ?? _voucherIds,
  note: note ?? _note,
  shippingCode: shippingCode ?? _shippingCode,
  amount: amount ?? _amount,
  isInvoiceExact: isInvoiceExact ?? _isInvoiceExact,
);
  String? get vendorId => _vendorId;
  List<Data>? get data => _data;
  List<String>? get voucherIds => _voucherIds;
  String? get note => _note;
  String? get shippingCode => _shippingCode;
  num? get amount => _amount;
  bool? get isInvoiceExact => _isInvoiceExact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vendor_id'] = _vendorId;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['voucher_ids'] = _voucherIds;
    map['note'] = _note;
    map['shipping_code'] = _shippingCode;
    map['amount'] = _amount;
    map['is_invoice_exact'] = _isInvoiceExact;
    return map;
  }

}

/// stock_id : "77e71230-7472-11ee-b337-3f5edd264f23"
/// quantity : 1

class Data {
  Data({
      String? stockId, 
      num? quantity,}){
    _stockId = stockId;
    _quantity = quantity;
}

  Data.fromJson(dynamic json) {
    _stockId = json['stock_id'];
    _quantity = json['quantity'];
  }
  String? _stockId;
  num? _quantity;
Data copyWith({  String? stockId,
  num? quantity,
}) => Data(  stockId: stockId ?? _stockId,
  quantity: quantity ?? _quantity,
);
  String? get stockId => _stockId;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stock_id'] = _stockId;
    map['quantity'] = _quantity;
    return map;
  }

}