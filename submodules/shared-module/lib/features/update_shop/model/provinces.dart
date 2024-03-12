import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provinces.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Provinces extends Equatable {
  Provinces({
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

  Provinces.fromJson(dynamic json) {
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
  Provinces copyWith({  String? provinceId,
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
  }) => Provinces(  provinceId: provinceId ?? _provinceId,
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
  List<Object?> get props => [
    provinceId,
    countryId,
    countryName,
    provinceName,
    code,
    codeName,
    supportType,
    status,
    createdAt,
    updatedAt,
    districts,
    longitude,
   latitude
  ];

}