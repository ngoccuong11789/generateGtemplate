import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class District extends Equatable{
  final List<DataDistrict>? data;

  District({this.data});
  factory District.fromJson(Map<String, dynamic> json) {
    return _$DistrictFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DistrictToJson(this);
  }

  District copyWith({
    List<DataDistrict>? data,
  }) {
    return District(
      data: data ?? this.data,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

/// district_id : "6a04574e-b070-4ffd-946b-5b30111c4773"
/// province_id : "e0779e4a-0370-438b-96ae-50c7d0bf6a6d"
/// district_name : "Huyện Cờ Đỏ"
/// code : 925
/// code_name : "huyen_co_do"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1694359623294
/// longitude : 105.46491
/// latitude : 10.12151

class DataDistrict extends Equatable {
  DataDistrict({
      String? districtId, 
      String? provinceId, 
      String? districtName, 
      num? code, 
      String? codeName, 
      String? supportType, 
      String? status, 
      num? createdAt, 
      num? updatedAt, 
      num? longitude, 
      num? latitude,}){
    _districtId = districtId;
    _provinceId = provinceId;
    _districtName = districtName;
    _code = code;
    _codeName = codeName;
    _supportType = supportType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _longitude = longitude;
    _latitude = latitude;
}

  DataDistrict.fromJson(dynamic json) {
    _districtId = json['district_id'];
    _provinceId = json['province_id'];
    _districtName = json['district_name'];
    _code = json['code'];
    _codeName = json['code_name'];
    _supportType = json['support_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _districtId;
  String? _provinceId;
  String? _districtName;
  num? _code;
  String? _codeName;
  String? _supportType;
  String? _status;
  num? _createdAt;
  num? _updatedAt;
  num? _longitude;
  num? _latitude;
DataDistrict copyWith({  String? districtId,
  String? provinceId,
  String? districtName,
  num? code,
  String? codeName,
  String? supportType,
  String? status,
  num? createdAt,
  num? updatedAt,
  num? longitude,
  num? latitude,
}) => DataDistrict(  districtId: districtId ?? _districtId,
  provinceId: provinceId ?? _provinceId,
  districtName: districtName ?? _districtName,
  code: code ?? _code,
  codeName: codeName ?? _codeName,
  supportType: supportType ?? _supportType,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get districtId => _districtId;
  String? get provinceId => _provinceId;
  String? get districtName => _districtName;
  num? get code => _code;
  String? get codeName => _codeName;
  String? get supportType => _supportType;
  String? get status => _status;
  num? get createdAt => _createdAt;
  num? get updatedAt => _updatedAt;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['district_id'] = _districtId;
    map['province_id'] = _provinceId;
    map['district_name'] = _districtName;
    map['code'] = _code;
    map['code_name'] = _codeName;
    map['support_type'] = _supportType;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [districtId];

}