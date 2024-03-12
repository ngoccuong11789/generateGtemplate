
class ShopModel {
  String? id;
  String? name;
  Avatar? avatar;
  Background? background;
  int? followers;
  int? totalProducts;
  double? rating;
  String? slogan;
  String? shopStatusId;
  ShopStatus? shopStatus;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  List<ShopCategories>? shopCategories;

  ShopModel({this.id, this.name, this.avatar, this.background, this.followers, this.totalProducts, this.rating, this.slogan, this.shopStatusId, this.shopStatus, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy, this.shopCategories});

  ShopModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["avatar"] is Map) {
      avatar = json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]);
    }
    if(json["background"] is Map) {
      background = json["background"] == null ? null : Background.fromJson(json["background"]);
    }
    if(json["followers"] is int) {
      followers = json["followers"];
    }
    if(json["total_products"] is int) {
      totalProducts = json["total_products"];
    }
    if(json["rating"] is double) {
      rating = json["rating"];
    }
    if(json["slogan"] is String) {
      slogan = json["slogan"];
    }
    if(json["shop_status_id"] is String) {
      shopStatusId = json["shop_status_id"];
    }
    if(json["shop_status"] is Map) {
      shopStatus = json["shop_status"] == null ? null : ShopStatus.fromJson(json["shop_status"]);
    }
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
    if(json["shop_categories"] is List) {
      shopCategories = json["shop_categories"] == null ? null : (json["shop_categories"] as List).map((e) => ShopCategories.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(avatar != null) {
      _data["avatar"] = avatar?.toJson();
    }
    if(background != null) {
      _data["background"] = background?.toJson();
    }
    _data["followers"] = followers;
    _data["total_products"] = totalProducts;
    _data["rating"] = rating;
    _data["slogan"] = slogan;
    _data["shop_status_id"] = shopStatusId;
    if(shopStatus != null) {
      _data["shop_status"] = shopStatus?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["created_by"] = createdBy;
    _data["updated_at"] = updatedAt;
    _data["updated_by"] = updatedBy;
    if(shopCategories != null) {
      _data["shop_categories"] = shopCategories?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ShopCategories {
  String? id;
  String? name;
  int? order;
  List<ShopSections>? shopSections;

  ShopCategories({this.id, this.name, this.order, this.shopSections});

  ShopCategories.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["order"] is int) {
      order = json["order"];
    }
    if(json["shop_sections"] is List) {
      shopSections = json["shop_sections"] == null ? null : (json["shop_sections"] as List).map((e) => ShopSections.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["order"] = order;
    if(shopSections != null) {
      _data["shop_sections"] = shopSections?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ShopSections {
  String? id;
  String? shopCategoryId;
  String? shopDecCollectionId;
  ShopDecorationCollection? shopDecorationCollection;
  int? order;
  List<Contents>? contents;
  List<String>? productIds;
  List<String>? categoryIds;
  int? maxRow;
  bool? isProductList;
  bool? isCategoryList;

  ShopSections({this.id, this.shopCategoryId, this.shopDecCollectionId, this.shopDecorationCollection, this.order, this.contents, this.productIds, this.categoryIds, this.maxRow, this.isProductList, this.isCategoryList});

  ShopSections.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["shop_category_id"] is String) {
      shopCategoryId = json["shop_category_id"];
    }
    if(json["shop_dec_collection_id"] is String) {
      shopDecCollectionId = json["shop_dec_collection_id"];
    }
    if(json["shop_decoration_collection"] is Map) {
      shopDecorationCollection = json["shop_decoration_collection"] == null ? null : ShopDecorationCollection.fromJson(json["shop_decoration_collection"]);
    }
    if(json["order"] is int) {
      order = json["order"];
    }
    if(json["contents"] is List) {
      contents = json["contents"] == null ? null : (json["contents"] as List).map((e) => Contents.fromJson(e)).toList();
    }
    if(json["product_ids"] is List) {
      productIds = json["product_ids"] == null ? null : List<String>.from(json["product_ids"]);
    }
    if(json["category_ids"] is List) {
      categoryIds = json["category_ids"] == null ? null : List<String>.from(json["category_ids"]);
    }
    if(json["max_row"] is int) {
      maxRow = json["max_row"];
    }
    if(json["is_product_list"] is bool) {
      isProductList = json["is_product_list"];
    }
    if(json["is_category_list"] is bool) {
      isCategoryList = json["is_category_list"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["shop_category_id"] = shopCategoryId;
    _data["shop_dec_collection_id"] = shopDecCollectionId;
    if(shopDecorationCollection != null) {
      _data["shop_decoration_collection"] = shopDecorationCollection?.toJson();
    }
    _data["order"] = order;
    if(contents != null) {
      _data["contents"] = contents?.map((e) => e.toJson()).toList();
    }
    if(productIds != null){
      _data["product_ids"] = productIds;
    }
    if(categoryIds != null) {
      _data["category_ids"] = categoryIds;
    }
    _data["max_row"] = maxRow;
    _data["is_product_list"] = isProductList;
    _data["is_category_list"] = isCategoryList;
    return _data;
  }
}

class Contents {
  dynamic id;
  dynamic name;
  dynamic extension;
  dynamic originalName;
  int? size;
  dynamic type;
  dynamic description;
  String? content;

  Contents({this.id, this.name, this.extension, this.originalName, this.size, this.type, this.description, this.content});

  Contents.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    extension = json["extension"];
    originalName = json["original_name"];
    if(json["size"] is int) {
      size = json["size"];
    }
    type = json["type"];
    description = json["description"];
    if(json["content"] is String) {
      content = json["content"];
    }
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

class ShopDecorationCollection {
  String? id;
  String? name;
  String? code;
  String? shopDecCategoryId;
  ImageShop? image;
  int? order;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  ShopDecorationCollection({this.id, this.name, this.code, this.shopDecCategoryId, this.image, this.order, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy});

  ShopDecorationCollection.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["shop_dec_category_id"] is String) {
      shopDecCategoryId = json["shop_dec_category_id"];
    }
    if(json["image"] is Map) {
      image = json["image"] == null ? null : ImageShop.fromJson(json["image"]);
    }
    if(json["order"] is int) {
      order = json["order"];
    }
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["shop_dec_category_id"] = shopDecCategoryId;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["order"] = order;
    _data["created_at"] = createdAt;
    _data["created_by"] = createdBy;
    _data["updated_at"] = updatedAt;
    _data["updated_by"] = updatedBy;
    return _data;
  }
}

class ImageShop {
  String? id;
  String? name;
  String? extension;
  String? originalName;
  int? size;
  String? type;
  String? description;
  String? content;

  ImageShop({this.id, this.name, this.extension, this.originalName, this.size, this.type, this.description, this.content});

  ImageShop.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
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
    if(json["content"] is String) {
      content = json["content"];
    }
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

class ShopStatus {
  String? id;
  String? name;
  String? code;
  String? fromAt;
  dynamic toAt;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  ShopStatus({this.id, this.name, this.code, this.fromAt, this.toAt, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy});

  ShopStatus.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["from_at"] is String) {
      fromAt = json["from_at"];
    }
    toAt = json["to_at"];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["from_at"] = fromAt;
    _data["to_at"] = toAt;
    _data["created_at"] = createdAt;
    _data["created_by"] = createdBy;
    _data["updated_at"] = updatedAt;
    _data["updated_by"] = updatedBy;
    return _data;
  }
}

class Background {
  String? id;
  dynamic name;
  dynamic extension;
  dynamic originalName;
  int? size;
  dynamic type;
  dynamic description;
  dynamic content;

  Background({this.id, this.name, this.extension, this.originalName, this.size, this.type, this.description, this.content});

  Background.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    name = json["name"];
    extension = json["extension"];
    originalName = json["original_name"];
    if(json["size"] is int) {
      size = json["size"];
    }
    type = json["type"];
    description = json["description"];
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

class Avatar {
  String? id;
  dynamic name;
  dynamic extension;
  dynamic originalName;
  int? size;
  dynamic type;
  dynamic description;
  dynamic content;

  Avatar({this.id, this.name, this.extension, this.originalName, this.size, this.type, this.description, this.content});

  Avatar.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    name = json["name"];
    extension = json["extension"];
    originalName = json["original_name"];
    if(json["size"] is int) {
      size = json["size"];
    }
    type = json["type"];
    description = json["description"];
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