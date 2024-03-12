import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ward.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Ward extends Equatable {
  final List<DataWard>? data;

  Ward({this.data});
  factory Ward.fromJson(Map<String, dynamic> json) {
    return _$WardFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WardToJson(this);
  }

  Ward copyWith({
    List<DataWard>? data,
  }) {
    return Ward(
      data: data ?? this.data,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

/// ward_id : "d784dc1e-b06f-4d2c-bade-1df9387c5e08"
/// district_id : "6a04574e-b070-4ffd-946b-5b30111c4773"
/// ward_name : "Thị trấn Cờ Đỏ"
/// code : 31261
/// code_name : "thi_tran_co_do"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1691746765799
/// longitude : 0
/// latitude : 0

class DataWard  extends Equatable{
  DataWard({
      String? wardId, 
      String? districtId, 
      String? wardName, 
      num? code, 
      String? codeName, 
      String? supportType, 
      String? status, 
      num? createdAt, 
      num? updatedAt, 
      num? longitude, 
      num? latitude,}){
    _wardId = wardId;
    _districtId = districtId;
    _wardName = wardName;
    _code = code;
    _codeName = codeName;
    _supportType = supportType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _longitude = longitude;
    _latitude = latitude;
}

  DataWard.fromJson(dynamic json) {
    _wardId = json['ward_id'];
    _districtId = json['district_id'];
    _wardName = json['ward_name'];
    _code = json['code'];
    _codeName = json['code_name'];
    _supportType = json['support_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _wardId;
  String? _districtId;
  String? _wardName;
  num? _code;
  String? _codeName;
  String? _supportType;
  String? _status;
  num? _createdAt;
  num? _updatedAt;
  num? _longitude;
  num? _latitude;
DataWard copyWith({  String? wardId,
  String? districtId,
  String? wardName,
  num? code,
  String? codeName,
  String? supportType,
  String? status,
  num? createdAt,
  num? updatedAt,
  num? longitude,
  num? latitude,
}) => DataWard(  wardId: wardId ?? _wardId,
  districtId: districtId ?? _districtId,
  wardName: wardName ?? _wardName,
  code: code ?? _code,
  codeName: codeName ?? _codeName,
  supportType: supportType ?? _supportType,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get wardId => _wardId;
  String? get districtId => _districtId;
  String? get wardName => _wardName;
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
    map['ward_id'] = _wardId;
    map['district_id'] = _districtId;
    map['ward_name'] = _wardName;
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
  List<Object?> get props => [wardId];

}