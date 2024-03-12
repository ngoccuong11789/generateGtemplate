import 'package:json_annotation/json_annotation.dart';
part 'restaurant_update_request.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class RestaurantUpdateRequest {
  final String? name;
  final CountryRequest? country;
  final ProvinceRequest? province;
  final DistrictRequest? district;
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

  RestaurantUpdateRequest(
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

  factory RestaurantUpdateRequest.fromJson(Map<String, dynamic> json) {
    return _$RestaurantUpdateRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RestaurantUpdateRequestToJson(this);
  }
}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"
/// longitude : 0
/// latitude : 0

class DistrictRequest {
  DistrictRequest({
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

  DistrictRequest.fromJson(dynamic json) {
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

  DistrictRequest copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      DistrictRequest(
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

class ProvinceRequest {
  ProvinceRequest({
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

  ProvinceRequest.fromJson(dynamic json) {
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

  ProvinceRequest copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      ProvinceRequest(
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

class CountryRequest {
  CountryRequest({
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

  CountryRequest.fromJson(dynamic json) {
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

  CountryRequest copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      CountryRequest(
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
