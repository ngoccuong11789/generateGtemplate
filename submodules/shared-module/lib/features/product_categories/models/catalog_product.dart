
class CatalogProduct {
  List<Data>? data;
  int? totalItems;

  CatalogProduct({this.data, this.totalItems});

  CatalogProduct.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["totalItems"] is int) {
      totalItems = json["totalItems"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["totalItems"] = totalItems;
    return _data;
  }
}

class Data {
  String? id;
  String? name;
  double? price;
  double? originalPrice;
  double? quantity;
  Avatar? avatar;
  String? description;
  String? subLabel;
  double? point;
  int? sumReview;
  Shop? shop;
  dynamic voucher;
  bool? isBookmark;

  Data({this.id, this.name, this.price, this.originalPrice, this.quantity, this.avatar, this.description, this.subLabel, this.point, this.sumReview, this.shop, this.voucher, this.isBookmark});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["price"] is double) {
      price = json["price"];
    }
    if(json["original_price"] is double) {
      originalPrice = json["original_price"];
    }
    if(json["quantity"] is double) {
      quantity = json["quantity"];
    }
    if(json["avatar"] is Map) {
      avatar = json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]);
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["sub_label"] is String) {
      subLabel = json["sub_label"];
    }
    if(json["point"] is double) {
      point = json["point"];
    }
    if(json["sum_review"] is int) {
      sumReview = json["sum_review"];
    }
    if(json["shop"] is Map) {
      shop = json["shop"] == null ? null : Shop.fromJson(json["shop"]);
    }
    voucher = json["voucher"];
    if(json["is_bookmark"] is bool) {
      isBookmark = json["is_bookmark"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["price"] = price;
    _data["original_price"] = originalPrice;
    _data["quantity"] = quantity;
    if(avatar != null) {
      _data["avatar"] = avatar?.toJson();
    }
    _data["description"] = description;
    _data["sub_label"] = subLabel;
    _data["point"] = point;
    _data["sum_review"] = sumReview;
    if(shop != null) {
      _data["shop"] = shop?.toJson();
    }
    _data["voucher"] = voucher;
    _data["is_bookmark"] = isBookmark;
    return _data;
  }
}

class Shop {
  String? id;
  String? name;
  List<Addresses>? addresses;

  Shop({this.id, this.name, this.addresses});

  Shop.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["addresses"] is List) {
      addresses = json["addresses"] == null ? null : (json["addresses"] as List).map((e) => Addresses.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(addresses != null) {
      _data["addresses"] = addresses?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Addresses {
  String? id;
  String? country;
  String? province;
  String? district;
  String? ward;

  Addresses({this.id, this.country, this.province, this.district, this.ward});

  Addresses.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["province"] is String) {
      province = json["province"];
    }
    if(json["district"] is String) {
      district = json["district"];
    }
    if(json["ward"] is String) {
      ward = json["ward"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["country"] = country;
    _data["province"] = province;
    _data["district"] = district;
    _data["ward"] = ward;
    return _data;
  }
}

class Avatar {
  String? id;
  String? extension;
  String? originalName;
  int? size;
  String? type;
  String? description;

  Avatar({this.id, this.extension, this.originalName, this.size, this.type, this.description});

  Avatar.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["extension"] is String) {
      extension = json["extension"];
    }
    if(json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["size"] = size;
    _data["type"] = type;
    _data["description"] = description;
    return _data;
  }
}