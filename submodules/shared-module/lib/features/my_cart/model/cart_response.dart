
class CartResponse {
  CartResponse({
      String? objectType, 
      String? userId, 
      List<EntityDtos>? entityDTOS, 
      num? totalItems,}){
    _objectType = objectType;
    _userId = userId;
    _entityDTOS = entityDTOS;
    _totalItems = totalItems;
}

  CartResponse.fromJson(dynamic json) {
    _objectType = json['object_type'];
    _userId = json['user_id'];
    if (json['entityDTOS'] != null) {
      _entityDTOS = [];
      json['entityDTOS'].forEach((v) {
        _entityDTOS?.add(EntityDtos.fromJson(v));
      });
    }
    _totalItems = json['total_items'];
  }
  String? _objectType;
  String? _userId;
  List<EntityDtos>? _entityDTOS;
  num? _totalItems;
CartResponse copyWith({  String? objectType,
  String? userId,
  List<EntityDtos>? entityDTOS,
  num? totalItems,
}) => CartResponse(  objectType: objectType ?? _objectType,
  userId: userId ?? _userId,
  entityDTOS: entityDTOS ?? _entityDTOS,
  totalItems: totalItems ?? _totalItems,
);
  String? get objectType => _objectType;
  String? get userId => _userId;
  List<EntityDtos>? get entityDTOS => _entityDTOS;
  num? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['object_type'] = _objectType;
    map['user_id'] = _userId;
    if (_entityDTOS != null) {
      map['entityDTOS'] = _entityDTOS?.map((v) => v.toJson()).toList();
    }
    map['total_items'] = _totalItems;
    return map;
  }

}

/// id : "ba9f4ea4-03ec-4b66-81af-1b80eccb5e96"
/// name : "Shop Tiki demo"
/// avatar : {"id":"20230928T105256599493868_d6228fd8-229b-457e-991f-c403b5a3e123_consenhieulagi","type":null}
/// objectDTOs : [{"id":"6c8be200-8208-11ee-b2fa-d3b8ef69d40b","object_Id":"67e98450-6683-11ee-8bc1-9398c962d9a7","stock_id":"77e71230-7472-11ee-b337-3f5edd264f23","note":"","name":"Iphone 14 ProMax","code":null,"detail":null,"price":20,"original_price":50,"str_sku":"__","quantity":1,"avatar":{"id":"20231009T160826238324101_d6228fd8-229b-457e-991f-c403b5a3e123_fsfcc006dd226b4f21a0461ccdc1a268a7","type":"image/webp"},"pin_number":0,"prices":[{"id":"cf804b50-7c7a-11ee-8b11-db71c1a81727","name":"anv","code":null,"product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","stock_variation":{"id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","name":"2","code":null,"order":2,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0},"order":1}],"point":4,"status_id":null,"stock_detail":{"id":"77e71230-7472-11ee-b337-3f5edd264f23","product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","variation_first_id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","variation_second_id":null,"variation_first_name":"2","variation_second_name":null,"order_first":2,"order_second":0,"quantity":168,"price":450,"original_price":450,"sku":""},"stock_pricing_fulls":[{"id":"cf804b50-7c7a-11ee-8b11-db71c1a81727","name":"anv","code":null,"form_id":null,"product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","html_source":null,"stock_variations":[{"id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","name":"2","code":null,"order":2,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0},{"id":"cf841be0-7c7a-11ee-8b11-db71c1a81727","name":"1","code":null,"order":1,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0}],"order":1}],"stock_fulls":[{"id":"77e193f0-7472-11ee-b337-3f5edd264f23","product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","variation_first_id":"cf841be0-7c7a-11ee-8b11-db71c1a81727","variation_second_id":null,"variation_first_name":"1","variation_second_name":null,"order_first":1,"order_second":0,"quantity":192,"price":20,"original_price":50,"sku":""},{"id":"77e71230-7472-11ee-b337-3f5edd264f23","product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","variation_first_id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","variation_second_id":null,"variation_first_name":"2","variation_second_name":null,"order_first":2,"order_second":0,"quantity":168,"price":450,"original_price":450,"sku":""}],"is_limited":true},{"id":"7f0d6e80-8208-11ee-b2fa-d3b8ef69d40b","object_Id":"226105c0-6363-11ee-91da-c1293fc3c8f0","stock_id":"035e0ef0-7422-11ee-9e36-196f2afbc583","note":"","name":"Philip Head","code":null,"detail":null,"price":110,"original_price":150,"str_sku":"_","quantity":1,"avatar":{"id":"20231005T163952213604516_d6228fd8-229b-457e-991f-c403b5a3e123_earbud","type":"image/jpeg"},"pin_number":0,"prices":[],"point":4.6,"status_id":null,"stock_detail":{"id":"035e0ef0-7422-11ee-9e36-196f2afbc583","product_id":"226105c0-6363-11ee-91da-c1293fc3c8f0","variation_first_id":null,"variation_second_id":null,"variation_first_name":null,"variation_second_name":null,"order_first":0,"order_second":0,"quantity":53,"price":110,"original_price":150,"sku":""},"stock_pricing_fulls":[],"stock_fulls":[{"id":"035e0ef0-7422-11ee-9e36-196f2afbc583","product_id":"226105c0-6363-11ee-91da-c1293fc3c8f0","variation_first_id":null,"variation_second_id":null,"variation_first_name":null,"variation_second_name":null,"order_first":0,"order_second":0,"quantity":53,"price":110,"original_price":150,"sku":""}],"is_limited":true}]
/// shop_address : {"name":"An Nguyen","phone":"0373773172","country":{"id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","code":"viet_nam","name":"Việt Nam"},"province":{"id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","code":"thanh_pho_ho_chi_minh","name":"Thành phố Hồ Chí Minh"},"district":{"id":"c5650757-2817-4432-97ce-5dc68da8cb70","code":"quan_7","name":"Quận 7"},"ward":{"id":"731be4ae-3c5a-4888-8fae-520816a66ad8","code":"phuong_binh_thuan","name":"Phường Bình Thuận"},"street":null}
/// is_invoice_exact : true

class EntityDtos {
  EntityDtos({
      String? id, 
      String? name, 
      Avatar? avatar, 
      List<ObjectDtOs>? objectDTOs, 
      ShopAddress? shopAddress, 
      bool? isInvoiceExact,}){
    _id = id;
    _name = name;
    _avatar = avatar;
    _objectDTOs = objectDTOs;
    _shopAddress = shopAddress;
    _isInvoiceExact = isInvoiceExact;
}

  EntityDtos.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    if (json['objectDTOs'] != null) {
      _objectDTOs = [];
      json['objectDTOs'].forEach((v) {
        _objectDTOs?.add(ObjectDtOs.fromJson(v));
      });
    }
    _shopAddress = json['shop_address'] != null ? ShopAddress.fromJson(json['shop_address']) : null;
    _isInvoiceExact = json['is_invoice_exact'];
  }
  String? _id;
  String? _name;
  Avatar? _avatar;
  List<ObjectDtOs>? _objectDTOs;
  ShopAddress? _shopAddress;
  bool? _isInvoiceExact;
EntityDtos copyWith({  String? id,
  String? name,
  Avatar? avatar,
  List<ObjectDtOs>? objectDTOs,
  ShopAddress? shopAddress,
  bool? isInvoiceExact,
}) => EntityDtos(  id: id ?? _id,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
  objectDTOs: objectDTOs ?? _objectDTOs,
  shopAddress: shopAddress ?? _shopAddress,
  isInvoiceExact: isInvoiceExact ?? _isInvoiceExact,
);
  String? get id => _id;
  String? get name => _name;
  Avatar? get avatar => _avatar;
  List<ObjectDtOs>? get objectDTOs => _objectDTOs;
  ShopAddress? get shopAddress => _shopAddress;
  bool? get isInvoiceExact => _isInvoiceExact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    if (_objectDTOs != null) {
      map['objectDTOs'] = _objectDTOs?.map((v) => v.toJson()).toList();
    }
    if (_shopAddress != null) {
      map['shop_address'] = _shopAddress?.toJson();
    }
    map['is_invoice_exact'] = _isInvoiceExact;
    return map;
  }

  set isInvoiceExact(bool? value) {
    _isInvoiceExact = value;
  }

  set shopAddress(ShopAddress? value) {
    _shopAddress = value;
  }

  set objectDTOs(List<ObjectDtOs>? value) {
    _objectDTOs = value;
  }

  set avatar(Avatar? value) {
    _avatar = value;
  }

  set name(String? value) {
    _name = value;
  }

  set id(String? value) {
    _id = value;
  }
}

/// name : "An Nguyen"
/// phone : "0373773172"
/// country : {"id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","code":"viet_nam","name":"Việt Nam"}
/// province : {"id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","code":"thanh_pho_ho_chi_minh","name":"Thành phố Hồ Chí Minh"}
/// district : {"id":"c5650757-2817-4432-97ce-5dc68da8cb70","code":"quan_7","name":"Quận 7"}
/// ward : {"id":"731be4ae-3c5a-4888-8fae-520816a66ad8","code":"phuong_binh_thuan","name":"Phường Bình Thuận"}
/// street : null

class ShopAddress {
  ShopAddress({
      String? name, 
      String? phone, 
      Country? country, 
      Province? province, 
      District? district, 
      Ward? ward, 
      dynamic street,}){
    _name = name;
    _phone = phone;
    _country = country;
    _province = province;
    _district = district;
    _ward = ward;
    _street = street;
}

  ShopAddress.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _country = json['country'] != null ? Country.fromJson(json['country']) : null;
    _province = json['province'] != null ? Province.fromJson(json['province']) : null;
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    _ward = json['ward'] != null ? Ward.fromJson(json['ward']) : null;
    _street = json['street'];
  }
  String? _name;
  String? _phone;
  Country? _country;
  Province? _province;
  District? _district;
  Ward? _ward;
  dynamic _street;
ShopAddress copyWith({  String? name,
  String? phone,
  Country? country,
  Province? province,
  District? district,
  Ward? ward,
  dynamic street,
}) => ShopAddress(  name: name ?? _name,
  phone: phone ?? _phone,
  country: country ?? _country,
  province: province ?? _province,
  district: district ?? _district,
  ward: ward ?? _ward,
  street: street ?? _street,
);
  String? get name => _name;
  String? get phone => _phone;
  Country? get country => _country;
  Province? get province => _province;
  District? get district => _district;
  Ward? get ward => _ward;
  dynamic get street => _street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_province != null) {
      map['province'] = _province?.toJson();
    }
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    if (_ward != null) {
      map['ward'] = _ward?.toJson();
    }
    map['street'] = _street;
    return map;
  }

}

/// id : "731be4ae-3c5a-4888-8fae-520816a66ad8"
/// code : "phuong_binh_thuan"
/// name : "Phường Bình Thuận"

class Ward {
  Ward({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  Ward.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
Ward copyWith({  String? id,
  String? code,
  String? name,
}) => Ward(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "c5650757-2817-4432-97ce-5dc68da8cb70"
/// code : "quan_7"
/// name : "Quận 7"

class District {
  District({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  District.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
District copyWith({  String? id,
  String? code,
  String? name,
}) => District(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8"
/// code : "thanh_pho_ho_chi_minh"
/// name : "Thành phố Hồ Chí Minh"

class Province {
  Province({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  Province.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
Province copyWith({  String? id,
  String? code,
  String? name,
}) => Province(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "1e5effa4-c844-48ee-a7b7-3f3c62ffc883"
/// code : "viet_nam"
/// name : "Việt Nam"

class Country {
  Country({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  Country.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
Country copyWith({  String? id,
  String? code,
  String? name,
}) => Country(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "6c8be200-8208-11ee-b2fa-d3b8ef69d40b"
/// object_Id : "67e98450-6683-11ee-8bc1-9398c962d9a7"
/// stock_id : "77e71230-7472-11ee-b337-3f5edd264f23"
/// note : ""
/// name : "Iphone 14 ProMax"
/// code : null
/// detail : null
/// price : 20
/// original_price : 50
/// str_sku : "__"
/// quantity : 1
/// avatar : {"id":"20231009T160826238324101_d6228fd8-229b-457e-991f-c403b5a3e123_fsfcc006dd226b4f21a0461ccdc1a268a7","type":"image/webp"}
/// pin_number : 0
/// prices : [{"id":"cf804b50-7c7a-11ee-8b11-db71c1a81727","name":"anv","code":null,"product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","stock_variation":{"id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","name":"2","code":null,"order":2,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0},"order":1}]
/// point : 4
/// status_id : null
/// stock_detail : {"id":"77e71230-7472-11ee-b337-3f5edd264f23","product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","variation_first_id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","variation_second_id":null,"variation_first_name":"2","variation_second_name":null,"order_first":2,"order_second":0,"quantity":168,"price":450,"original_price":450,"sku":""}
/// stock_pricing_fulls : [{"id":"cf804b50-7c7a-11ee-8b11-db71c1a81727","name":"anv","code":null,"form_id":null,"product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","html_source":null,"stock_variations":[{"id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","name":"2","code":null,"order":2,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0},{"id":"cf841be0-7c7a-11ee-8b11-db71c1a81727","name":"1","code":null,"order":1,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0}],"order":1}]
/// stock_fulls : [{"id":"77e193f0-7472-11ee-b337-3f5edd264f23","product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","variation_first_id":"cf841be0-7c7a-11ee-8b11-db71c1a81727","variation_second_id":null,"variation_first_name":"1","variation_second_name":null,"order_first":1,"order_second":0,"quantity":192,"price":20,"original_price":50,"sku":""},{"id":"77e71230-7472-11ee-b337-3f5edd264f23","product_id":"67e98450-6683-11ee-8bc1-9398c962d9a7","variation_first_id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","variation_second_id":null,"variation_first_name":"2","variation_second_name":null,"order_first":2,"order_second":0,"quantity":168,"price":450,"original_price":450,"sku":""}]
/// is_limited : true

class ObjectDtOs {
  ObjectDtOs({
      String? id, 
      String? objectId, 
      String? stockId, 
      String? note, 
      String? name, 
      dynamic code, 
      dynamic detail, 
      num? price, 
      num? originalPrice, 
      String? strSku, 
      num? quantity, 
      Avatar? avatar, 
      num? pinNumber, 
      List<Prices>? prices, 
      num? point, 
      dynamic statusId, 
      StockDetail? stockDetail, 
      List<StockPricingFulls>? stockPricingFulls, 
      List<StockFulls>? stockFulls, 
      bool? isLimited,}){
    _id = id;
    _objectId = objectId;
    _stockId = stockId;
    _note = note;
    _name = name;
    _code = code;
    _detail = detail;
    _price = price;
    _originalPrice = originalPrice;
    _strSku = strSku;
    _quantity = quantity;
    _avatar = avatar;
    _pinNumber = pinNumber;
    _prices = prices;
    _point = point;
    _statusId = statusId;
    _stockDetail = stockDetail;
    _stockPricingFulls = stockPricingFulls;
    _stockFulls = stockFulls;
    _isLimited = isLimited;
}

  ObjectDtOs.fromJson(dynamic json) {
    _id = json['id'];
    _objectId = json['object_Id'];
    _stockId = json['stock_id'];
    _note = json['note'];
    _name = json['name'];
    _code = json['code'];
    _detail = json['detail'];
    _price = json['price'];
    _originalPrice = json['original_price'];
    _strSku = json['str_sku'];
    _quantity = json['quantity'];
    _avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    _pinNumber = json['pin_number'];
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(Prices.fromJson(v));
      });
    }
    _point = json['point'];
    _statusId = json['status_id'];
    _stockDetail = json['stock_detail'] != null ? StockDetail.fromJson(json['stock_detail']) : null;
    if (json['stock_pricing_fulls'] != null) {
      _stockPricingFulls = [];
      json['stock_pricing_fulls'].forEach((v) {
        _stockPricingFulls?.add(StockPricingFulls.fromJson(v));
      });
    }
    if (json['stock_fulls'] != null) {
      _stockFulls = [];
      json['stock_fulls'].forEach((v) {
        _stockFulls?.add(StockFulls.fromJson(v));
      });
    }
    _isLimited = json['is_limited'];
  }
  String? _id;
  String? _objectId;
  String? _stockId;
  String? _note;
  String? _name;
  dynamic _code;
  dynamic _detail;
  num? _price;
  num? _originalPrice;
  String? _strSku;
  num? _quantity;
  Avatar? _avatar;
  num? _pinNumber;
  List<Prices>? _prices;
  num? _point;
  dynamic _statusId;
  StockDetail? _stockDetail;
  List<StockPricingFulls>? _stockPricingFulls;
  List<StockFulls>? _stockFulls;
  bool? _isLimited;
ObjectDtOs copyWith({  String? id,
  String? objectId,
  String? stockId,
  String? note,
  String? name,
  dynamic code,
  dynamic detail,
  num? price,
  num? originalPrice,
  String? strSku,
  num? quantity,
  Avatar? avatar,
  num? pinNumber,
  List<Prices>? prices,
  num? point,
  dynamic statusId,
  StockDetail? stockDetail,
  List<StockPricingFulls>? stockPricingFulls,
  List<StockFulls>? stockFulls,
  bool? isLimited,
}) => ObjectDtOs(  id: id ?? _id,
  objectId: objectId ?? _objectId,
  stockId: stockId ?? _stockId,
  note: note ?? _note,
  name: name ?? _name,
  code: code ?? _code,
  detail: detail ?? _detail,
  price: price ?? _price,
  originalPrice: originalPrice ?? _originalPrice,
  strSku: strSku ?? _strSku,
  quantity: quantity ?? _quantity,
  avatar: avatar ?? _avatar,
  pinNumber: pinNumber ?? _pinNumber,
  prices: prices ?? _prices,
  point: point ?? _point,
  statusId: statusId ?? _statusId,
  stockDetail: stockDetail ?? _stockDetail,
  stockPricingFulls: stockPricingFulls ?? _stockPricingFulls,
  stockFulls: stockFulls ?? _stockFulls,
  isLimited: isLimited ?? _isLimited,
);
  String? get id => _id;
  String? get objectId => _objectId;
  String? get stockId => _stockId;
  String? get note => _note;
  String? get name => _name;
  dynamic get code => _code;
  dynamic get detail => _detail;
  num? get price => _price;
  num? get originalPrice => _originalPrice;
  String? get strSku => _strSku;
  num? get quantity => _quantity;
  Avatar? get avatar => _avatar;
  num? get pinNumber => _pinNumber;
  List<Prices>? get prices => _prices;
  num? get point => _point;
  dynamic get statusId => _statusId;
  StockDetail? get stockDetail => _stockDetail;
  List<StockPricingFulls>? get stockPricingFulls => _stockPricingFulls;
  List<StockFulls>? get stockFulls => _stockFulls;
  bool? get isLimited => _isLimited;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['object_Id'] = _objectId;
    map['stock_id'] = _stockId;
    map['note'] = _note;
    map['name'] = _name;
    map['code'] = _code;
    map['detail'] = _detail;
    map['price'] = _price;
    map['original_price'] = _originalPrice;
    map['str_sku'] = _strSku;
    map['quantity'] = _quantity;
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    map['pin_number'] = _pinNumber;
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    map['point'] = _point;
    map['status_id'] = _statusId;
    if (_stockDetail != null) {
      map['stock_detail'] = _stockDetail?.toJson();
    }
    if (_stockPricingFulls != null) {
      map['stock_pricing_fulls'] = _stockPricingFulls?.map((v) => v.toJson()).toList();
    }
    if (_stockFulls != null) {
      map['stock_fulls'] = _stockFulls?.map((v) => v.toJson()).toList();
    }
    map['is_limited'] = _isLimited;
    return map;
  }

}

/// id : "77e193f0-7472-11ee-b337-3f5edd264f23"
/// product_id : "67e98450-6683-11ee-8bc1-9398c962d9a7"
/// variation_first_id : "cf841be0-7c7a-11ee-8b11-db71c1a81727"
/// variation_second_id : null
/// variation_first_name : "1"
/// variation_second_name : null
/// order_first : 1
/// order_second : 0
/// quantity : 192
/// price : 20
/// original_price : 50
/// sku : ""

class StockFulls {
  StockFulls({
      String? id, 
      String? productId, 
      String? variationFirstId, 
      dynamic variationSecondId, 
      String? variationFirstName, 
      dynamic variationSecondName, 
      num? orderFirst, 
      num? orderSecond, 
      num? quantity, 
      num? price, 
      num? originalPrice, 
      String? sku,}){
    _id = id;
    _productId = productId;
    _variationFirstId = variationFirstId;
    _variationSecondId = variationSecondId;
    _variationFirstName = variationFirstName;
    _variationSecondName = variationSecondName;
    _orderFirst = orderFirst;
    _orderSecond = orderSecond;
    _quantity = quantity;
    _price = price;
    _originalPrice = originalPrice;
    _sku = sku;
}

  StockFulls.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _variationFirstId = json['variation_first_id'];
    _variationSecondId = json['variation_second_id'];
    _variationFirstName = json['variation_first_name'];
    _variationSecondName = json['variation_second_name'];
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
  dynamic _variationSecondId;
  String? _variationFirstName;
  dynamic _variationSecondName;
  num? _orderFirst;
  num? _orderSecond;
  num? _quantity;
  num? _price;
  num? _originalPrice;
  String? _sku;
StockFulls copyWith({  String? id,
  String? productId,
  String? variationFirstId,
  dynamic variationSecondId,
  String? variationFirstName,
  dynamic variationSecondName,
  num? orderFirst,
  num? orderSecond,
  num? quantity,
  num? price,
  num? originalPrice,
  String? sku,
}) => StockFulls(  id: id ?? _id,
  productId: productId ?? _productId,
  variationFirstId: variationFirstId ?? _variationFirstId,
  variationSecondId: variationSecondId ?? _variationSecondId,
  variationFirstName: variationFirstName ?? _variationFirstName,
  variationSecondName: variationSecondName ?? _variationSecondName,
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
  dynamic get variationSecondId => _variationSecondId;
  String? get variationFirstName => _variationFirstName;
  dynamic get variationSecondName => _variationSecondName;
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
    map['variation_first_name'] = _variationFirstName;
    map['variation_second_name'] = _variationSecondName;
    map['order_first'] = _orderFirst;
    map['order_second'] = _orderSecond;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['original_price'] = _originalPrice;
    map['sku'] = _sku;
    return map;
  }

}

/// id : "cf804b50-7c7a-11ee-8b11-db71c1a81727"
/// name : "anv"
/// code : null
/// form_id : null
/// product_id : "67e98450-6683-11ee-8bc1-9398c962d9a7"
/// html_source : null
/// stock_variations : [{"id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","name":"2","code":null,"order":2,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0},{"id":"cf841be0-7c7a-11ee-8b11-db71c1a81727","name":"1","code":null,"order":1,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0}]
/// order : 1

class StockPricingFulls {
  StockPricingFulls({
      String? id, 
      String? name, 
      dynamic code, 
      dynamic formId, 
      String? productId, 
      dynamic htmlSource, 
      List<StockVariations>? stockVariations, 
      num? order,}){
    _id = id;
    _name = name;
    _code = code;
    _formId = formId;
    _productId = productId;
    _htmlSource = htmlSource;
    _stockVariations = stockVariations;
    _order = order;
}

  StockPricingFulls.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _formId = json['form_id'];
    _productId = json['product_id'];
    _htmlSource = json['html_source'];
    if (json['stock_variations'] != null) {
      _stockVariations = [];
      json['stock_variations'].forEach((v) {
        _stockVariations?.add(StockVariations.fromJson(v));
      });
    }
    _order = json['order'];
  }
  String? _id;
  String? _name;
  dynamic _code;
  dynamic _formId;
  String? _productId;
  dynamic _htmlSource;
  List<StockVariations>? _stockVariations;
  num? _order;
StockPricingFulls copyWith({  String? id,
  String? name,
  dynamic code,
  dynamic formId,
  String? productId,
  dynamic htmlSource,
  List<StockVariations>? stockVariations,
  num? order,
}) => StockPricingFulls(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  formId: formId ?? _formId,
  productId: productId ?? _productId,
  htmlSource: htmlSource ?? _htmlSource,
  stockVariations: stockVariations ?? _stockVariations,
  order: order ?? _order,
);
  String? get id => _id;
  String? get name => _name;
  dynamic get code => _code;
  dynamic get formId => _formId;
  String? get productId => _productId;
  dynamic get htmlSource => _htmlSource;
  List<StockVariations>? get stockVariations => _stockVariations;
  num? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['form_id'] = _formId;
    map['product_id'] = _productId;
    map['html_source'] = _htmlSource;
    if (_stockVariations != null) {
      map['stock_variations'] = _stockVariations?.map((v) => v.toJson()).toList();
    }
    map['order'] = _order;
    return map;
  }

}

/// id : "cf87ec70-7c7a-11ee-8b11-db71c1a81727"
/// name : "2"
/// code : null
/// order : 2
/// pricing_order : 1
/// color : null
/// image : null
/// pricing_id : null
/// index_image : 0

class StockVariations {
  StockVariations({
      String? id, 
      String? name, 
      dynamic code, 
      num? order, 
      num? pricingOrder, 
      dynamic color, 
      dynamic image, 
      dynamic pricingId, 
      num? indexImage,}){
    _id = id;
    _name = name;
    _code = code;
    _order = order;
    _pricingOrder = pricingOrder;
    _color = color;
    _image = image;
    _pricingId = pricingId;
    _indexImage = indexImage;
}

  StockVariations.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _order = json['order'];
    _pricingOrder = json['pricing_order'];
    _color = json['color'];
    _image = json['image'];
    _pricingId = json['pricing_id'];
    _indexImage = json['index_image'];
  }
  String? _id;
  String? _name;
  dynamic _code;
  num? _order;
  num? _pricingOrder;
  dynamic _color;
  dynamic _image;
  dynamic _pricingId;
  num? _indexImage;
StockVariations copyWith({  String? id,
  String? name,
  dynamic code,
  num? order,
  num? pricingOrder,
  dynamic color,
  dynamic image,
  dynamic pricingId,
  num? indexImage,
}) => StockVariations(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  order: order ?? _order,
  pricingOrder: pricingOrder ?? _pricingOrder,
  color: color ?? _color,
  image: image ?? _image,
  pricingId: pricingId ?? _pricingId,
  indexImage: indexImage ?? _indexImage,
);
  String? get id => _id;
  String? get name => _name;
  dynamic get code => _code;
  num? get order => _order;
  num? get pricingOrder => _pricingOrder;
  dynamic get color => _color;
  dynamic get image => _image;
  dynamic get pricingId => _pricingId;
  num? get indexImage => _indexImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['order'] = _order;
    map['pricing_order'] = _pricingOrder;
    map['color'] = _color;
    map['image'] = _image;
    map['pricing_id'] = _pricingId;
    map['index_image'] = _indexImage;
    return map;
  }

}

/// id : "77e71230-7472-11ee-b337-3f5edd264f23"
/// product_id : "67e98450-6683-11ee-8bc1-9398c962d9a7"
/// variation_first_id : "cf87ec70-7c7a-11ee-8b11-db71c1a81727"
/// variation_second_id : null
/// variation_first_name : "2"
/// variation_second_name : null
/// order_first : 2
/// order_second : 0
/// quantity : 168
/// price : 450
/// original_price : 450
/// sku : ""

class StockDetail {
  StockDetail({
      String? id, 
      String? productId, 
      String? variationFirstId, 
      dynamic variationSecondId, 
      String? variationFirstName, 
      dynamic variationSecondName, 
      num? orderFirst, 
      num? orderSecond, 
      num? quantity, 
      num? price, 
      num? originalPrice, 
      String? sku,}){
    _id = id;
    _productId = productId;
    _variationFirstId = variationFirstId;
    _variationSecondId = variationSecondId;
    _variationFirstName = variationFirstName;
    _variationSecondName = variationSecondName;
    _orderFirst = orderFirst;
    _orderSecond = orderSecond;
    _quantity = quantity;
    _price = price;
    _originalPrice = originalPrice;
    _sku = sku;
}

  StockDetail.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _variationFirstId = json['variation_first_id'];
    _variationSecondId = json['variation_second_id'];
    _variationFirstName = json['variation_first_name'];
    _variationSecondName = json['variation_second_name'];
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
  dynamic _variationSecondId;
  String? _variationFirstName;
  dynamic _variationSecondName;
  num? _orderFirst;
  num? _orderSecond;
  num? _quantity;
  num? _price;
  num? _originalPrice;
  String? _sku;
StockDetail copyWith({  String? id,
  String? productId,
  String? variationFirstId,
  dynamic variationSecondId,
  String? variationFirstName,
  dynamic variationSecondName,
  num? orderFirst,
  num? orderSecond,
  num? quantity,
  num? price,
  num? originalPrice,
  String? sku,
}) => StockDetail(  id: id ?? _id,
  productId: productId ?? _productId,
  variationFirstId: variationFirstId ?? _variationFirstId,
  variationSecondId: variationSecondId ?? _variationSecondId,
  variationFirstName: variationFirstName ?? _variationFirstName,
  variationSecondName: variationSecondName ?? _variationSecondName,
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
  dynamic get variationSecondId => _variationSecondId;
  String? get variationFirstName => _variationFirstName;
  dynamic get variationSecondName => _variationSecondName;
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
    map['variation_first_name'] = _variationFirstName;
    map['variation_second_name'] = _variationSecondName;
    map['order_first'] = _orderFirst;
    map['order_second'] = _orderSecond;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['original_price'] = _originalPrice;
    map['sku'] = _sku;
    return map;
  }

}

/// id : "cf804b50-7c7a-11ee-8b11-db71c1a81727"
/// name : "anv"
/// code : null
/// product_id : "67e98450-6683-11ee-8bc1-9398c962d9a7"
/// stock_variation : {"id":"cf87ec70-7c7a-11ee-8b11-db71c1a81727","name":"2","code":null,"order":2,"pricing_order":1,"color":null,"image":null,"pricing_id":null,"index_image":0}
/// order : 1

class Prices {
  Prices({
      String? id, 
      String? name, 
      dynamic code, 
      String? productId, 
      StockVariation? stockVariation, 
      num? order,}){
    _id = id;
    _name = name;
    _code = code;
    _productId = productId;
    _stockVariation = stockVariation;
    _order = order;
}

  Prices.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _productId = json['product_id'];
    _stockVariation = json['stock_variation'] != null ? StockVariation.fromJson(json['stock_variation']) : null;
    _order = json['order'];
  }
  String? _id;
  String? _name;
  dynamic _code;
  String? _productId;
  StockVariation? _stockVariation;
  num? _order;
Prices copyWith({  String? id,
  String? name,
  dynamic code,
  String? productId,
  StockVariation? stockVariation,
  num? order,
}) => Prices(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  productId: productId ?? _productId,
  stockVariation: stockVariation ?? _stockVariation,
  order: order ?? _order,
);
  String? get id => _id;
  String? get name => _name;
  dynamic get code => _code;
  String? get productId => _productId;
  StockVariation? get stockVariation => _stockVariation;
  num? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['product_id'] = _productId;
    if (_stockVariation != null) {
      map['stock_variation'] = _stockVariation?.toJson();
    }
    map['order'] = _order;
    return map;
  }

}

/// id : "cf87ec70-7c7a-11ee-8b11-db71c1a81727"
/// name : "2"
/// code : null
/// order : 2
/// pricing_order : 1
/// color : null
/// image : null
/// pricing_id : null
/// index_image : 0

class StockVariation {
  StockVariation({
      String? id, 
      String? name, 
      dynamic code, 
      num? order, 
      num? pricingOrder, 
      dynamic color, 
      dynamic image, 
      dynamic pricingId, 
      num? indexImage,}){
    _id = id;
    _name = name;
    _code = code;
    _order = order;
    _pricingOrder = pricingOrder;
    _color = color;
    _image = image;
    _pricingId = pricingId;
    _indexImage = indexImage;
}

  StockVariation.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _order = json['order'];
    _pricingOrder = json['pricing_order'];
    _color = json['color'];
    _image = json['image'];
    _pricingId = json['pricing_id'];
    _indexImage = json['index_image'];
  }
  String? _id;
  String? _name;
  dynamic _code;
  num? _order;
  num? _pricingOrder;
  dynamic _color;
  dynamic _image;
  dynamic _pricingId;
  num? _indexImage;
StockVariation copyWith({  String? id,
  String? name,
  dynamic code,
  num? order,
  num? pricingOrder,
  dynamic color,
  dynamic image,
  dynamic pricingId,
  num? indexImage,
}) => StockVariation(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  order: order ?? _order,
  pricingOrder: pricingOrder ?? _pricingOrder,
  color: color ?? _color,
  image: image ?? _image,
  pricingId: pricingId ?? _pricingId,
  indexImage: indexImage ?? _indexImage,
);
  String? get id => _id;
  String? get name => _name;
  dynamic get code => _code;
  num? get order => _order;
  num? get pricingOrder => _pricingOrder;
  dynamic get color => _color;
  dynamic get image => _image;
  dynamic get pricingId => _pricingId;
  num? get indexImage => _indexImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['order'] = _order;
    map['pricing_order'] = _pricingOrder;
    map['color'] = _color;
    map['image'] = _image;
    map['pricing_id'] = _pricingId;
    map['index_image'] = _indexImage;
    return map;
  }

}

/// id : "20231009T160826238324101_d6228fd8-229b-457e-991f-c403b5a3e123_fsfcc006dd226b4f21a0461ccdc1a268a7"
/// type : "image/webp"

class Avatar {
  Avatar({
      String? id, 
      String? type,}){
    _id = id;
    _type = type;
}

  Avatar.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
  }
  String? _id;
  String? _type;
Avatar copyWith({  String? id,
  String? type,
}) => Avatar(  id: id ?? _id,
  type: type ?? _type,
);
  String? get id => _id;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    return map;
  }

}