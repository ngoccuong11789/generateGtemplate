import 'package:equatable/equatable.dart';

class UpdateShopRequest extends Equatable{
  UpdateShopRequest({
      String? name, 
      String? ownerName, 
      String? phone, 
      CountryRequest? country,
      ProvinceRequest? province,
      DistrictRequest? district,
      String? subStreet,
      String? email, 
      String? address, 
      bool? isInvoiceExact,}){
    _name = name;
    _ownerName = ownerName;
    _phone = phone;
    _country = country;
    _province = province;
    _district = district;
    _subStreet = subStreet;
    _email = email;
    _address = address;
    _isInvoiceExact = isInvoiceExact;
}

  UpdateShopRequest.fromJson(dynamic json) {
    _name = json['name'];
    _ownerName = json['owner_name'];
    _phone = json['phone'];
    _country = json['country'] != null ? CountryRequest.fromJson(json['country']) : null;
    _province = json['province'] != null ? ProvinceRequest.fromJson(json['province']) : null;
    _district = json['district'] != null ? DistrictRequest.fromJson(json['district']) : null;
    _subStreet = json['sub_street'];
    _email = json['email'];
    _address = json['address'];
    _isInvoiceExact = json['is_invoice_exact'];
  }
  String? _name;
  String? _ownerName;
  String? _phone;
  CountryRequest? _country;
  ProvinceRequest? _province;
  DistrictRequest? _district;
  String? _subStreet;
  String? _email;
  String? _address;
  bool? _isInvoiceExact;
UpdateShopRequest copyWith({  String? name,
  String? ownerName,
  String? phone,
  CountryRequest? country,
  ProvinceRequest? province,
  DistrictRequest? district,
  String? subStreet,
  String? email,
  String? address,
  bool? isInvoiceExact,
}) => UpdateShopRequest(  name: name ?? _name,
  ownerName: ownerName ?? _ownerName,
  phone: phone ?? _phone,
  country: country ?? _country,
  province: province ?? _province,
  district: district ?? _district,
  subStreet: subStreet ?? _subStreet,
  email: email ?? _email,
  address: address ?? _address,
  isInvoiceExact: isInvoiceExact ?? _isInvoiceExact,
);
  String? get name => _name;
  String? get ownerName => _ownerName;
  String? get phone => _phone;
  CountryRequest? get country => _country;
  ProvinceRequest? get province => _province;
  DistrictRequest? get district => _district;
  String? get subStreet => _subStreet;
  String? get email => _email;
  String? get address => _address;
  bool? get isInvoiceExact => _isInvoiceExact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['owner_name'] = _ownerName;
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
    map['sub_street'] = _subStreet;
    map['email'] = _email;
    map['address'] = _address;
    map['is_invoice_exact'] = _isInvoiceExact;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    ownerName,
    phone,
    country,
    province,
    district,
    subStreet,
    email,
    address,
    isInvoiceExact,
  ];

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class DistrictRequest {
  DistrictRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  DistrictRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
DistrictRequest copyWith({  String? id,
  String? code,
  String? name,
}) => DistrictRequest(  id: id ?? _id,
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

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class ProvinceRequest {
  ProvinceRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  ProvinceRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
ProvinceRequest copyWith({  String? id,
  String? code,
  String? name,
}) => ProvinceRequest(  id: id ?? _id,
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

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class CountryRequest {
  CountryRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  CountryRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
CountryRequest copyWith({  String? id,
  String? code,
  String? name,
}) => CountryRequest(  id: id ?? _id,
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