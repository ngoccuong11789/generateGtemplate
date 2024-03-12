/// address_from : {"name":"string","phone":"string","street":"string","ward":"string","district":"string","city":"string"}
/// address_to : {"name":"string","phone":"string","street":"string","ward":"string","district":"string","city":"string"}
/// products : [{"stock_id":"3fa85f64-5717-4562-b3fc-2c963f66afa6","quantity":1}]

class DtoGetShipment {
  DtoGetShipment({
      AddressFrom? addressFrom, 
      AddressTo? addressTo, 
      List<ProductsShipment>? products,}){
    _addressFrom = addressFrom;
    _addressTo = addressTo;
    _products = products;
}

  DtoGetShipment.fromJson(dynamic json) {
    _addressFrom = json['address_from'] != null ? AddressFrom.fromJson(json['address_from']) : null;
    _addressTo = json['address_to'] != null ? AddressTo.fromJson(json['address_to']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductsShipment.fromJson(v));
      });
    }
  }
  AddressFrom? _addressFrom;
  AddressTo? _addressTo;
  List<ProductsShipment>? _products;
DtoGetShipment copyWith({  AddressFrom? addressFrom,
  AddressTo? addressTo,
  List<ProductsShipment>? products,
}) => DtoGetShipment(  addressFrom: addressFrom ?? _addressFrom,
  addressTo: addressTo ?? _addressTo,
  products: products ?? _products,
);
  AddressFrom? get addressFrom => _addressFrom;
  AddressTo? get addressTo => _addressTo;
  List<ProductsShipment>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_addressFrom != null) {
      map['address_from'] = _addressFrom?.toJson();
    }
    if (_addressTo != null) {
      map['address_to'] = _addressTo?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// stock_id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// quantity : 1

class ProductsShipment {
  ProductsShipment({
      String? stockId, 
      num? quantity,}){
    _stockId = stockId;
    _quantity = quantity;
}

  ProductsShipment.fromJson(dynamic json) {
    _stockId = json['stock_id'];
    _quantity = json['quantity'];
  }
  String? _stockId;
  num? _quantity;
  ProductsShipment copyWith({  String? stockId,
  num? quantity,
}) => ProductsShipment(  stockId: stockId ?? _stockId,
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

/// name : "string"
/// phone : "string"
/// street : "string"
/// ward : "string"
/// district : "string"
/// city : "string"

class AddressTo {
  AddressTo({
      String? name, 
      String? phone, 
      String? street, 
      String? ward, 
      String? district, 
      String? city,}){
    _name = name;
    _phone = phone;
    _street = street;
    _ward = ward;
    _district = district;
    _city = city;
}

  AddressTo.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _street = json['street'];
    _ward = json['ward'];
    _district = json['district'];
    _city = json['city'];
  }
  String? _name;
  String? _phone;
  String? _street;
  String? _ward;
  String? _district;
  String? _city;
AddressTo copyWith({  String? name,
  String? phone,
  String? street,
  String? ward,
  String? district,
  String? city,
}) => AddressTo(  name: name ?? _name,
  phone: phone ?? _phone,
  street: street ?? _street,
  ward: ward ?? _ward,
  district: district ?? _district,
  city: city ?? _city,
);
  String? get name => _name;
  String? get phone => _phone;
  String? get street => _street;
  String? get ward => _ward;
  String? get district => _district;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['street'] = _street;
    map['ward'] = _ward;
    map['district'] = _district;
    map['city'] = _city;
    return map;
  }

}

/// name : "string"
/// phone : "string"
/// street : "string"
/// ward : "string"
/// district : "string"
/// city : "string"

class AddressFrom {
  AddressFrom({
      String? name, 
      String? phone, 
      String? street, 
      String? ward, 
      String? district, 
      String? city,}){
    _name = name;
    _phone = phone;
    _street = street;
    _ward = ward;
    _district = district;
    _city = city;
}

  AddressFrom.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _street = json['street'];
    _ward = json['ward'];
    _district = json['district'];
    _city = json['city'];
  }
  String? _name;
  String? _phone;
  String? _street;
  String? _ward;
  String? _district;
  String? _city;
AddressFrom copyWith({  String? name,
  String? phone,
  String? street,
  String? ward,
  String? district,
  String? city,
}) => AddressFrom(  name: name ?? _name,
  phone: phone ?? _phone,
  street: street ?? _street,
  ward: ward ?? _ward,
  district: district ?? _district,
  city: city ?? _city,
);
  String? get name => _name;
  String? get phone => _phone;
  String? get street => _street;
  String? get ward => _ward;
  String? get district => _district;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['street'] = _street;
    map['ward'] = _ward;
    map['district'] = _district;
    map['city'] = _city;
    return map;
  }

}