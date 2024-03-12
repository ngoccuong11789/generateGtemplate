class ResponseData {
  ResponseData({
    required this.data,
    required this.success,
    this.error,
  });

  late final DataProduct data;
  late final bool success;
  late final dynamic error;

  ResponseData.fromJson(Map<String, dynamic> json) {
    data = DataProduct.fromJson(json['data']);
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['success'] = success;
    _data['error'] = error;
    return _data;
  }
}

class DataProduct {
  DataProduct({
    required this.page,
    required this.pageSize,
    required this.totalElement,
    required this.dataProduct,
  });

  final int page;
  final int pageSize;
  final int totalElement;
  final List<CartProductResponse> dataProduct;

  DataProduct.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        pageSize = json['pageSize'],
        totalElement = json['totalElement'],
        dataProduct = List.from(json['data'])
            .map((e) => CartProductResponse.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['pageSize'] = pageSize;
    _data['totalElement'] = totalElement;
    _data['data'] = dataProduct.map((e) => e.toJson()).toList();
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class CartProductResponse {
  CartProductResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.strSku,
    required this.quantity,
    required this.avatar,
    required this.description,
    required this.subLabel,
    required this.prices,
    required this.stocks,
    required this.point,
    required this.sumReview,
    this.reviews,
    this.shopSectionIds,
    required this.shop,
    required this.catalogs,
    required this.attributes,
    required this.hashtags,
    required this.attachments,
    required this.isPricingDefault,
    required this.isPublic,
  });

  late final String id;
  late final String name;
  late final num price;
  late final num originalPrice;
  late final num quantity;
  late final Avatar avatar;
  late final String description;
  late final String subLabel;
  late final double point;
  late final num sumReview;
  late final Shop shop;
  late final String voucher;
  late final String strSku;
  late final List<Prices>? prices;
  late final List<Stocks>? stocks;
  late final List<Reviews>? reviews;
  late final List<String>? shopSectionIds;
  late final List<Catalogs>? catalogs;
  late final List<Attributes>? attributes;
  late final List<String>? hashtags;
  late final List<Attachments>? attachments;
  late final bool? isPricingDefault;
  late final bool? isPublic;

  CartProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    originalPrice = json['original_price'];
    quantity = json['quantity'];
    avatar = Avatar.fromJson(json['avatar']);
    description = json['description'];
    subLabel = json['sub_label'];
    point = json['point'];
    shop = Shop.fromJson(json['shop']);
    voucher = json['voucher'];
    strSku = json['str_sku'] ?? "";
    prices = json['prices'] != null
        ? List.from(json['prices']).map((e) => Prices.fromJson(e)).toList()
        : [];
    stocks = json['stocks'] != null
        ? List.from(json['stocks']).map((e) => Stocks.fromJson(e)).toList()
        : [];
    sumReview = json['sum_review'];
    reviews = json['reviews'] != null
        ? List.from(json['reviews']).map((e) => Reviews.fromJson(e)).toList()
        : [];
    shopSectionIds = json['shop_section_ids'] != null
        ? List.from(json['shop_section_ids']).map((e) => e.toString()).toList()
        : [];
    catalogs = json['catalogs'] != null
        ? List.from(json['catalogs']).map((e) => Catalogs.fromJson(e)).toList()
        : [];
    attributes = json['attributes'] != null
        ? List.from(json['attributes'])
            .map((e) => Attributes.fromJson(e))
            .toList()
        : [];
    hashtags = json['hashtags'] != null
        ? List.castFrom<dynamic, String>(json['hashtags'])
        : [];
    attachments = json['attachments'] != null
        ? List.from(json['attachments'])
            .map((e) => Attachments.fromJson(e))
            .toList()
        : [];
    isPricingDefault = json['is_pricing_default'];
    isPublic = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['original_price'] = originalPrice;
    _data['str_sku'] = strSku;
    _data['quantity'] = quantity;
    _data['avatar'] = avatar.toJson();
    _data['description'] = description;
    _data['sub_label'] = subLabel;
    _data['prices'] = prices?.map((e) => e.toJson()).toList();
    _data['stocks'] = stocks?.map((e) => e.toJson()).toList();
    _data['point'] = point;
    _data['sum_review'] = sumReview;
    _data['reviews'] = reviews;
    _data['shop_section_ids'] = shopSectionIds;
    _data['shop'] = shop.toJson();
    _data['catalogs'] = catalogs?.map((e) => e.toJson()).toList();
    _data['attributes'] = attributes?.map((e) => e.toJson()).toList();
    _data['hashtags'] = hashtags;
    _data['attachments'] = attachments?.map((e) => e.toJson()).toList();
    _data['is_pricing_default'] = isPricingDefault;
    _data['is_public'] = isPublic;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Avatar {
  Avatar({
    required this.id,
    required this.extension,
    required this.originalName,
    required this.size,
    required this.type,
    required this.description,
    required this.signature,
  });

  late final String id;
  late final String? extension;
  late final String? originalName;
  late final num size;
  late final String? type;
  late final String? description;
  late final String? signature;

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    extension = json['extension'];
    originalName = json['original_name'];
    size = json['size'];
    type = json['type'];
    description = json['description'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['extension'] = extension;
    _data['original_name'] = originalName;
    _data['size'] = size;
    _data['type'] = type;
    _data['description'] = description;
    _data['signature'] = signature;
    return _data;
  }
}

class Prices {
  Prices({
    required this.id,
    required this.name,
    required this.code,
    required this.variations,
    required this.htmlSource,
    required this.order,
  });

  late final String id;
  late final String name;
  late final String code;
  late final List<Variations> variations;
  late final String htmlSource;
  late final num order;

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    variations = List.from(json['variations'])
        .map((e) => Variations.fromJson(e))
        .toList();
    htmlSource = json['html_source'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['variations'] = variations.map((e) => e.toJson()).toList();
    _data['html_source'] = htmlSource;
    _data['order'] = order;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Variations {
  Variations({
    required this.id,
    required this.name,
    required this.code,
    required this.order,
    required this.color,
    required this.image,
    required this.pricingId,
  });

  late final String id;
  late final String name;
  late final String code;
  late final num order;
  late final String color;
  late final ImageModel image;
  late final String pricingId;

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    order = json['order'];
    color = json['color'];
    image = ImageModel.fromJson(json['image']);
    pricingId = json['pricing_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['order'] = order;
    _data['color'] = color;
    _data['image'] = image.toJson();
    _data['pricing_id'] = pricingId;
    return _data;
  }
}

class ImageModel {
  ImageModel({
    required this.id,
    required this.extension,
    required this.originalName,
    required this.size,
    required this.type,
    required this.description,
    required this.signature,
  });

  late final String id;
  late final String extension;
  late final String originalName;
  late final num size;
  late final String type;
  late final String description;
  late final String signature;

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    extension = json['extension'];
    originalName = json['original_name'];
    size = json['size'];
    type = json['type'];
    description = json['description'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['extension'] = extension;
    _data['original_name'] = originalName;
    _data['size'] = size;
    _data['type'] = type;
    _data['description'] = description;
    _data['signature'] = signature;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Stocks {
  Stocks({
    required this.productId,
    required this.variationFirstId,
    this.variationSecondId,
    required this.variationFirst,
    this.variationSecond,
    required this.orderFirst,
    required this.orderSecond,
    required this.quantity,
    required this.price,
    required this.sku,
  });

  late final String productId;
  late final String variationFirstId;
  late final dynamic variationSecondId;
  late final VariationFirst variationFirst;
  late final dynamic variationSecond;
  late final num orderFirst;
  late final num orderSecond;
  late final num quantity;
  late final num price;
  late final String sku;

  Stocks.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    variationFirstId = json['variation_first_id'];
    variationSecondId = null;
    variationFirst = VariationFirst.fromJson(json['variation_first']);
    variationSecond = null;
    orderFirst = json['order_first'];
    orderSecond = json['order_second'];
    quantity = json['quantity'];
    price = json['price'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['variation_first_id'] = variationFirstId;
    _data['variation_second_id'] = variationSecondId;
    _data['variation_first'] = variationFirst.toJson();
    _data['variation_second'] = variationSecond;
    _data['order_first'] = orderFirst;
    _data['order_second'] = orderSecond;
    _data['quantity'] = quantity;
    _data['price'] = price;
    _data['sku'] = sku;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class VariationFirst {
  VariationFirst({
    required this.id,
    required this.name,
    required this.code,
    required this.order,
    required this.color,
    required this.image,
    required this.pricingId,
  });

  late final String id;
  late final String name;
  late final String code;
  late final num order;
  late final String color;
  late final ImageModel image;
  late final String pricingId;

  VariationFirst.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    order = json['order'];
    color = json['color'];
    image = ImageModel.fromJson(json['image']);
    pricingId = json['pricing_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['order'] = order;
    _data['color'] = color;
    _data['image'] = image.toJson();
    _data['pricing_id'] = pricingId;
    return _data;
  }
}

class Reviews {
  Reviews({
    required this.value,
    required this.average,
    required this.countReview,
  });

  late final num value;
  late final num average;
  late final num countReview;

  Reviews.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    average = json['average'];
    countReview = json['count_review'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['average'] = average;
    _data['count_review'] = countReview;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.addresses,
  });

  late final String id;
  late final String name;
  late final List<Addresses> addresses;

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addresses =
        List.from(json['addresses']).map((e) => Addresses.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['addresses'] = addresses.map((e) => e.toJson()).toList();
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Addresses {
  Addresses({
    required this.id,
    required this.country,
    required this.province,
    required this.district,
    required this.ward,
  });

  late final String id;
  late final String country;
  late final String province;
  late final String district;
  late final String ward;

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    province = json['province'];
    district = json['district'];
    ward = json['ward'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['country'] = country;
    _data['province'] = province;
    _data['district'] = district;
    _data['ward'] = ward;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Catalogs {
  Catalogs({
    required this.id,
    this.globalId,
    required this.referenceGlobalId,
    required this.referenceId,
    required this.nameFinal,
  });

  late final String id;
  late final dynamic globalId;
  late final String referenceGlobalId;
  late final String referenceId;
  late final String nameFinal;

  Catalogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    globalId = null;
    referenceGlobalId = json['reference_global_id'];
    referenceId = json['reference_id'];
    nameFinal = json['name_final'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['global_id'] = globalId;
    _data['reference_global_id'] = referenceGlobalId;
    _data['reference_id'] = referenceId;
    _data['name_final'] = nameFinal;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Attributes {
  Attributes({
    required this.id,
    required this.code,
    required this.value,
    this.parentId,
    required this.values,
    required this.isParent,
  });

  late final String id;
  late final String code;
  late final String value;
  late final dynamic parentId;
  late final List<Values> values;
  late final bool isParent;

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    value = json['value'];
    parentId = null;
    values = List.from(json['values']).map((e) => Values.fromJson(e)).toList();
    isParent = json['is_parent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['value'] = value;
    _data['parent_id'] = parentId;
    _data['values'] = values.map((e) => e.toJson()).toList();
    _data['is_parent'] = isParent;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Values {
  Values({
    required this.id,
    required this.code,
    required this.value,
    required this.parentId,
    this.values,
    required this.isParent,
  });

  late final String id;
  late final String code;
  late final String value;
  late final String parentId;
  late final dynamic values;
  late final bool isParent;

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    value = json['value'];
    parentId = json['parent_id'];
    values = null;
    isParent = json['is_parent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['value'] = value;
    _data['parent_id'] = parentId;
    _data['values'] = values;
    _data['is_parent'] = isParent;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Attachments {
  Attachments({
    required this.id,
    required this.extension,
    required this.originalName,
    required this.size,
    required this.type,
    required this.description,
    required this.signature,
  });

  late final String id;
  late final String extension;
  late final String originalName;
  late final num size;
  late final String type;
  late final String description;
  late final String signature;

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    extension = json['extension'];
    originalName = json['original_name'];
    size = json['size'];
    type = json['type'];
    description = json['description'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['extension'] = extension;
    _data['original_name'] = originalName;
    _data['size'] = size;
    _data['type'] = type;
    _data['description'] = description;
    _data['signature'] = signature;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
