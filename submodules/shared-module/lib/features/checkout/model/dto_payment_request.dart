class DtoPaymentRequest {
  DtoPaymentRequest({
    String? orderType,
    String? addressId,
    List<String>? voucherIds,
    List<OrdersPayment>? orders,
    String? callBackUrl,
    num? subtotalFee,
    num? deliveryFee,
    num? deliveryDiscount,
    num? discount,
    List<String>? voucherNames,
    bool? isInvoiceExact,}){
    _orderType = orderType;
    _addressId = addressId;
    _voucherIds = voucherIds;
    _orders = orders;
    _callBackUrl = callBackUrl;
    _subtotalFee = subtotalFee;
    _deliveryFee = deliveryFee;
    _deliveryDiscount = deliveryDiscount;
    _discount = discount;
    _voucherNames = voucherNames;
    _isInvoiceExact = isInvoiceExact;
  }

  DtoPaymentRequest.fromJson(dynamic json) {
    _orderType = json['order_type'];
    _addressId = json['address_id'];
    _voucherIds = json['voucher_ids'] != null ? json['voucher_ids'].cast<String>() : [];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(OrdersPayment.fromJson(v));
      });
    }
    _callBackUrl = json['call_back_url'];
    _subtotalFee = json['subtotal_fee'];
    _deliveryFee = json['delivery_fee'];
    _deliveryDiscount = json['delivery_discount'];
    _discount = json['discount'];
    _voucherNames = json['voucher_names'] != null ? json['voucher_names'].cast<String>() : [];
    _isInvoiceExact = json['is_invoice_exact'];
  }
  String? _orderType;
  String? _addressId;
  List<String>? _voucherIds;
  List<OrdersPayment>? _orders;
  String? _callBackUrl;
  num? _subtotalFee;
  num? _deliveryFee;
  num? _deliveryDiscount;
  num? _discount;
  List<String>? _voucherNames;
  bool? _isInvoiceExact;
  DtoPaymentRequest copyWith({  String? orderType,
    String? addressId,
    List<String>? voucherIds,
    List<OrdersPayment>? orders,
    String? callBackUrl,
    num? subtotalFee,
    num? deliveryFee,
    num? deliveryDiscount,
    num? discount,
    List<String>? voucherNames,
    bool? isInvoiceExact,
  }) => DtoPaymentRequest(  orderType: orderType ?? _orderType,
    addressId: addressId ?? _addressId,
    voucherIds: voucherIds ?? _voucherIds,
    orders: orders ?? _orders,
    callBackUrl: callBackUrl ?? _callBackUrl,
    subtotalFee: subtotalFee ?? _subtotalFee,
    deliveryFee: deliveryFee ?? _deliveryFee,
    deliveryDiscount: deliveryDiscount ?? _deliveryDiscount,
    discount: discount ?? _discount,
    voucherNames: voucherNames ?? _voucherNames,
    isInvoiceExact: isInvoiceExact ?? _isInvoiceExact,
  );
  String? get orderType => _orderType;
  String? get addressId => _addressId;
  List<String>? get voucherIds => _voucherIds;
  List<OrdersPayment>? get orders => _orders;
  String? get callBackUrl => _callBackUrl;
  num? get subtotalFee => _subtotalFee;
  num? get deliveryFee => _deliveryFee;
  num? get deliveryDiscount => _deliveryDiscount;
  num? get discount => _discount;
  List<String>? get voucherNames => _voucherNames;
  bool? get isInvoiceExact => _isInvoiceExact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_type'] = _orderType;
    map['address_id'] = _addressId;
    map['voucher_ids'] = _voucherIds;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    map['call_back_url'] = _callBackUrl;
    map['subtotal_fee'] = _subtotalFee;
    map['delivery_fee'] = _deliveryFee;
    map['delivery_discount'] = _deliveryDiscount;
    map['discount'] = _discount;
    map['voucher_names'] = _voucherNames;
    map['is_invoice_exact'] = _isInvoiceExact;
    return map;
  }

}

/// vendor_id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// data : [{"stock_id":"3fa85f64-5717-4562-b3fc-2c963f66afa6","quantity":1}]
/// voucher_ids : ["3fa85f64-5717-4562-b3fc-2c963f66afa6"]
/// note : "string"
/// shipping_code : "string"
/// amount : 0
/// is_invoice_exact : true

class OrdersPayment {
  OrdersPayment({
    String? vendorId,
    List<Products>? data,
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

  OrdersPayment.fromJson(dynamic json) {
    _vendorId = json['vendor_id'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Products.fromJson(v));
      });
    }
    _voucherIds = json['voucher_ids'] != null ? json['voucher_ids'].cast<String>() : [];
    _note = json['note'];
    _shippingCode = json['shipping_code'];
    _amount = json['amount'];
    _isInvoiceExact = json['is_invoice_exact'];
  }
  String? _vendorId;
  List<Products>? _data;
  List<String>? _voucherIds;
  String? _note;
  String? _shippingCode;
  num? _amount;
  bool? _isInvoiceExact;
  OrdersPayment copyWith({  String? vendorId,
    List<Products>? data,
    List<String>? voucherIds,
    String? note,
    String? shippingCode,
    num? amount,
    bool? isInvoiceExact,
  }) => OrdersPayment(  vendorId: vendorId ?? _vendorId,
    data: data ?? _data,
    voucherIds: voucherIds ?? _voucherIds,
    note: note ?? _note,
    shippingCode: shippingCode ?? _shippingCode,
    amount: amount ?? _amount,
    isInvoiceExact: isInvoiceExact ?? _isInvoiceExact,
  );
  String? get vendorId => _vendorId;
  List<Products>? get data => _data;
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

/// stock_id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// quantity : 1

class Products {
  Products({
    String? stockId,
    num? quantity,}){
    _stockId = stockId;
    _quantity = quantity;
  }

  Products.fromJson(dynamic json) {
    _stockId = json['stock_id'];
    _quantity = json['quantity'];
  }
  String? _stockId;
  num? _quantity;
  Products copyWith({  String? stockId,
    num? quantity,
  }) => Products(  stockId: stockId ?? _stockId,
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