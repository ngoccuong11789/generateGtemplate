import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'city_district_ward.dart';

part 'provinces.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Provinces extends Equatable {
  final List<DataProvinces>? data;

  Provinces({this.data});
  factory Provinces.fromJson(Map<String, dynamic> json) {
    return _$ProvincesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProvincesToJson(this);
  }

  Provinces copyWith({
    List<DataProvinces>? data,
  }) {
    return Provinces(
      data: data ?? this.data,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

/// province_id : "e0779e4a-0370-438b-96ae-50c7d0bf6a6d"
/// country_id : "1e5effa4-c844-48ee-a7b7-3f3c62ffc883"
/// country_name : "Việt Nam"
/// province_name : "Thành phố Cần Thơ"
/// code : 92
/// code_name : "thanh_pho_can_tho"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1694725747400
/// districts : null
/// longitude : 105.78825
/// latitude : 10.03711

class DataProvinces extends Equatable {
  DataProvinces({
      String? provinceId, 
      String? countryId, 
      String? countryName, 
      String? provinceName, 
      num? code, 
      String? codeName, 
      String? supportType, 
      String? status, 
      num? createdAt, 
      num? updatedAt, 
      dynamic districts, 
      num? longitude, 
      num? latitude,}){
    _provinceId = provinceId;
    _countryId = countryId;
    _countryName = countryName;
    _provinceName = provinceName;
    _code = code;
    _codeName = codeName;
    _supportType = supportType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _districts = districts;
    _longitude = longitude;
    _latitude = latitude;
}

  DataProvinces.fromJson(dynamic json) {
    _provinceId = json['province_id'];
    _countryId = json['country_id'];
    _countryName = json['country_name'];
    _provinceName = json['province_name'];
    _code = json['code'];
    _codeName = json['code_name'];
    _supportType = json['support_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _districts = json['districts'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _provinceId;
  String? _countryId;
  String? _countryName;
  String? _provinceName;
  num? _code;
  String? _codeName;
  String? _supportType;
  String? _status;
  num? _createdAt;
  num? _updatedAt;
  dynamic _districts;
  num? _longitude;
  num? _latitude;
DataProvinces copyWith({  String? provinceId,
  String? countryId,
  String? countryName,
  String? provinceName,
  num? code,
  String? codeName,
  String? supportType,
  String? status,
  num? createdAt,
  num? updatedAt,
  dynamic districts,
  num? longitude,
  num? latitude,
}) => DataProvinces(  provinceId: provinceId ?? _provinceId,
  countryId: countryId ?? _countryId,
  countryName: countryName ?? _countryName,
  provinceName: provinceName ?? _provinceName,
  code: code ?? _code,
  codeName: codeName ?? _codeName,
  supportType: supportType ?? _supportType,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  districts: districts ?? _districts,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get provinceId => _provinceId;
  String? get countryId => _countryId;
  String? get countryName => _countryName;
  String? get provinceName => _provinceName;
  num? get code => _code;
  String? get codeName => _codeName;
  String? get supportType => _supportType;
  String? get status => _status;
  num? get createdAt => _createdAt;
  num? get updatedAt => _updatedAt;
  dynamic get districts => _districts;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['province_id'] = _provinceId;
    map['country_id'] = _countryId;
    map['country_name'] = _countryName;
    map['province_name'] = _provinceName;
    map['code'] = _code;
    map['code_name'] = _codeName;
    map['support_type'] = _supportType;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['districts'] = _districts;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [provinceId];

}