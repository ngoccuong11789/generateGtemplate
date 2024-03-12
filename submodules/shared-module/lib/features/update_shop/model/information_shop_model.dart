
import 'package:equatable/equatable.dart';

class InformationShopModel extends Equatable {
  InformationShopModel({
      String? name, 
      String? ownerName, 
      String? phone, 
      CountryResponse? country,
      ProvinceResponse? province,
      DistrictResponse? district,
      String? subStreet,
      String? email, 
      String? address, 
      String? id,
      bool? isInvoiceExact}){
    _name = name;
    _ownerName = ownerName;
    _phone = phone;
    _country = country;
    _province = province;
    _district = district;
    _subStreet = subStreet;
    _email = email;
    _address = address;
    _id = id;
    _isInvoiceExact = isInvoiceExact;
}

  InformationShopModel.fromJson(dynamic json) {
    _name = json['name'];
    _ownerName = json['owner_name'];
    _phone = json['phone'];
    _country = json['country'] != null ? CountryResponse.fromJson(json['country']) : null;
    _province = json['province'] != null ? ProvinceResponse.fromJson(json['province']) : null;
    _district = json['district'] != null ? DistrictResponse.fromJson(json['district']) : null;
    _subStreet = json['sub_street'];
    _email = json['email'];
    _address = json['address'];
    _id = json['id'];
    _isInvoiceExact = json['is_invoice_exact'];
  }
  String? _name;
  String? _ownerName;
  String? _phone;
  CountryResponse? _country;
  ProvinceResponse? _province;
  DistrictResponse? _district;
  String? _subStreet;
  String? _email;
  String? _address;
  String? _id;
  bool? _isInvoiceExact;
InformationShopModel copyWith({  String? name,
  String? ownerName,
  String? phone,
  CountryResponse? country,
  ProvinceResponse? province,
  DistrictResponse? district,
  String? subStreet,
  String? email,
  String? address,
  String? id,
  bool? isInvoiceExact,
}) => InformationShopModel(  name: name ?? _name,
  ownerName: ownerName ?? _ownerName,
  phone: phone ?? _phone,
  country: country ?? _country,
  province: province ?? _province,
  district: district ?? _district,
  subStreet: subStreet ?? _subStreet,
  email: email ?? _email,
  address: address ?? _address,
  id: id ?? _id,
  isInvoiceExact: isInvoiceExact ?? _isInvoiceExact,
);
  String? get name => _name;
  String? get ownerName => _ownerName;
  String? get phone => _phone;
  CountryResponse? get country => _country;
  ProvinceResponse? get province => _province;
  DistrictResponse? get district => _district;
  String? get subStreet => _subStreet;
  String? get email => _email;
  String? get address => _address;
  String? get id => _id;
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
    map['id'] = _id;
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
    id,
    isInvoiceExact,
  ];

}

/// id : "0adf92a1-ac95-4f98-8968-bea5c9a06abf"
/// code : "huyen_an_duong"
/// name : "Huyện An Dương"

class DistrictResponse {
  DistrictResponse({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  DistrictResponse.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
DistrictResponse copyWith({  String? id,
  String? code,
  String? name,
}) => DistrictResponse(  id: id ?? _id,
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

/// id : "756118dd-5670-4a9e-b092-fcc35f3eba67"
/// code : "thanh_pho_hai_phong"
/// name : "Thành phố Hải Phòng"

class ProvinceResponse {
  ProvinceResponse({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  ProvinceResponse.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
ProvinceResponse copyWith({  String? id,
  String? code,
  String? name,
}) => ProvinceResponse(  id: id ?? _id,
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
/// code : "vn"
/// name : "Việt Nam"

class CountryResponse {
  CountryResponse({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  CountryResponse.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
CountryResponse copyWith({  String? id,
  String? code,
  String? name,
}) => CountryResponse(  id: id ?? _id,
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