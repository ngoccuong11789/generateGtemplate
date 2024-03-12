
class DtoBillingAddress {
  DtoBillingAddress({
      String? name, 
      String? addressLine1, 
      String? addressLine2, 
      String? city, 
      String? region, 
      String? zip, 
      String? country, 
      String? phone,}){
    _name = name;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _city = city;
    _region = region;
    _zip = zip;
    _country = country;
    _phone = phone;
}

  DtoBillingAddress.fromJson(dynamic json) {
    _name = json['name'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _city = json['city'];
    _region = json['region'];
    _zip = json['zip'];
    _country = json['country'];
    _phone = json['phone'];
  }
  String? _name;
  String? _addressLine1;
  String? _addressLine2;
  String? _city;
  String? _region;
  String? _zip;
  String? _country;
  String? _phone;
DtoBillingAddress copyWith({  String? name,
  String? addressLine1,
  String? addressLine2,
  String? city,
  String? region,
  String? zip,
  String? country,
  String? phone,
}) => DtoBillingAddress(  name: name ?? _name,
  addressLine1: addressLine1 ?? _addressLine1,
  addressLine2: addressLine2 ?? _addressLine2,
  city: city ?? _city,
  region: region ?? _region,
  zip: zip ?? _zip,
  country: country ?? _country,
  phone: phone ?? _phone,
);
  String? get name => _name;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get city => _city;
  String? get region => _region;
  String? get zip => _zip;
  String? get country => _country;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['city'] = _city;
    map['region'] = _region;
    map['zip'] = _zip;
    map['country'] = _country;
    map['phone'] = _phone;
    return map;
  }

}