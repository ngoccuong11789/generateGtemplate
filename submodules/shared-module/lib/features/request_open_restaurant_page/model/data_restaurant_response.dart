
class DataRestaurantResponse {
  DataRestaurantResponse({
      String? name, 
      CountryRestaurantResponse? country,
      ProvinceRestaurantResponse? province,
      DistrictRestaurantResponse? district,
      String? street,
      String? subStreet,
      List<String>? restaurantTypeIds, 
      List<String>? restaurantTypes, 
      String? ownerName, 
      String? email, 
      String? phone, 
      String? idCard, 
      String? openTime, 
      String? closedTime, 
      String? id, 
      String? acceptedStatus,}){
    _name = name;
    _country = country;
    _province = province;
    _district = district;
    _street = street;
    _subStreet = subStreet;
    _restaurantTypeIds = restaurantTypeIds;
    _restaurantTypes = restaurantTypes;
    _ownerName = ownerName;
    _email = email;
    _phone = phone;
    _idCard = idCard;
    _openTime = openTime;
    _closedTime = closedTime;
    _id = id;
    _acceptedStatus = acceptedStatus;
}

  DataRestaurantResponse.fromJson(dynamic json) {
    _name = json['name'];
    _country = json['country'] != null ? CountryRestaurantResponse.fromJson(json['country']) : null;
    _province = json['province'] != null ? ProvinceRestaurantResponse.fromJson(json['province']) : null;
    _district = json['district'] != null ? DistrictRestaurantResponse.fromJson(json['district']) : null;
    _street = json['street'];
    _subStreet = json['sub_street'];
    _restaurantTypeIds = json['restaurant_type_ids'] != null ? json['restaurant_type_ids'].cast<String>() : [];
    _restaurantTypes = json['restaurant_types'] != null ? json['restaurant_types'].cast<String>() : [];
    _ownerName = json['owner_name'];
    _email = json['email'];
    _phone = json['phone'];
    _idCard = json['id_card'];
    _openTime = json['open_time'];
    _closedTime = json['closed_time'];
    _id = json['id'];
    _acceptedStatus = json['accepted_status'];
  }
  String? _name;
  CountryRestaurantResponse? _country;
  ProvinceRestaurantResponse? _province;
  DistrictRestaurantResponse? _district;
  String? _street;
  String? _subStreet;
  List<String>? _restaurantTypeIds;
  List<String>? _restaurantTypes;
  String? _ownerName;
  String? _email;
  String? _phone;
  String? _idCard;
  String? _openTime;
  String? _closedTime;
  String? _id;
  String? _acceptedStatus;
DataRestaurantResponse copyWith({  String? name,
  CountryRestaurantResponse? country,
  ProvinceRestaurantResponse? province,
  DistrictRestaurantResponse? district,
  String? street,
  String? subStreet,
  List<String>? restaurantTypeIds,
  List<String>? restaurantTypes,
  String? ownerName,
  String? email,
  String? phone,
  String? idCard,
  String? openTime,
  String? closedTime,
  String? id,
  String? acceptedStatus,
}) => DataRestaurantResponse(  name: name ?? _name,
  country: country ?? _country,
  province: province ?? _province,
  district: district ?? _district,
  street: street ?? _street,
  subStreet: subStreet ?? _subStreet,
  restaurantTypeIds: restaurantTypeIds ?? _restaurantTypeIds,
  restaurantTypes: restaurantTypes ?? _restaurantTypes,
  ownerName: ownerName ?? _ownerName,
  email: email ?? _email,
  phone: phone ?? _phone,
  idCard: idCard ?? _idCard,
  openTime: openTime ?? _openTime,
  closedTime: closedTime ?? _closedTime,
  id: id ?? _id,
  acceptedStatus: acceptedStatus ?? _acceptedStatus,
);
  String? get name => _name;
  CountryRestaurantResponse? get country => _country;
  ProvinceRestaurantResponse? get province => _province;
  DistrictRestaurantResponse? get district => _district;
  String? get street => _street;
  String? get subStreet => _subStreet;
  List<String>? get restaurantTypeIds => _restaurantTypeIds;
  List<String>? get restaurantTypes => _restaurantTypes;
  String? get ownerName => _ownerName;
  String? get email => _email;
  String? get phone => _phone;
  String? get idCard => _idCard;
  String? get openTime => _openTime;
  String? get closedTime => _closedTime;
  String? get id => _id;
  String? get acceptedStatus => _acceptedStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_province != null) {
      map['province'] = _province?.toJson();
    }
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    map['street'] = _street;
    map['sub_street'] = _subStreet;
    map['restaurant_type_ids'] = _restaurantTypeIds;
    map['restaurant_types'] = _restaurantTypes;
    map['owner_name'] = _ownerName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['id_card'] = _idCard;
    map['open_time'] = _openTime;
    map['closed_time'] = _closedTime;
    map['id'] = _id;
    map['accepted_status'] = _acceptedStatus;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"
/// longitude : 0
/// latitude : 0

class DistrictRestaurantResponse {
  DistrictRestaurantResponse({
      String? id, 
      String? code, 
      String? name, 
      num? longitude, 
      num? latitude,}){
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
}

  DistrictRestaurantResponse.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
DistrictRestaurantResponse copyWith({  String? id,
  String? code,
  String? name,
  num? longitude,
  num? latitude,
}) => DistrictRestaurantResponse(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"
/// longitude : 0
/// latitude : 0

class ProvinceRestaurantResponse {
  ProvinceRestaurantResponse({
      String? id, 
      String? code, 
      String? name, 
      num? longitude, 
      num? latitude,}){
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
}

  ProvinceRestaurantResponse.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
ProvinceRestaurantResponse copyWith({  String? id,
  String? code,
  String? name,
  num? longitude,
  num? latitude,
}) => ProvinceRestaurantResponse(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"
/// longitude : 0
/// latitude : 0

class CountryRestaurantResponse {
  CountryRestaurantResponse({
      String? id, 
      String? code, 
      String? name, 
      num? longitude, 
      num? latitude,}){
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
}

  CountryRestaurantResponse.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
CountryRestaurantResponse copyWith({  String? id,
  String? code,
  String? name,
  num? longitude,
  num? latitude,
}) => CountryRestaurantResponse(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

}