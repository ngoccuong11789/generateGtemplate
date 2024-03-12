
class FoodSearchResult {
  int? page;
  int? pageSize;
  int? totalElement;
  List<Data>? data;

  FoodSearchResult({this.page, this.pageSize, this.totalElement, this.data});

  FoodSearchResult.fromJson(Map<String, dynamic> json) {
    if(json["page"] is int) {
      page = json["page"];
    }
    if(json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if(json["totalElement"] is int) {
      totalElement = json["totalElement"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["pageSize"] = pageSize;
    _data["totalElement"] = totalElement;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? name;
  Avatar? avatar;
  int? sumReviews;
  int? rating;
  dynamic background;
  int? followers;
  dynamic shopStatusId;
  dynamic shopStatus;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? openTime;
  String? closedTime;
  List<String>? foodTypeIds;
  List<String>? foodTypes;
  List<String>? restaurantTypeIds;
  List<String>? restaurantTypes;
  Country? country;
  Province? province;
  District? district;
  Ward? ward;
  String? street;
  int? longitude;
  int? latitude;
  Foods? foods;
  bool? isBookmark;

  Data({this.id, this.name, this.avatar, this.sumReviews, this.rating, this.background, this.followers, this.shopStatusId, this.shopStatus, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy, this.openTime, this.closedTime, this.foodTypeIds, this.foodTypes, this.restaurantTypeIds, this.restaurantTypes, this.country, this.province, this.district, this.ward, this.street, this.longitude, this.latitude, this.foods, this.isBookmark});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["avatar"] is Map) {
      avatar = json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]);
    }
    if(json["sum_reviews"] is int) {
      sumReviews = json["sum_reviews"];
    }
    if(json["rating"] is int) {
      rating = json["rating"];
    }
    background = json["background"];
    if(json["followers"] is int) {
      followers = json["followers"];
    }
    shopStatusId = json["shop_status_id"];
    shopStatus = json["shop_status"];
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["created_by"] is String) {
      createdBy = json["created_by"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["updated_by"] is String) {
      updatedBy = json["updated_by"];
    }
    if(json["open_time"] is String) {
      openTime = json["open_time"];
    }
    if(json["closed_time"] is String) {
      closedTime = json["closed_time"];
    }
    if(json["food_type_ids"] is List) {
      foodTypeIds = json["food_type_ids"] == null ? null : List<String>.from(json["food_type_ids"]);
    }
    if(json["food_types"] is List) {
      foodTypes = json["food_types"] == null ? null : List<String>.from(json["food_types"]);
    }
    if(json["restaurant_type_ids"] is List) {
      restaurantTypeIds = json["restaurant_type_ids"] == null ? null : List<String>.from(json["restaurant_type_ids"]);
    }
    if(json["restaurant_types"] is List) {
      restaurantTypes = json["restaurant_types"] == null ? null : List<String>.from(json["restaurant_types"]);
    }
    if(json["country"] is Map) {
      country = json["country"] == null ? null : Country.fromJson(json["country"]);
    }
    if(json["province"] is Map) {
      province = json["province"] == null ? null : Province.fromJson(json["province"]);
    }
    if(json["district"] is Map) {
      district = json["district"] == null ? null : District.fromJson(json["district"]);
    }
    if(json["ward"] is Map) {
      ward = json["ward"] == null ? null : Ward.fromJson(json["ward"]);
    }
    if(json["street"] is String) {
      street = json["street"];
    }
    if(json["longitude"] is int) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is int) {
      latitude = json["latitude"];
    }
    if(json["foods"] is Map) {
      foods = json["foods"] == null ? null : Foods.fromJson(json["foods"]);
    }
    if(json["is_bookmark"] is bool) {
      isBookmark = json["is_bookmark"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(avatar != null) {
      _data["avatar"] = avatar?.toJson();
    }
    _data["sum_reviews"] = sumReviews;
    _data["rating"] = rating;
    _data["background"] = background;
    _data["followers"] = followers;
    _data["shop_status_id"] = shopStatusId;
    _data["shop_status"] = shopStatus;
    _data["created_at"] = createdAt;
    _data["created_by"] = createdBy;
    _data["updated_at"] = updatedAt;
    _data["updated_by"] = updatedBy;
    _data["open_time"] = openTime;
    _data["closed_time"] = closedTime;
    if(foodTypeIds != null) {
      _data["food_type_ids"] = foodTypeIds;
    }
    if(foodTypes != null) {
      _data["food_types"] = foodTypes;
    }
    if(restaurantTypeIds != null) {
      _data["restaurant_type_ids"] = restaurantTypeIds;
    }
    if(restaurantTypes != null) {
      _data["restaurant_types"] = restaurantTypes;
    }
    if(country != null) {
      _data["country"] = country?.toJson();
    }
    if(province != null) {
      _data["province"] = province?.toJson();
    }
    if(district != null) {
      _data["district"] = district?.toJson();
    }
    if(ward != null) {
      _data["ward"] = ward?.toJson();
    }
    _data["street"] = street;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    if(foods != null) {
      _data["foods"] = foods?.toJson();
    }
    _data["is_bookmark"] = isBookmark;
    return _data;
  }
}

class Foods {
  int? page;
  int? pageSize;
  int? totalElement;
  List<Data1>? data;

  Foods({this.page, this.pageSize, this.totalElement, this.data});

  Foods.fromJson(Map<String, dynamic> json) {
    if(json["page"] is int) {
      page = json["page"];
    }
    if(json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if(json["totalElement"] is int) {
      totalElement = json["totalElement"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["pageSize"] = pageSize;
    _data["totalElement"] = totalElement;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data1 {
  String? id;
  String? name;
  int? price;
  int? originalPrice;
  int? quantity;
  Avatar1? avatar;
  dynamic description;
  String? subLabel;
  int? point;
  int? sumReview;
  RestaurantFood? restaurantFood;
  String? voucher;
  int? discountPercent;
  StockDefault? stockDefault;
  bool? isLimited;
  bool? isBookmark;

  Data1({this.id, this.name, this.price, this.originalPrice, this.quantity, this.avatar, this.description, this.subLabel, this.point, this.sumReview, this.restaurantFood, this.voucher, this.discountPercent, this.stockDefault, this.isLimited, this.isBookmark});

  Data1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["original_price"] is int) {
      originalPrice = json["original_price"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["avatar"] is Map) {
      avatar = json["avatar"] == null ? null : Avatar1.fromJson(json["avatar"]);
    }
    description = json["description"];
    if(json["sub_label"] is String) {
      subLabel = json["sub_label"];
    }
    if(json["point"] is int) {
      point = json["point"];
    }
    if(json["sum_review"] is int) {
      sumReview = json["sum_review"];
    }
    if(json["restaurant_food"] is Map) {
      restaurantFood = json["restaurant_food"] == null ? null : RestaurantFood.fromJson(json["restaurant_food"]);
    }
    if(json["voucher"] is String) {
      voucher = json["voucher"];
    }
    if(json["discount_percent"] is int) {
      discountPercent = json["discount_percent"];
    }
    if(json["stock_default"] is Map) {
      stockDefault = json["stock_default"] == null ? null : StockDefault.fromJson(json["stock_default"]);
    }
    if(json["is_limited"] is bool) {
      isLimited = json["is_limited"];
    }
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
    if(restaurantFood != null) {
      _data["restaurant_food"] = restaurantFood?.toJson();
    }
    _data["voucher"] = voucher;
    _data["discount_percent"] = discountPercent;
    if(stockDefault != null) {
      _data["stock_default"] = stockDefault?.toJson();
    }
    _data["is_limited"] = isLimited;
    _data["is_bookmark"] = isBookmark;
    return _data;
  }
}

class StockDefault {
  String? id;
  String? productId;
  String? variationFirstId;
  String? variationSecondId;
  VariationFirst? variationFirst;
  VariationSecond? variationSecond;
  int? orderFirst;
  int? orderSecond;
  int? quantity;
  int? price;
  int? originalPrice;
  dynamic sku;
  bool? isLimited;

  StockDefault({this.id, this.productId, this.variationFirstId, this.variationSecondId, this.variationFirst, this.variationSecond, this.orderFirst, this.orderSecond, this.quantity, this.price, this.originalPrice, this.sku, this.isLimited});

  StockDefault.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["product_id"] is String) {
      productId = json["product_id"];
    }
    if(json["variation_first_id"] is String) {
      variationFirstId = json["variation_first_id"];
    }
    if(json["variation_second_id"] is String) {
      variationSecondId = json["variation_second_id"];
    }
    if(json["variation_first"] is Map) {
      variationFirst = json["variation_first"] == null ? null : VariationFirst.fromJson(json["variation_first"]);
    }
    if(json["variation_second"] is Map) {
      variationSecond = json["variation_second"] == null ? null : VariationSecond.fromJson(json["variation_second"]);
    }
    if(json["order_first"] is int) {
      orderFirst = json["order_first"];
    }
    if(json["order_second"] is int) {
      orderSecond = json["order_second"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["original_price"] is int) {
      originalPrice = json["original_price"];
    }
    sku = json["sku"];
    if(json["is_limited"] is bool) {
      isLimited = json["is_limited"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["product_id"] = productId;
    _data["variation_first_id"] = variationFirstId;
    _data["variation_second_id"] = variationSecondId;
    if(variationFirst != null) {
      _data["variation_first"] = variationFirst?.toJson();
    }
    if(variationSecond != null) {
      _data["variation_second"] = variationSecond?.toJson();
    }
    _data["order_first"] = orderFirst;
    _data["order_second"] = orderSecond;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["original_price"] = originalPrice;
    _data["sku"] = sku;
    _data["is_limited"] = isLimited;
    return _data;
  }
}

class VariationSecond {
  String? id;
  String? name;
  dynamic code;
  int? order;
  dynamic color;
  dynamic image;
  String? pricingId;

  VariationSecond({this.id, this.name, this.code, this.order, this.color, this.image, this.pricingId});

  VariationSecond.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    code = json["code"];
    if(json["order"] is int) {
      order = json["order"];
    }
    color = json["color"];
    image = json["image"];
    if(json["pricing_id"] is String) {
      pricingId = json["pricing_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["order"] = order;
    _data["color"] = color;
    _data["image"] = image;
    _data["pricing_id"] = pricingId;
    return _data;
  }
}

class VariationFirst {
  String? id;
  String? name;
  dynamic code;
  int? order;
  dynamic color;
  Image? image;
  String? pricingId;

  VariationFirst({this.id, this.name, this.code, this.order, this.color, this.image, this.pricingId});

  VariationFirst.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    code = json["code"];
    if(json["order"] is int) {
      order = json["order"];
    }
    color = json["color"];
    if(json["image"] is Map) {
      image = json["image"] == null ? null : Image.fromJson(json["image"]);
    }
    if(json["pricing_id"] is String) {
      pricingId = json["pricing_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["order"] = order;
    _data["color"] = color;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["pricing_id"] = pricingId;
    return _data;
  }
}

class Image {
  String? id;
  String? extension;
  String? originalName;
  int? size;
  String? type;
  String? description;
  String? signature;

  Image({this.id, this.extension, this.originalName, this.size, this.type, this.description, this.signature});

  Image.fromJson(Map<String, dynamic> json) {
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
    if(json["signature"] is String) {
      signature = json["signature"];
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
    _data["signature"] = signature;
    return _data;
  }
}

class RestaurantFood {
  String? id;
  String? name;
  Avatar2? avatar;
  List<String>? restaurantTypeIds;
  List<String>? restaurantTypes;
  Country1? country;
  Province1? province;
  District1? district;
  Ward1? ward;
  String? street;
  int? longitude;
  int? latitude;

  RestaurantFood({this.id, this.name, this.avatar, this.restaurantTypeIds, this.restaurantTypes, this.country, this.province, this.district, this.ward, this.street, this.longitude, this.latitude});

  RestaurantFood.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["avatar"] is Map) {
      avatar = json["avatar"] == null ? null : Avatar2.fromJson(json["avatar"]);
    }
    if(json["restaurant_type_ids"] is List) {
      restaurantTypeIds = json["restaurant_type_ids"] == null ? null : List<String>.from(json["restaurant_type_ids"]);
    }
    if(json["restaurant_types"] is List) {
      restaurantTypes = json["restaurant_types"] == null ? null : List<String>.from(json["restaurant_types"]);
    }
    if(json["country"] is Map) {
      country = json["country"] == null ? null : Country1.fromJson(json["country"]);
    }
    if(json["province"] is Map) {
      province = json["province"] == null ? null : Province1.fromJson(json["province"]);
    }
    if(json["district"] is Map) {
      district = json["district"] == null ? null : District1.fromJson(json["district"]);
    }
    if(json["ward"] is Map) {
      ward = json["ward"] == null ? null : Ward1.fromJson(json["ward"]);
    }
    if(json["street"] is String) {
      street = json["street"];
    }
    if(json["longitude"] is int) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is int) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(avatar != null) {
      _data["avatar"] = avatar?.toJson();
    }
    if(restaurantTypeIds != null) {
      _data["restaurant_type_ids"] = restaurantTypeIds;
    }
    if(restaurantTypes != null) {
      _data["restaurant_types"] = restaurantTypes;
    }
    if(country != null) {
      _data["country"] = country?.toJson();
    }
    if(province != null) {
      _data["province"] = province?.toJson();
    }
    if(district != null) {
      _data["district"] = district?.toJson();
    }
    if(ward != null) {
      _data["ward"] = ward?.toJson();
    }
    _data["street"] = street;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class Ward1 {
  String? id;
  String? code;
  String? name;
  int? longitude;
  int? latitude;

  Ward1({this.id, this.code, this.name, this.longitude, this.latitude});

  Ward1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is int) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is int) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class District1 {
  String? id;
  String? code;
  String? name;
  double? longitude;
  double? latitude;

  District1({this.id, this.code, this.name, this.longitude, this.latitude});

  District1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is double) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is double) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class Province1 {
  String? id;
  String? code;
  String? name;
  double? longitude;
  double? latitude;

  Province1({this.id, this.code, this.name, this.longitude, this.latitude});

  Province1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is double) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is double) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class Country1 {
  String? id;
  String? code;
  String? name;
  int? longitude;
  int? latitude;

  Country1({this.id, this.code, this.name, this.longitude, this.latitude});

  Country1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is int) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is int) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class Avatar2 {
  String? id;
  dynamic name;
  String? extension;
  String? originalName;
  int? size;
  String? type;
  String? description;
  dynamic content;

  Avatar2({this.id, this.name, this.extension, this.originalName, this.size, this.type, this.description, this.content});

  Avatar2.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    name = json["name"];
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
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["size"] = size;
    _data["type"] = type;
    _data["description"] = description;
    _data["content"] = content;
    return _data;
  }
}

class Avatar1 {
  String? id;
  String? extension;
  String? originalName;
  int? size;
  String? type;
  String? description;

  Avatar1({this.id, this.extension, this.originalName, this.size, this.type, this.description});

  Avatar1.fromJson(Map<String, dynamic> json) {
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

class Ward {
  String? id;
  String? code;
  String? name;
  int? longitude;
  int? latitude;

  Ward({this.id, this.code, this.name, this.longitude, this.latitude});

  Ward.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is int) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is int) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class District {
  String? id;
  String? code;
  String? name;
  double? longitude;
  double? latitude;

  District({this.id, this.code, this.name, this.longitude, this.latitude});

  District.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is double) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is double) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class Province {
  String? id;
  String? code;
  String? name;
  double? longitude;
  double? latitude;

  Province({this.id, this.code, this.name, this.longitude, this.latitude});

  Province.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is double) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is double) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class Country {
  String? id;
  String? code;
  String? name;
  int? longitude;
  int? latitude;

  Country({this.id, this.code, this.name, this.longitude, this.latitude});

  Country.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["longitude"] is int) {
      longitude = json["longitude"];
    }
    if(json["latitude"] is int) {
      latitude = json["latitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
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
  dynamic content;
  String? signature;

  Avatar({this.id, this.extension, this.originalName, this.size, this.type, this.description, this.content, this.signature});

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
    content = json["content"];
    if(json["signature"] is String) {
      signature = json["signature"];
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
    _data["content"] = content;
    _data["signature"] = signature;
    return _data;
  }
}