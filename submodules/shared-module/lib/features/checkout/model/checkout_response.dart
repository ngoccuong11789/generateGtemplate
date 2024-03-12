class CheckoutResponse {
  PaymentMethod? paymentMethod;
  num? orderTotal;
  num? discounts;
  num? paymentTotal;
  List<Vouchers>? vouchers;
  String? createdAt;
  List<Orders>? orders;

  CheckoutResponse(
      {this.paymentMethod,
      this.orderTotal,
      this.discounts,
      this.paymentTotal,
      this.vouchers,
      this.createdAt,
      this.orders});

  CheckoutResponse.fromJson(Map<String, dynamic> json) {
    if (json["payment_method"] is Map) {
      paymentMethod = json["payment_method"] == null
          ? null
          : PaymentMethod.fromJson(json["payment_method"]);
    }
    if (json["order_total"] is num) {
      orderTotal = json["order_total"];
    }
    if (json["discounts"] is num) {
      discounts = json["discounts"];
    }
    if (json["payment_total"] is num) {
      paymentTotal = json["payment_total"];
    }
    if (json["vouchers"] is List) {
      vouchers = json["vouchers"] == null
          ? null
          : (json["vouchers"] as List)
              .map((e) => Vouchers.fromJson(e))
              .toList();
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["orders"] is List) {
      orders = json["orders"] == null
          ? null
          : (json["orders"] as List).map((e) => Orders.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (paymentMethod != null) {
      _data["payment_method"] = paymentMethod?.toJson();
    }
    _data["order_total"] = orderTotal;
    _data["discounts"] = discounts;
    _data["payment_total"] = paymentTotal;
    if (vouchers != null) {
      _data["vouchers"] = vouchers?.map((e) => e.toJson()).toList();
    }
    _data["created_at"] = createdAt;
    if (orders != null) {
      _data["orders"] = orders?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Orders {
  String? id;
  Status? status;
  Payment? payment;
  int? totalRating;
  String? note;
  int? totalItem;
  String? createdAt;

  Orders(
      {this.id,
      this.status,
      this.payment,
      this.totalRating,
      this.note,
      this.totalItem,
      this.createdAt});

  Orders.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["status"] is Map) {
      status = json["status"] == null ? null : Status.fromJson(json["status"]);
    }
    if (json["payment"] is Map) {
      payment =
          json["payment"] == null ? null : Payment.fromJson(json["payment"]);
    }
    if (json["total_rating"] is int) {
      totalRating = json["total_rating"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
    if (json["total_item"] is int) {
      totalItem = json["total_item"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (status != null) {
      _data["status"] = status?.toJson();
    }
    if (payment != null) {
      _data["payment"] = payment?.toJson();
    }
    _data["total_rating"] = totalRating;
    _data["note"] = note;
    _data["total_item"] = totalItem;
    _data["created_at"] = createdAt;
    return _data;
  }
}

class Payment {
  String? createdAt;
  int? orderTotal;
  PaymentMethod1? paymentMethod;
  List<Vouchers1>? vouchers;
  int? discounts;
  int? paymentTotal;

  Payment(
      {this.createdAt,
      this.orderTotal,
      this.paymentMethod,
      this.vouchers,
      this.discounts,
      this.paymentTotal});

  Payment.fromJson(Map<String, dynamic> json) {
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["order_total"] is int) {
      orderTotal = json["order_total"];
    }
    if (json["payment_method"] is Map) {
      paymentMethod = json["payment_method"] == null
          ? null
          : PaymentMethod1.fromJson(json["payment_method"]);
    }
    if (json["vouchers"] is List) {
      vouchers = json["vouchers"] == null
          ? null
          : (json["vouchers"] as List)
              .map((e) => Vouchers1.fromJson(e))
              .toList();
    }
    if (json["discounts"] is int) {
      discounts = json["discounts"];
    }
    if (json["payment_total"] is int) {
      paymentTotal = json["payment_total"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["created_at"] = createdAt;
    _data["order_total"] = orderTotal;
    if (paymentMethod != null) {
      _data["payment_method"] = paymentMethod?.toJson();
    }
    if (vouchers != null) {
      _data["vouchers"] = vouchers?.map((e) => e.toJson()).toList();
    }
    _data["discounts"] = discounts;
    _data["payment_total"] = paymentTotal;
    return _data;
  }
}

class Vouchers1 {
  String? id;
  String? name;
  String? type;

  Vouchers1({this.id, this.name, this.type});

  Vouchers1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["type"] = type;
    return _data;
  }
}

class PaymentMethod1 {
  String? id;
  String? code;
  String? name;

  PaymentMethod1({this.id, this.code, this.name});

  PaymentMethod1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    return _data;
  }
}

class Avatar1 {
  String? id;
  String? extension;
  String? originalName;
  String? type;
  int? size;
  String? description;

  Avatar1(
      {this.id,
      this.extension,
      this.originalName,
      this.type,
      this.size,
      this.description});

  Avatar1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["extension"] is String) {
      extension = json["extension"];
    }
    if (json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["type"] = type;
    _data["size"] = size;
    _data["description"] = description;
    return _data;
  }
}

class Avatar {
  String? id;
  String? extension;
  String? originalName;
  String? type;
  int? size;
  String? description;

  Avatar(
      {this.id,
      this.extension,
      this.originalName,
      this.type,
      this.size,
      this.description});

  Avatar.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["extension"] is String) {
      extension = json["extension"];
    }
    if (json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["type"] = type;
    _data["size"] = size;
    _data["description"] = description;
    return _data;
  }
}

class Status {
  String? code;
  String? name;
  String? note;
  String? message;
  StatusProperty? statusProperty;

  Status({this.code, this.name, this.note, this.message, this.statusProperty});

  Status.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["status_property"] is Map) {
      statusProperty = json["status_property"] == null
          ? null
          : StatusProperty.fromJson(json["status_property"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["name"] = name;
    _data["note"] = note;
    _data["message"] = message;
    if (statusProperty != null) {
      _data["status_property"] = statusProperty?.toJson();
    }
    return _data;
  }
}

class StatusProperty {
  String? id;
  String? tab;
  bool? canCancel;
  bool? canRefund;
  bool? canReceive;
  bool? canRepay;
  String? color;
  String? fontColor;
  List<String>? canMoves;
  bool? isDefault;
  bool? isPaymentSuccess;
  bool? isDefaultOfTab;

  StatusProperty(
      {this.id,
      this.tab,
      this.canCancel,
      this.canRefund,
      this.canReceive,
      this.canRepay,
      this.color,
      this.fontColor,
      this.canMoves,
      this.isDefault,
      this.isPaymentSuccess,
      this.isDefaultOfTab});

  StatusProperty.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["tab"] is String) {
      tab = json["tab"];
    }
    if (json["can_cancel"] is bool) {
      canCancel = json["can_cancel"];
    }
    if (json["can_refund"] is bool) {
      canRefund = json["can_refund"];
    }
    if (json["can_receive"] is bool) {
      canReceive = json["can_receive"];
    }
    if (json["can_repay"] is bool) {
      canRepay = json["can_repay"];
    }
    if (json["color"] is String) {
      color = json["color"];
    }
    if (json["font_color"] is String) {
      fontColor = json["font_color"];
    }
    if (json["can_moves"] is List) {
      canMoves = json["can_moves"] == null
          ? null
          : List<String>.from(json["can_moves"]);
    }
    if (json["is_default"] is bool) {
      isDefault = json["is_default"];
    }
    if (json["is_payment_success"] is bool) {
      isPaymentSuccess = json["is_payment_success"];
    }
    if (json["is_default_of_tab"] is bool) {
      isDefaultOfTab = json["is_default_of_tab"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["tab"] = tab;
    _data["can_cancel"] = canCancel;
    _data["can_refund"] = canRefund;
    _data["can_receive"] = canReceive;
    _data["can_repay"] = canRepay;
    _data["color"] = color;
    _data["font_color"] = fontColor;
    if (canMoves != null) {
      _data["can_moves"] = canMoves;
    }
    _data["is_default"] = isDefault;
    _data["is_payment_success"] = isPaymentSuccess;
    _data["is_default_of_tab"] = isDefaultOfTab;
    return _data;
  }
}

class Vouchers {
  String? id;
  String? name;
  String? type;

  Vouchers({this.id, this.name, this.type});

  Vouchers.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["type"] = type;
    return _data;
  }
}

class PaymentMethod {
  String? id;
  String? code;
  String? name;

  PaymentMethod({this.id, this.code, this.name});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    return _data;
  }
}
