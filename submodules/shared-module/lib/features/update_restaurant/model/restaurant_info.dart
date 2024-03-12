import 'package:json_annotation/json_annotation.dart';

part 'restaurant_info.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class RestaurantInformationModel {
  final String? name;
  final CountryResponse? country;
  final ProvinceResponse? province;
  final DistrictResponse? district;
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
  final String? id;
  final String? acceptedStatus;

  RestaurantInformationModel(
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
      this.closedTime,
      this.id,
      this.acceptedStatus);

  factory RestaurantInformationModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantInformationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RestaurantInformationModelToJson(this);
  }
}

/// id : "6a04574e-b070-4ffd-946b-5b30111c4773"
/// code : "huyen_co_do"
/// name : "Huyện Cờ Đỏ"
/// longitude : 0
/// latitude : 0

class DistrictResponse {
  DistrictResponse({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,}) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  DistrictResponse.fromJson(dynamic json) {
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

  DistrictResponse copyWith({ String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      DistrictResponse(
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

/// id : "e0779e4a-0370-438b-96ae-50c7d0bf6a6d"
/// code : "thanh_pho_can_tho"
/// name : "Thành phố Cần Thơ"
/// longitude : 0
/// latitude : 0

class ProvinceResponse {
  ProvinceResponse({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,}) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  ProvinceResponse.fromJson(dynamic json) {
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

  ProvinceResponse copyWith({ String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      ProvinceResponse(
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

/// id : "1e5effa4-c844-48ee-a7b7-3f3c62ffc883"
/// code : "vn"
/// name : "Việt Nam"
/// longitude : 0
/// latitude : 0

class CountryResponse {
  CountryResponse({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,}) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  CountryResponse.fromJson(dynamic json) {
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

  CountryResponse copyWith({ String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      CountryResponse(
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