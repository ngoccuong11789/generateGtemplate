class FoodCheckoutRequest {
  List<Foods>? foods;
  String? paymentMethodId;
  String? note;
  String? addressId;
  List<String>? voucherIds;

  FoodCheckoutRequest(
      {this.foods,
      this.paymentMethodId,
      this.note,
      this.addressId,
      this.voucherIds});

  FoodCheckoutRequest.fromJson(Map<String, dynamic> json) {
    if (json["foods"] is List) {
      foods = json["foods"] == null
          ? null
          : (json["foods"] as List).map((e) => Foods.fromJson(e)).toList();
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
    if (foods != null) {
      _data["foods"] = foods?.map((e) => e.toJson()).toList();
    }
    _data["payment_method_id"] = paymentMethodId;
    _data["note"] = note;
    _data["address_id"] = addressId;
    if (voucherIds != null) {
      _data["voucher_ids"] = voucherIds;
    }
    return _data;
  }
}

class Foods {
  String? stockId;
  List<String>? accompanyingFoodIds;
  int? quantity;

  Foods({this.stockId, this.accompanyingFoodIds, this.quantity});

  Foods.fromJson(Map<String, dynamic> json) {
    if (json["stock_id"] is String) {
      stockId = json["stock_id"];
    }
    if (json["accompanying_food_ids"] is List) {
      accompanyingFoodIds = json["accompanying_food_ids"] == null
          ? null
          : List<String>.from(json["accompanying_food_ids"]);
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["stock_id"] = stockId;
    if (accompanyingFoodIds != null) {
      _data["accompanying_food_ids"] = accompanyingFoodIds;
    }
    _data["quantity"] = quantity;
    return _data;
  }
}
