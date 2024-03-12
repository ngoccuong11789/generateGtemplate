import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

/// id : "9d039640-4193-11ee-8f6c-37fee4f80b41"
/// name : "Gold Elephant Earrings"
/// price : 49000
/// original_price : 50300
/// str_sku : "SDA_SKSDA_SK2SDA_SK3SDA_SK4"
/// quantity : 192
/// avatar : {"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"}
/// description : "string"
/// sub_label : "Top 1 best seller in shoe"
/// prices : [{"id":"9d039641-4193-11ee-8f6c-37fee4f80b41","name":"Product pricing type color","code":"COLOR code for product pricing","variations":[{"id":"9d045990-4193-11ee-8f6c-37fee4f80b41","name":"red","code":"RED","order":1,"color":"#ff0000","image":{"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"},"pricing_id":"9d039641-4193-11ee-8f6c-37fee4f80b41"}],"html_source":"string","order":1,"is_contains_image":true},{"id":"9d04f5d0-4193-11ee-8f6c-37fee4f80b41","name":"Size","code":"Size","variations":[{"id":"9d051ce0-4193-11ee-8f6c-37fee4f80b41","name":"X","code":"X","order":1,"color":"#0000ff","image":{"id":"20230823T153243394869369_00000000-0000-0000-0000-000000000000_blue","extension":".jpg","original_name":"blue.jpg","size":25821,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Blue","signature":"367b629d33b82c237f340f84dbf9b83a"},"pricing_id":"9d04f5d0-4193-11ee-8f6c-37fee4f80b41"}],"html_source":"string","order":2,"is_contains_image":false}]
/// stocks : [{"id":"9d056b00-4193-11ee-8f6c-37fee4f80b41","product_id":"9d039640-4193-11ee-8f6c-37fee4f80b41","variation_first_id":"9d045990-4193-11ee-8f6c-37fee4f80b41","variation_second_id":"9d051ce0-4193-11ee-8f6c-37fee4f80b41","variation_first":{"id":"9d045990-4193-11ee-8f6c-37fee4f80b41","name":"red","code":"RED","order":1,"color":"#ff0000","image":{"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"},"pricing_id":"9d039641-4193-11ee-8f6c-37fee4f80b41"},"variation_second":{"id":"9d051ce0-4193-11ee-8f6c-37fee4f80b41","name":"X","code":"X","order":1,"color":"#0000ff","image":{"id":"20230823T153243394869369_00000000-0000-0000-0000-000000000000_blue","extension":".jpg","original_name":"blue.jpg","size":25821,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Blue","signature":"367b629d33b82c237f340f84dbf9b83a"},"pricing_id":"9d04f5d0-4193-11ee-8f6c-37fee4f80b41"},"order_first":1,"order_second":1,"quantity":100,"price":51,"original_price":52,"sku":"SDA_SK"},{"id":"9d07b4f0-4193-11ee-8f6c-37fee4f80b41","product_id":"9d039640-4193-11ee-8f6c-37fee4f80b41","variation_first_id":"9d045990-4193-11ee-8f6c-37fee4f80b41","variation_second_id":null,"variation_first":{"id":"9d045990-4193-11ee-8f6c-37fee4f80b41","name":"red","code":"RED","order":1,"color":"#ff0000","image":{"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"},"pricing_id":"9d039641-4193-11ee-8f6c-37fee4f80b41"},"variation_second":null,"order_first":1,"order_second":2,"quantity":11,"price":49,"original_price":50.3,"sku":"SDA_SK3"},{"id":"9d06ca90-4193-11ee-8f6c-37fee4f80b41","product_id":"9d039640-4193-11ee-8f6c-37fee4f80b41","variation_first_id":null,"variation_second_id":"9d051ce0-4193-11ee-8f6c-37fee4f80b41","variation_first":null,"variation_second":{"id":"9d051ce0-4193-11ee-8f6c-37fee4f80b41","name":"X","code":"X","order":1,"color":"#0000ff","image":{"id":"20230823T153243394869369_00000000-0000-0000-0000-000000000000_blue","extension":".jpg","original_name":"blue.jpg","size":25821,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Blue","signature":"367b629d33b82c237f340f84dbf9b83a"},"pricing_id":"9d04f5d0-4193-11ee-8f6c-37fee4f80b41"},"order_first":2,"order_second":1,"quantity":30,"price":52,"original_price":53.2,"sku":"SDA_SK2"},{"id":"9d08c660-4193-11ee-8f6c-37fee4f80b41","product_id":"9d039640-4193-11ee-8f6c-37fee4f80b41","variation_first_id":null,"variation_second_id":null,"variation_first":null,"variation_second":null,"order_first":2,"order_second":2,"quantity":51,"price":50.3,"original_price":51.1,"sku":"SDA_SK4"}]
/// point : 2.6
/// sum_review : 150
/// reviews : [{"value":1,"average":100,"count_review":10},{"value":2,"average":20,"count_review":10},{"value":3,"average":100,"count_review":10},{"value":4,"average":10,"count_review":10},{"value":5,"average":1500,"count_review":10}]
/// shop_section_ids : null
/// shop : {"id":"d8bd0802-ff3a-424e-8252-0a6353a78505","name":"WIBU Store","addresses":[{"id":"a55ae210-7c00-477f-a7ad-293f6242f64d","country":"Thành phố Cần Thơ","province":"Thành phố Cần Thơ","district":"Huyện Cờ Đỏ","ward":"Thị Trấn Cờ Đỏ"}]}
/// catalogs : [{"id":"3cc6d0e0-4255-11ee-8109-3b13860b1384","global_id":"e76e2190-4252-11ee-8109-3b13860b1384","reference_global_id":"e76e2190-4252-11ee-8109-3b13860b1384","reference_global":"Kitchen","reference_id":"2fd1dc40-4255-11ee-8109-3b13860b1384>3cc6d0e0-4255-11ee-8109-3b13860b1384","reference":"Kitchen Stuffs>Pans","name_final":"Pans","name_global":"Kitchen"}]
/// catalog_ids : ["3cc6d0e0-4255-11ee-8109-3b13860b1384"]
/// attributes : [{"id":"7e086760-3816-11ee-9c62-e37843d7d86c","code":"Condition","value":"Condition","parent_id":null,"values":[{"id":"9d930cc0-3816-11ee-9c62-e37843d7d86c","code":"Used","value":"Used","parent_id":"7e086760-3816-11ee-9c62-e37843d7d86c","values":null,"is_parent":false}],"is_parent":true},{"id":"c764c4d0-3816-11ee-bf65-09db58c0d7dd","code":"Voucher","value":"Voucher","parent_id":null,"values":[{"id":"35ebc070-3817-11ee-bf65-09db58c0d7dd","code":"Discount","value":"Discount","parent_id":"c764c4d0-3816-11ee-bf65-09db58c0d7dd","values":null,"is_parent":false}],"is_parent":true},{"id":"4a9d4c50-3817-11ee-bf65-09db58c0d7dd","code":"Shipment Method","value":"Shipment Method","parent_id":null,"values":[{"id":"77fcbf00-3817-11ee-bf65-09db58c0d7dd","code":"Soctrip","value":"Soctrip","parent_id":"4a9d4c50-3817-11ee-bf65-09db58c0d7dd","values":null,"is_parent":false}],"is_parent":true},{"id":"c9b30520-3817-11ee-bf65-09db58c0d7dd","code":"Brand","value":"Brand","parent_id":null,"values":[{"id":"04252da0-3818-11ee-bf65-09db58c0d7dd","code":"Nike","value":"Nike","parent_id":"c9b30520-3817-11ee-bf65-09db58c0d7dd","values":null,"is_parent":false}],"is_parent":true}]
/// hashtags : ["shoe","basic"]
/// attachments : [{"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Men's Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"},{"id":"20230823T153243394869369_00000000-0000-0000-0000-000000000000_blue","extension":".jpg","original_name":"blue.jpg","size":25821,"type":"image/jpeg","description":"Nike Men's Kobe Mamba Fury Basketball Shoes Blue","signature":"367b629d33b82c237f340f84dbf9b83a"}]
/// shopDetailDTO : {"id":"a55ae210-7c00-477f-a7ad-293f6242f64d","name":"Shop Demo","avatar":{"id":"20230825T160516585417659_00000000-0000-0000-0000-000000000000_image4","name":null,"extension":null,"original_name":null,"size":0,"type":null,"description":null,"content":null},"background":{"id":"20230825T160516618344697_00000000-0000-0000-0000-000000000000_image5","name":null,"extension":null,"original_name":null,"size":0,"type":null,"description":null,"content":null},"followers":0,"total_products":606,"rating":2.4,"slogan":"Shop Soctrip demo","shop_status_id":"b64c5323-c2a5-42bd-a060-15550c574b3d","created_at":"2023-08-23T21:45:27.781","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-08-28T11:11:02.156","updated_by":"11111111-1111-1111-1111-111111111111"}
/// is_pricing_default : true
/// is_public : true
///
part 'ProductDetail.g.dart';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    String? id,
    String? name,
    num? price,
    num? sold,
    num? originalPrice,
    String? strSku,
    num? quantity,
    Attachments? avatar,
    String? description,
    String? subLabel,
    List<PricesProductDetail>? prices,
    List<Stocks>? stocks,
    num? point,
    num? sumReview,
    List<Reviews>? reviews,
    dynamic shopSectionIds,
    Shop? shop,
    List<Catalogs>? catalogs,
    List<String>? catalogIds,
    List<String>? productsRelated,
    List<String>? productsCombo,
    List<Attributes>? attributes,
    List<String>? hashtags,
    List<Attachments>? attachments,
    ShopDetailDto? shopDetailDTO,
    bool? isPricingDefault,
    bool? isPublic,
    bool? isBookmark,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _originalPrice = originalPrice;
    _strSku = strSku;
    _quantity = quantity;
    _avatar = avatar;
    _description = description;
    _subLabel = subLabel;
    _prices = prices;
    _sold = sold;
    _stocks = stocks;
    _point = point;
    _sumReview = sumReview;
    _reviews = reviews;
    _shopSectionIds = shopSectionIds;
    _shop = shop;
    _catalogs = catalogs;
    _catalogIds = catalogIds;
    _productsRelated = productsRelated;
    _productsCombo = productsCombo;
    _attributes = attributes;
    _hashtags = hashtags;
    _attachments = attachments;
    _shopDetailDTO = shopDetailDTO;
    _isPricingDefault = isPricingDefault;
    _isPublic = isPublic;
  }

  ProductDetail.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _optionCategoryId = json['option_category_id'];
    _price = json['price'];
    _sold = json['sold'];
    _originalPrice = json['original_price'];
    _strSku = json['str_sku'];
    _quantity = json['quantity'];
    _avatar = json['avatar'] != null ? Attachments.fromJson(json['avatar']) : null;
    _description = json['description'];
    _subLabel = json['sub_label'];
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(PricesProductDetail.fromJson(v));
      });
    }
    if (json['stocks'] != null) {
      _stocks = [];
      json['stocks'].forEach((v) {
        _stocks?.add(Stocks.fromJson(v));
      });
    }
    _point = json['point'];
    _sumReview = json['sum_review'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _shopSectionIds = json['shop_section_ids'];
    _shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    if (json['catalogs'] != null) {
      _catalogs = [];
      json['catalogs'].forEach((v) {
        _catalogs?.add(Catalogs.fromJson(v));
      });
    }
    _catalogIds =
        json['catalog_ids'] != null ? json['catalog_ids'].cast<String>() : [];
    _productsRelated =
        json['products_related'] != null ? json['products_related'].cast<String>() : [];
    _productsCombo =
    json['products_combo'] != null ? json['products_combo'].cast<String>() : [];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    _hashtags = json['hashtags'] != null ? json['hashtags'].cast<String>() : [];
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
    _shopDetailDTO = json['shopDetailDTO'] != null
        ? ShopDetailDto.fromJson(json['shopDetailDTO'])
        : null;
    _isPricingDefault = json['is_pricing_default'];
    _isPublic = json['is_public'];
  }

  String? _id;
  String? _name;
  String? _optionCategoryId;
  num? _price;
  num? _sold;
  num? _originalPrice;
  String? _strSku;
  num? _quantity;
  Attachments? _avatar;
  String? _description;
  String? _subLabel;
  List<PricesProductDetail>? _prices;
  List<Stocks>? _stocks;
  num? _point;
  num? _sumReview;
  List<Reviews>? _reviews;
  dynamic _shopSectionIds;
  Shop? _shop;
  List<Catalogs>? _catalogs;
  List<String>? _catalogIds;
  List<String>? _productsRelated;
  List<String>? _productsCombo;
  List<Attributes>? _attributes;
  List<String>? _hashtags;
  List<Attachments>? _attachments;
  ShopDetailDto? _shopDetailDTO;
  bool? _isPricingDefault;
  bool? _isPublic;
  bool? _isBookmark;

  ProductDetail copyWith({
    String? id,
    String? name,
    String? optionCategoryId,
    num? price,
    num? sold,
    num? originalPrice,
    String? strSku,
    num? quantity,
    Attachments? avatar,
    String? description,
    String? subLabel,
    List<PricesProductDetail>? prices,
    List<Stocks>? stocks,
    num? point,
    num? sumReview,
    List<Reviews>? reviews,
    dynamic shopSectionIds,
    Shop? shop,
    List<Catalogs>? catalogs,
    List<String>? catalogIds,
    List<String>? productsRelated,
    List<String>? productsCombo,
    List<Attributes>? attributes,
    List<String>? hashtags,
    List<Attachments>? attachments,
    ShopDetailDto? shopDetailDTO,
    bool? isPricingDefault,
    bool? isPublic,
    bool? isBookmark,
  }) =>
      ProductDetail(
        id: id ?? _id,
        name: name ?? _name,
        price: price ?? _price,
        sold: sold ?? _sold,
        originalPrice: originalPrice ?? _originalPrice,
        strSku: strSku ?? _strSku,
        quantity: quantity ?? _quantity,
        avatar: avatar ?? _avatar,
        description: description ?? _description,
        subLabel: subLabel ?? _subLabel,
        prices: prices ?? _prices,
        stocks: stocks ?? _stocks,
        point: point ?? _point,
        sumReview: sumReview ?? _sumReview,
        reviews: reviews ?? _reviews,
        shopSectionIds: shopSectionIds ?? _shopSectionIds,
        shop: shop ?? _shop,
        catalogs: catalogs ?? _catalogs,
        catalogIds: catalogIds ?? _catalogIds,
        productsRelated: productsRelated ?? _productsRelated,
        productsCombo: productsCombo ?? _productsCombo,
        attributes: attributes ?? _attributes,
        hashtags: hashtags ?? _hashtags,
        attachments: attachments ?? _attachments,
        shopDetailDTO: shopDetailDTO ?? _shopDetailDTO,
        isPricingDefault: isPricingDefault ?? _isPricingDefault,
        isPublic: isPublic ?? _isPublic,
        isBookmark: isBookmark ?? _isBookmark,
      );

  String? get id => _id;

  String? get name => _name;

  num? get price => _price;

  num? get sold => _sold;

  num? get originalPrice => _originalPrice;

  String? get strSku => _strSku;

  num? get quantity => _quantity;

  Attachments? get avatar => _avatar;

  String? get description => _description;

  String? get subLabel => _subLabel;

  List<PricesProductDetail>? get prices => _prices;

  List<Stocks>? get stocks => _stocks;

  num? get point => _point;

  num? get sumReview => _sumReview;

  List<Reviews>? get reviews => _reviews;

  dynamic get shopSectionIds => _shopSectionIds;

  Shop? get shop => _shop;

  List<Catalogs>? get catalogs => _catalogs;

  List<String>? get catalogIds => _catalogIds;

  List<String>? get productsRelated => _productsRelated;

  List<String>? get productsCombo => _productsCombo;

  List<Attributes>? get attributes => _attributes;

  List<String>? get hashtags => _hashtags;

  List<Attachments>? get attachments => _attachments;

  ShopDetailDto? get shopDetailDTO => _shopDetailDTO;

  bool? get isPricingDefault => _isPricingDefault;

  bool? get isPublic => _isPublic;
  bool? get isBookmark => _isBookmark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['option_category_id'] = _optionCategoryId;
    map['price'] = _price;
    map['sold'] = _sold;
    map['original_price'] = _originalPrice;
    map['str_sku'] = _strSku;
    map['quantity'] = _quantity;
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    map['description'] = _description;
    map['sub_label'] = _subLabel;
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    if (_stocks != null) {
      map['stocks'] = _stocks?.map((v) => v.toJson()).toList();
    }
    map['point'] = _point;
    map['sum_review'] = _sumReview;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['shop_section_ids'] = _shopSectionIds;
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    if (_catalogs != null) {
      map['catalogs'] = _catalogs?.map((v) => v.toJson()).toList();
    }
    map['catalog_ids'] = _catalogIds;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    map['products_related'] = _productsRelated;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    map['products_combo'] = _productsRelated;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    map['hashtags'] = _hashtags;

    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }

    if (_shopDetailDTO != null) {
      map['shopDetailDTO'] = _shopDetailDTO?.toJson();
    }
    map['is_pricing_default'] = _isPricingDefault;
    map['is_public'] = _isPublic;
    return map;
  }
  @override
  String toString() {
    return toJson().toString();
  }
}

/// id : "a55ae210-7c00-477f-a7ad-293f6242f64d"
/// name : "Shop Demo"
/// avatar : {"id":"20230825T160516585417659_00000000-0000-0000-0000-000000000000_image4","name":null,"extension":null,"original_name":null,"size":0,"type":null,"description":null,"content":null}
/// background : {"id":"20230825T160516618344697_00000000-0000-0000-0000-000000000000_image5","name":null,"extension":null,"original_name":null,"size":0,"type":null,"description":null,"content":null}
/// followers : 0
/// total_products : 606
/// rating : 2.4
/// slogan : "Shop Soctrip demo"
/// shop_status_id : "b64c5323-c2a5-42bd-a060-15550c574b3d"
/// created_at : "2023-08-23T21:45:27.781"
/// created_by : "00000000-0000-0000-0000-000000000000"
/// updated_at : "2023-08-28T11:11:02.156"
/// updated_by : "11111111-1111-1111-1111-111111111111"

ShopDetailDto shopDetailDtoFromJson(String str) =>
    ShopDetailDto.fromJson(json.decode(str));

String shopDetailDtoToJson(ShopDetailDto data) => json.encode(data.toJson());

class ShopDetailDto {
  ShopDetailDto({
    String? id,
    String? name,
    Avatar? avatar,
    Background? background,
    num? followers,
    num? totalProducts,
    num? rating,
    String? slogan,
    String? shopStatusId,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    List<VouchersInShop>? vouchers,
  }) {
    _id = id;
    _name = name;
    _avatar = avatar;
    _background = background;
    _followers = followers;
    _totalProducts = totalProducts;
    _rating = rating;
    _slogan = slogan;
    _shopStatusId = shopStatusId;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _vouchers = vouchers;
  }

  ShopDetailDto.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    _background = json['background'] != null
        ? Background.fromJson(json['background'])
        : null;
    _followers = json['followers'];
    _totalProducts = json['total_products'];
    _rating = json['rating'];
    _slogan = json['slogan'];
    _shopStatusId = json['shop_status_id'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    if (json['vouchers'] != null) {
      _vouchers = [];
      json['vouchers'].forEach((v) {
        _vouchers?.add(VouchersInShop.fromJson(v));
      });
    }
  }

  String? _id;
  String? _name;
  Avatar? _avatar;
  Background? _background;
  num? _followers;
  num? _totalProducts;
  num? _rating;
  String? _slogan;
  String? _shopStatusId;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  List<VouchersInShop>? _vouchers;

  String? get id => _id;

  String? get name => _name;

  Avatar? get avatar => _avatar;

  Background? get background => _background;

  num? get followers => _followers;

  num? get totalProducts => _totalProducts;

  num? get rating => _rating;

  String? get slogan => _slogan;

  String? get shopStatusId => _shopStatusId;

  String? get createdAt => _createdAt;

  String? get createdBy => _createdBy;

  String? get updatedAt => _updatedAt;

  String? get updatedBy => _updatedBy;

  List<VouchersInShop>? get vouchers => _vouchers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    if (_background != null) {
      map['background'] = _background?.toJson();
    }
    map['followers'] = _followers;
    map['total_products'] = _totalProducts;
    map['rating'] = _rating;
    map['slogan'] = _slogan;
    map['shop_status_id'] = _shopStatusId;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;

    if (_vouchers != null) {
      map['vouchers'] = _vouchers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ShopDetailDto copyWith({
    String? id,
    String? name,
    Avatar? avatar,
    Background? background,
    num? followers,
    num? totalProducts,
    num? rating,
    String? slogan,
    String? shopStatusId,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    List<VouchersInShop>? vouchers,
  }) {
    return ShopDetailDto(
      id: id ?? _id,
      name: name ?? _name,
      avatar: avatar ?? _avatar,
      background: background ?? _background,
      followers: followers ?? _followers,
      totalProducts: totalProducts ?? _totalProducts,
      rating: rating ?? _rating,
      slogan: slogan ?? _slogan,
      shopStatusId: shopStatusId ?? _shopStatusId,
      createdAt: createdAt ?? _createdAt,
      createdBy: createdBy ?? _createdBy,
      updatedAt: updatedAt ?? _updatedAt,
      updatedBy: updatedBy ?? _updatedBy,
      vouchers: vouchers ?? _vouchers,
    );
  }
  @override
  String toString() {
    return toJson().toString();
  }
}
///Voucher shop///////////////

@JsonSerializable(fieldRename: FieldRename.snake)
class VouchersInShop {
  final String id;
  final String code;
  final String name;
  final String startDate;
  final String endDate;

  final String? description;
  final String voucherStatus;
  final String discountType;
  final double discountAmount;
  
  VouchersInShop(
      {required this.id,
        required this.code,
        required this.name,
        required this.description,
        required this.voucherStatus,
        required this.discountType,
        required this.discountAmount,
        required this.startDate,
        required this.endDate
      });

  factory VouchersInShop.fromJson(Map<String, dynamic> json) => _$VouchersInShopFromJson(json);


  Map<String, dynamic> toJson() => _$VouchersInShopToJson(this);

}

/// id : "20230825T160516618344697_00000000-0000-0000-0000-000000000000_image5"
/// name : null
/// extension : null
/// original_name : null
/// size : 0
/// type : null
/// description : null
/// content : null

Background backgroundFromJson(String str) =>
    Background.fromJson(json.decode(str));

String backgroundToJson(Background data) => json.encode(data.toJson());

class Background {
  Background({
    String? id,
    dynamic name,
    dynamic extension,
    dynamic originalName,
    num? size,
    dynamic type,
    dynamic description,
    dynamic content,
  }) {
    _id = id;
    _name = name;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
  }

  Background.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _content = json['content'];
  }

  String? _id;
  dynamic _name;
  dynamic _extension;
  dynamic _originalName;
  num? _size;
  dynamic _type;
  dynamic _description;
  dynamic _content;

  Background copyWith({
    String? id,
    dynamic name,
    dynamic extension,
    dynamic originalName,
    num? size,
    dynamic type,
    dynamic description,
    dynamic content,
  }) =>
      Background(
        id: id ?? _id,
        name: name ?? _name,
        extension: extension ?? _extension,
        originalName: originalName ?? _originalName,
        size: size ?? _size,
        type: type ?? _type,
        description: description ?? _description,
        content: content ?? _content,
      );

  String? get id => _id;

  dynamic get name => _name;

  dynamic get extension => _extension;

  dynamic get originalName => _originalName;

  num? get size => _size;

  dynamic get type => _type;

  dynamic get description => _description;

  dynamic get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['content'] = _content;
    return map;
  }
}

/// id : "20230825T160516585417659_00000000-0000-0000-0000-000000000000_image4"
/// name : null
/// extension : null
/// original_name : null
/// size : 0
/// type : null
/// description : null
/// content : null

Avatar avatarFromJson(String str) => Avatar.fromJson(json.decode(str));

String avatarToJson(Avatar data) => json.encode(data.toJson());

class Avatar {
  Avatar({
    String? id,
    dynamic name,
    dynamic extension,
    dynamic originalName,
    num? size,
    dynamic type,
    dynamic description,
    dynamic content,
  }) {
    _id = id;
    _name = name;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
  }

  Avatar.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _content = json['content'];
  }

  String? _id;
  dynamic _name;
  dynamic _extension;
  dynamic _originalName;
  num? _size;
  dynamic _type;
  dynamic _description;
  dynamic _content;

  Avatar copyWith({
    String? id,
    dynamic name,
    dynamic extension,
    dynamic originalName,
    num? size,
    dynamic type,
    dynamic description,
    dynamic content,
  }) =>
      Avatar(
        id: id ?? _id,
        name: name ?? _name,
        extension: extension ?? _extension,
        originalName: originalName ?? _originalName,
        size: size ?? _size,
        type: type ?? _type,
        description: description ?? _description,
        content: content ?? _content,
      );

  String? get id => _id;

  dynamic get name => _name;

  dynamic get extension => _extension;

  dynamic get originalName => _originalName;

  num? get size => _size;

  dynamic get type => _type;

  dynamic get description => _description;

  dynamic get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['content'] = _content;
    return map;
  }
}

/// id : "20230823T153208046807119_00000000-0000-0000-0000-000000000000_red"
/// extension : ".jpg"
/// original_name : "red.jpg"
/// size : 24158
/// type : "image/jpeg"
/// description : "Nike Men's Kobe Mamba Fury Basketball Shoes Red"
/// signature : "4ef41ceed79af4bb962e6ea5e88b0c67"

Attachments attachmentsFromJson(String str) =>
    Attachments.fromJson(json.decode(str));

String attachmentsToJson(Attachments data) => json.encode(data.toJson());

class Attachments {
  Attachments({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? signature,
    bool? isSelect
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _signature = signature;
    _isSelect = isSelect;
  }

  Attachments.fromJson(dynamic json) {
    _id = json['id'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _signature = json['signature'];
  }

  String? _id;
  String? _extension;
  String? _originalName;
  num? _size;
  String? _type;
  String? _description;
  String? _signature;
  bool? _isSelect;

  Attachments copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? signature,
    bool? isSelect
  }) =>
      Attachments(
        id: id ?? _id,
        extension: extension ?? _extension,
        originalName: originalName ?? _originalName,
        size: size ?? _size,
        type: type ?? _type,
        description: description ?? _description,
        signature: signature ?? _signature,
        isSelect: isSelect ?? _isSelect,
      );

  String? get id => _id;

  String? get extension => _extension;

  String? get originalName => _originalName;

  num? get size => _size;

  String? get type => _type;

  String? get description => _description;

  String? get signature => _signature;

  bool? get isSelect => _isSelect;

  set isSelect(bool? value) {
    _isSelect = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['signature'] = _signature;
    return map;
  }
}

/// id : "7e086760-3816-11ee-9c62-e37843d7d86c"
/// code : "Condition"
/// value : "Condition"
/// parent_id : null
/// values : [{"id":"9d930cc0-3816-11ee-9c62-e37843d7d86c","code":"Used","value":"Used","parent_id":"7e086760-3816-11ee-9c62-e37843d7d86c","values":null,"is_parent":false}]
/// is_parent : true

Attributes attributesFromJson(String str) =>
    Attributes.fromJson(json.decode(str));

String attributesToJson(Attributes data) => json.encode(data.toJson());

class Attributes {
  Attributes({
    String? id,
    String? code,
    String? value,
    dynamic parentId,
    List<Values>? values,
    bool? isParent,
  }) {
    _id = id;
    _code = code;
    _value = value;
    _parentId = parentId;
    _values = values;
    _isParent = isParent;
  }

  Attributes.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _value = json['value'];
    _parentId = json['parent_id'];
    if (json['values'] != null) {
      _values = [];
      json['values'].forEach((v) {
        _values?.add(Values.fromJson(v));
      });
    }
    _isParent = json['is_parent'];
  }

  String? _id;
  String? _code;
  String? _value;
  dynamic _parentId;
  List<Values>? _values;
  bool? _isParent;

  Attributes copyWith({
    String? id,
    String? code,
    String? value,
    dynamic parentId,
    List<Values>? values,
    bool? isParent,
  }) =>
      Attributes(
        id: id ?? _id,
        code: code ?? _code,
        value: value ?? _value,
        parentId: parentId ?? _parentId,
        values: values ?? _values,
        isParent: isParent ?? _isParent,
      );

  String? get id => _id;

  String? get code => _code;

  String? get value => _value;

  dynamic get parentId => _parentId;

  List<Values>? get values => _values;

  bool? get isParent => _isParent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['value'] = _value;
    map['parent_id'] = _parentId;
    if (_values != null) {
      map['values'] = _values?.map((v) => v.toJson()).toList();
    }
    map['is_parent'] = _isParent;
    return map;
  }
}

/// id : "9d930cc0-3816-11ee-9c62-e37843d7d86c"
/// code : "Used"
/// value : "Used"
/// parent_id : "7e086760-3816-11ee-9c62-e37843d7d86c"
/// values : null
/// is_parent : false

Values valuesFromJson(String str) => Values.fromJson(json.decode(str));

String valuesToJson(Values data) => json.encode(data.toJson());

class Values {
  Values({
    String? id,
    String? code,
    String? value,
    String? parentId,
    dynamic values,
    bool? isParent,
  }) {
    _id = id;
    _code = code;
    _value = value;
    _parentId = parentId;
    _values = values;
    _isParent = isParent;
  }

  Values.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _value = json['value'];
    _parentId = json['parent_id'];
    _values = json['values'];
    _isParent = json['is_parent'];
  }

  String? _id;
  String? _code;
  String? _value;
  String? _parentId;
  dynamic _values;
  bool? _isParent;

  Values copyWith({
    String? id,
    String? code,
    String? value,
    String? parentId,
    dynamic values,
    bool? isParent,
  }) =>
      Values(
        id: id ?? _id,
        code: code ?? _code,
        value: value ?? _value,
        parentId: parentId ?? _parentId,
        values: values ?? _values,
        isParent: isParent ?? _isParent,
      );

  String? get id => _id;

  String? get code => _code;

  String? get value => _value;

  String? get parentId => _parentId;

  dynamic get values => _values;

  bool? get isParent => _isParent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['value'] = _value;
    map['parent_id'] = _parentId;
    map['values'] = _values;
    map['is_parent'] = _isParent;
    return map;
  }
}

/// id : "3cc6d0e0-4255-11ee-8109-3b13860b1384"
/// global_id : "e76e2190-4252-11ee-8109-3b13860b1384"
/// reference_global_id : "e76e2190-4252-11ee-8109-3b13860b1384"
/// reference_global : "Kitchen"
/// reference_id : "2fd1dc40-4255-11ee-8109-3b13860b1384>3cc6d0e0-4255-11ee-8109-3b13860b1384"
/// reference : "Kitchen Stuffs>Pans"
/// name_final : "Pans"
/// name_global : "Kitchen"

Catalogs catalogsFromJson(String str) => Catalogs.fromJson(json.decode(str));

String catalogsToJson(Catalogs data) => json.encode(data.toJson());

class Catalogs {
  Catalogs({
    String? id,
    String? globalId,
    String? referenceGlobalId,
    String? referenceGlobal,
    String? referenceId,
    String? reference,
    String? nameFinal,
    String? nameGlobal,
  }) {
    _id = id;
    _globalId = globalId;
    _referenceGlobalId = referenceGlobalId;
    _referenceGlobal = referenceGlobal;
    _referenceId = referenceId;
    _reference = reference;
    _nameFinal = nameFinal;
    _nameGlobal = nameGlobal;
  }

  Catalogs.fromJson(dynamic json) {
    _id = json['id'];
    _globalId = json['global_id'];
    _referenceGlobalId = json['reference_global_id'];
    _referenceGlobal = json['reference_global'];
    _referenceId = json['reference_id'];
    _reference = json['reference'];
    _nameFinal = json['name_final'];
    _nameGlobal = json['name_global'];
  }

  String? _id;
  String? _globalId;
  String? _referenceGlobalId;
  String? _referenceGlobal;
  String? _referenceId;
  String? _reference;
  String? _nameFinal;
  String? _nameGlobal;

  Catalogs copyWith({
    String? id,
    String? globalId,
    String? referenceGlobalId,
    String? referenceGlobal,
    String? referenceId,
    String? reference,
    String? nameFinal,
    String? nameGlobal,
  }) =>
      Catalogs(
        id: id ?? _id,
        globalId: globalId ?? _globalId,
        referenceGlobalId: referenceGlobalId ?? _referenceGlobalId,
        referenceGlobal: referenceGlobal ?? _referenceGlobal,
        referenceId: referenceId ?? _referenceId,
        reference: reference ?? _reference,
        nameFinal: nameFinal ?? _nameFinal,
        nameGlobal: nameGlobal ?? _nameGlobal,
      );

  String? get id => _id;

  String? get globalId => _globalId;

  String? get referenceGlobalId => _referenceGlobalId;

  String? get referenceGlobal => _referenceGlobal;

  String? get referenceId => _referenceId;

  String? get reference => _reference;

  String? get nameFinal => _nameFinal;

  String? get nameGlobal => _nameGlobal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['global_id'] = _globalId;
    map['reference_global_id'] = _referenceGlobalId;
    map['reference_global'] = _referenceGlobal;
    map['reference_id'] = _referenceId;
    map['reference'] = _reference;
    map['name_final'] = _nameFinal;
    map['name_global'] = _nameGlobal;
    return map;
  }
}

/// id : "d8bd0802-ff3a-424e-8252-0a6353a78505"
/// name : "WIBU Store"
/// addresses : [{"id":"a55ae210-7c00-477f-a7ad-293f6242f64d","country":"Thành phố Cần Thơ","province":"Thành phố Cần Thơ","district":"Huyện Cờ Đỏ","ward":"Thị Trấn Cờ Đỏ"}]

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    String? id,
    String? name,
    List<Addresses>? addresses,
  }) {
    _id = id;
    _name = name;
    _addresses = addresses;
  }

  Shop.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['addresses'] != null) {
      _addresses = [];
      json['addresses'].forEach((v) {
        _addresses?.add(Addresses.fromJson(v));
      });
    }
  }

  String? _id;
  String? _name;
  List<Addresses>? _addresses;

  Shop copyWith({
    String? id,
    String? name,
    List<Addresses>? addresses,
  }) =>
      Shop(
        id: id ?? _id,
        name: name ?? _name,
        addresses: addresses ?? _addresses,
      );

  String? get id => _id;

  String? get name => _name;

  List<Addresses>? get addresses => _addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_addresses != null) {
      map['addresses'] = _addresses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "a55ae210-7c00-477f-a7ad-293f6242f64d"
/// country : "Thành phố Cần Thơ"
/// province : "Thành phố Cần Thơ"
/// district : "Huyện Cờ Đỏ"
/// ward : "Thị Trấn Cờ Đỏ"

Addresses addressesFromJson(String str) => Addresses.fromJson(json.decode(str));

String addressesToJson(Addresses data) => json.encode(data.toJson());

class Addresses {
  Addresses({
    String? id,
    String? country,
    String? province,
    String? district,
    String? ward,
  }) {
    _id = id;
    _country = country;
    _province = province;
    _district = district;
    _ward = ward;
  }

  Addresses.fromJson(dynamic json) {
    _id = json['id'];
    _country = json['country'];
    _province = json['province'];
    _district = json['district'];
    _ward = json['ward'];
  }

  String? _id;
  String? _country;
  String? _province;
  String? _district;
  String? _ward;

  Addresses copyWith({
    String? id,
    String? country,
    String? province,
    String? district,
    String? ward,
  }) =>
      Addresses(
        id: id ?? _id,
        country: country ?? _country,
        province: province ?? _province,
        district: district ?? _district,
        ward: ward ?? _ward,
      );

  String? get id => _id;

  String? get country => _country;

  String? get province => _province;

  String? get district => _district;

  String? get ward => _ward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country'] = _country;
    map['province'] = _province;
    map['district'] = _district;
    map['ward'] = _ward;
    return map;
  }
}

/// value : 1
/// average : 100
/// count_review : 10

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));

String reviewsToJson(Reviews data) => json.encode(data.toJson());

class Reviews {
  Reviews({
    num? value,
    num? average,
    num? countReview,
  }) {
    _value = value;
    _average = average;
    _countReview = countReview;
  }

  Reviews.fromJson(dynamic json) {
    _value = json['value'];
    _average = json['average'];
    _countReview = json['count_review'];
  }

  num? _value;
  num? _average;
  num? _countReview;

  Reviews copyWith({
    num? value,
    num? average,
    num? countReview,
  }) =>
      Reviews(
        value: value ?? _value,
        average: average ?? _average,
        countReview: countReview ?? _countReview,
      );

  num? get value => _value;

  num? get average => _average;

  num? get countReview => _countReview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['average'] = _average;
    map['count_review'] = _countReview;
    return map;
  }
}

/// id : "9d056b00-4193-11ee-8f6c-37fee4f80b41"
/// product_id : "9d039640-4193-11ee-8f6c-37fee4f80b41"
/// variation_first_id : "9d045990-4193-11ee-8f6c-37fee4f80b41"
/// variation_second_id : "9d051ce0-4193-11ee-8f6c-37fee4f80b41"
/// variation_first : {"id":"9d045990-4193-11ee-8f6c-37fee4f80b41","name":"red","code":"RED","order":1,"color":"#ff0000","image":{"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"},"pricing_id":"9d039641-4193-11ee-8f6c-37fee4f80b41"}
/// variation_second : {"id":"9d051ce0-4193-11ee-8f6c-37fee4f80b41","name":"X","code":"X","order":1,"color":"#0000ff","image":{"id":"20230823T153243394869369_00000000-0000-0000-0000-000000000000_blue","extension":".jpg","original_name":"blue.jpg","size":25821,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Blue","signature":"367b629d33b82c237f340f84dbf9b83a"},"pricing_id":"9d04f5d0-4193-11ee-8f6c-37fee4f80b41"}
/// order_first : 1
/// order_second : 1
/// quantity : 100
/// price : 51
/// original_price : 52
/// sku : "SDA_SK"

Stocks stocksFromJson(String str) => Stocks.fromJson(json.decode(str));

String stocksToJson(Stocks data) => json.encode(data.toJson());

class Stocks {
  Stocks({
    String? id,
    String? productId,
    String? variationFirstId,
    String? variationSecondId,
    Variations? variationFirst,
    Variations? variationSecond,
    num? orderFirst,
    num? orderSecond,
    num? quantity,
    num? price,
    num? originalPrice,
    String? sku,
  }) {
    _id = id;
    _productId = productId;
    _variationFirstId = variationFirstId;
    _variationSecondId = variationSecondId;
    _variationFirst = variationFirst;
    _variationSecond = variationSecond;
    _orderFirst = orderFirst;
    _orderSecond = orderSecond;
    _quantity = quantity;
    _price = price;
    _originalPrice = originalPrice;
    _sku = sku;
  }

  Stocks.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _variationFirstId = json['variation_first_id'];
    _variationSecondId = json['variation_second_id'];
    _variationFirst = json['variation_first'] != null
        ? Variations.fromJson(json['variation_first'])
        : null;
    _variationSecond = json['variation_second'] != null
        ? Variations.fromJson(json['variation_second'])
        : null;
    _orderFirst = json['order_first'];
    _orderSecond = json['order_second'];
    _quantity = json['quantity'];
    _price = json['price'];
    _originalPrice = json['original_price'];
    _sku = json['sku'];
  }

  String? _id;
  String? _productId;
  String? _variationFirstId;
  String? _variationSecondId;
  Variations? _variationFirst;
  Variations? _variationSecond;
  num? _orderFirst;
  num? _orderSecond;
  num? _quantity;
  num? _price;
  num? _originalPrice;
  String? _sku;

  Stocks copyWith({
    String? id,
    String? productId,
    String? variationFirstId,
    String? variationSecondId,
    Variations? variationFirst,
    Variations? variationSecond,
    num? orderFirst,
    num? orderSecond,
    num? quantity,
    num? price,
    num? originalPrice,
    String? sku,
  }) =>
      Stocks(
        id: id ?? _id,
        productId: productId ?? _productId,
        variationFirstId: variationFirstId ?? _variationFirstId,
        variationSecondId: variationSecondId ?? _variationSecondId,
        variationFirst: variationFirst ?? _variationFirst,
        variationSecond: variationSecond ?? _variationSecond,
        orderFirst: orderFirst ?? _orderFirst,
        orderSecond: orderSecond ?? _orderSecond,
        quantity: quantity ?? _quantity,
        price: price ?? _price,
        originalPrice: originalPrice ?? _originalPrice,
        sku: sku ?? _sku,
      );

  String? get id => _id;

  String? get productId => _productId;

  String? get variationFirstId => _variationFirstId;

  String? get variationSecondId => _variationSecondId;

  Variations? get variationFirst => _variationFirst;

  Variations? get variationSecond => _variationSecond;

  num? get orderFirst => _orderFirst;

  num? get orderSecond => _orderSecond;

  num? get quantity => _quantity;

  num? get price => _price;

  num? get originalPrice => _originalPrice;

  String? get sku => _sku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['variation_first_id'] = _variationFirstId;
    map['variation_second_id'] = _variationSecondId;
    if (_variationFirst != null) {
      map['variation_first'] = _variationFirst?.toJson();
    }
    if (_variationSecond != null) {
      map['variation_second'] = _variationSecond?.toJson();
    }
    map['order_first'] = _orderFirst;
    map['order_second'] = _orderSecond;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['original_price'] = _originalPrice;
    map['sku'] = _sku;
    return map;
  }
}

/// id : "9d051ce0-4193-11ee-8f6c-37fee4f80b41"
/// name : "X"
/// code : "X"
/// order : 1
/// color

/// id : "20230823T153208046807119_00000000-0000-0000-0000-000000000000_red"
/// extension : ".jpg"
/// original_name : "red.jpg"
/// size : 24158
/// type : "image/jpeg"
/// description : "Nike Mens Kobe Mamba Fury Basketball Shoes Red"
/// signature : "4ef41ceed79af4bb962e6ea5e88b0c67"
///
/// id : "9d039641-4193-11ee-8f6c-37fee4f80b41"
/// name : "Product pricing type color"
/// code : "COLOR code for product pricing"
/// variations : [{"id":"9d045990-4193-11ee-8f6c-37fee4f80b41","name":"red","code":"RED","order":1,"color":"#ff0000","image":{"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"},"pricing_id":"9d039641-4193-11ee-8f6c-37fee4f80b41"}]
/// html_source : "string"
/// order : 1
/// is_contains_image : true

PricesProductDetail pricesFromJson(String str) => PricesProductDetail.fromJson(json.decode(str));

String pricesToJson(PricesProductDetail data) => json.encode(data.toJson());

class PricesProductDetail {
  PricesProductDetail({
    String? id,
    String? name,
    String? code,
    List<Variations>? variations,
    String? htmlSource,
    num? order,
    bool? isContainsImage,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _variations = variations;
    _htmlSource = htmlSource;
    _order = order;
    _isContainsImage = isContainsImage;
  }

  PricesProductDetail.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    if (json['variations'] != null) {
      _variations = [];
      json['variations'].forEach((v) {
        _variations?.add(Variations.fromJson(v));
      });
    }
    _htmlSource = json['html_source'];
    _order = json['order'];
    _isContainsImage = json['is_contains_image'];
  }

  String? _id;
  String? _name;
  String? _code;
  List<Variations>? _variations;
  String? _htmlSource;
  num? _order;
  bool? _isContainsImage;

  PricesProductDetail copyWith({
    String? id,
    String? name,
    String? code,
    List<Variations>? variations,
    String? htmlSource,
    num? order,
    bool? isContainsImage,
  }) =>
      PricesProductDetail(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        variations: variations ?? _variations,
        htmlSource: htmlSource ?? _htmlSource,
        order: order ?? _order,
        isContainsImage: isContainsImage ?? _isContainsImage,
      );

  String? get id => _id;

  String? get name => _name;

  String? get code => _code;

  List<Variations>? get variations => _variations;

  String? get htmlSource => _htmlSource;

  num? get order => _order;

  bool? get isContainsImage => _isContainsImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    if (_variations != null) {
      map['variations'] = _variations?.map((v) => v.toJson()).toList();
    }
    map['html_source'] = _htmlSource;
    map['order'] = _order;
    map['is_contains_image'] = _isContainsImage;
    return map;
  }
}

/// id : "9d045990-4193-11ee-8f6c-37fee4f80b41"
/// name : "red"
/// code : "RED"
/// order : 1
/// color : "#ff0000"
/// image : {"id":"20230823T153208046807119_00000000-0000-0000-0000-000000000000_red","extension":".jpg","original_name":"red.jpg","size":24158,"type":"image/jpeg","description":"Nike Mens Kobe Mamba Fury Basketball Shoes Red","signature":"4ef41ceed79af4bb962e6ea5e88b0c67"}
/// pricing_id : "9d039641-4193-11ee-8f6c-37fee4f80b41"

Variations variationsFromJson(String str) =>
    Variations.fromJson(json.decode(str));

String variationsToJson(Variations data) => json.encode(data.toJson());

class Variations {
  Variations({
    String? id,
    String? name,
    String? code,
    num? order,
    String? color,
    Attachments? image,
    String? pricingId,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _order = order;
    _color = color;
    _image = image;
    _pricingId = pricingId;
  }

  Variations.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _order = json['order'];
    _color = json['color'];
    _image = json['image'] != null ? Attachments.fromJson(json['image']) : null;
    _pricingId = json['pricing_id'];
  }

  String? _id;
  String? _name;
  String? _code;
  num? _order;
  String? _color;
  Attachments? _image;
  String? _pricingId;

  Variations copyWith({
    String? id,
    String? name,
    String? code,
    num? order,
    String? color,
    Attachments? image,
    String? pricingId,
  }) =>
      Variations(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        order: order ?? _order,
        color: color ?? _color,
        image: image ?? _image,
        pricingId: pricingId ?? _pricingId,
      );

  String? get id => _id;

  String? get name => _name;

  String? get code => _code;

  num? get order => _order;

  String? get color => _color;

  Attachments? get image => _image;

  String? get pricingId => _pricingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['order'] = _order;
    map['color'] = _color;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['pricing_id'] = _pricingId;
    return map;
  }
}

/// id : "20230823T153208046807119_00000000-0000-0000-0000-000000000000_red"
/// extension : ".jpg"
/// original_name : "red.jpg"
/// size : 24158
/// type : "image/jpeg"
/// description : "Nike Mens Kobe Mamba Fury Basketball Shoes Red"
/// signature : "4ef41ceed79af4bb962e6ea5e88b0c67"
