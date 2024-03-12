import 'package:json_annotation/json_annotation.dart';

part 'send_request_open_restaurant.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class SendRequestOpenRestaurant {
  final String? name;
  final CountryRestaurantRequest? country;
  final ProvinceRestaurantRequest? province;
  final DistrictRestaurantRequest? district;
  final String? street;
  final String? subStreet;
  final List<String>? restaurantTypeIds;
  final List<String>? restaurantTypes;
  final String? ownerName;
  final String? email;
  final String? phone;
  final String? idCard;
  final DateTime? openTime;
  final DateTime? closedTime;

  SendRequestOpenRestaurant(
      this.name,
      this.country,
      this.province,
      this.district,
      this.street,
      this.subStreet,
      this.restaurantTypeIds,
      this.restaurantTypes,
      this.ownerName,
      this.email,
      this.phone,
      this.idCard,
      this.openTime,
      this.closedTime);
  factory SendRequestOpenRestaurant.fromJson(Map<String, dynamic> json) {
    return _$SendRequestOpenRestaurantFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendRequestOpenRestaurantToJson(this);
  }
}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"
/// longitude : 0
/// latitude : 0

class DistrictRestaurantRequest {
  DistrictRestaurantRequest({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  DistrictRestaurantRequest.fromJson(dynamic json) {
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

  DistrictRestaurantRequest copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      DistrictRestaurantRequest(
        id: id ?? _id,
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

class ProvinceRestaurantRequest {
  ProvinceRestaurantRequest({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  ProvinceRestaurantRequest.fromJson(dynamic json) {
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

  ProvinceRestaurantRequest copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      ProvinceRestaurantRequest(
        id: id ?? _id,
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

class CountryRestaurantRequest {
  CountryRestaurantRequest({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  CountryRestaurantRequest.fromJson(dynamic json) {
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

  CountryRestaurantRequest copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      CountryRestaurantRequest(
        id: id ?? _id,
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
