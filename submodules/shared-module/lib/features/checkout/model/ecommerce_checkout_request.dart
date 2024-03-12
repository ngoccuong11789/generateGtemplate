class EcommerceCheckoutRequest {
  List<Products>? products;
  String? paymentMethodId;
  String? note;
  String? addressId;
  List<String>? voucherIds;
  String? orderType;

  EcommerceCheckoutRequest(
      {this.products,
      this.paymentMethodId,
      this.note,
      this.addressId,
      this.voucherIds,
      this.orderType = ""});

  EcommerceCheckoutRequest.fromJson(Map<String, dynamic> json) {
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => Products.fromJson(e))
              .toList();
    }
    if (json["payment_method_id"] is String) {
      paymentMethodId = json["payment_method_id"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
    if (json["address_id"] is String) {
      addressId = json["address_id"];
    }
    if (json["voucher_ids"] is List) {
      voucherIds = json["voucher_ids"] == null
          ? null
          : List<String>.from(json["voucher_ids"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (products != null) {
      _data["data"] = products?.map((e) => e.toJson()).toList();
    }
    _data["payment_method_id"] = paymentMethodId;
    _data["note"] = note;
    _data["address_id"] = addressId;
    if (voucherIds != null) {
      _data["voucher_ids"] = voucherIds;
    }
    _data["order_type"] = orderType;
    return _data;
  }
}

class Products {
  String? stockId;
  int? quantity;

  Products({this.stockId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    if (json["stock_id"] is String) {
      stockId = json["stock_id"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["stock_id"] = stockId;
    _data["quantity"] = quantity;
    return _data;
  }
}
