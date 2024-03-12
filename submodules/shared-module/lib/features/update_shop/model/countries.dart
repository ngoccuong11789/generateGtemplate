import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'countries.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Countries extends Equatable {
  Countries({
    String? countryId,
    String? countryName,
    num? code,
    String? codeName,
    String? supportType,
    String? status,
    num? createdAt,
    num? updatedAt,
    dynamic provinces,
    num? longitude,
    num? latitude,}){
    _countryId = countryId;
    _countryName = countryName;
    _code = code;
    _codeName = codeName;
    _supportType = supportType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _provinces = provinces;
    _longitude = longitude;
    _latitude = latitude;
  }

  Countries.fromJson(dynamic json) {
    _countryId = json['country_id'];
    _countryName = json['country_name'];
    _code = json['code'];
    _codeName = json['code_name'];
    _supportType = json['support_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _provinces = json['provinces'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _countryId;
  String? _countryName;
  num? _code;
  String? _codeName;
  String? _supportType;
  String? _status;
  num? _createdAt;
  num? _updatedAt;
  dynamic _provinces;
  num? _longitude;
  num? _latitude;
  Countries copyWith({  String? countryId,
    String? countryName,
    num? code,
    String? codeName,
    String? supportType,
    String? status,
    num? createdAt,
    num? updatedAt,
    dynamic provinces,
    num? longitude,
    num? latitude,
  }) => Countries(  countryId: countryId ?? _countryId,
    countryName: countryName ?? _countryName,
    code: code ?? _code,
    codeName: codeName ?? _codeName,
    supportType: supportType ?? _supportType,
    status: status ?? _status,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    provinces: provinces ?? _provinces,
    longitude: longitude ?? _longitude,
    latitude: latitude ?? _latitude,
  );
  String? get countryId => _countryId;
  String? get countryName => _countryName;
  num? get code => _code;
  String? get codeName => _codeName;
  String? get supportType => _supportType;
  String? get status => _status;
  num? get createdAt => _createdAt;
  num? get updatedAt => _updatedAt;
  dynamic get provinces => _provinces;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['country_name'] = _countryName;
    map['code'] = _code;
    map['code_name'] = _codeName;
    map['support_type'] = _supportType;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['provinces'] = _provinces;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    countryId,
    countryName,
    code,
    codeName,
    supportType,
    status,
    createdAt,
    updatedAt,
    provinces,
    longitude,
    latitude,
  ];
}