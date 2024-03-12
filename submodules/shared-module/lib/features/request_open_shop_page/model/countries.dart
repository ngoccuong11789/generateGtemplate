import 'package:json_annotation/json_annotation.dart';

/// data : [{"country_id":"f918ae49-cea0-4f92-82f6-6c8f52692b9b","country_name":"USA","code":2,"code_name":"USA","support_type":"DELIVERY","status":"UNLOCK","created_at":1695288635161,"updated_at":1695288635161,"provinces":null,"longitude":-98.5,"latitude":39.76},{"country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","code":1,"code_name":"Viet_Nam","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1695281015927,"provinces":null,"longitude":105.84117,"latitude":21.0245}]
/// error : null
/// success : true
part 'countries.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Countries {
  Countries({
      List<DataCountries>? data,
      dynamic error, 
      bool? success,}){
    _data = data;
    _error = error;
    _success = success;
}

  Countries.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataCountries.fromJson(v));
      });
    }
    _error = json['error'];
    _success = json['success'];
  }
  List<DataCountries>? _data;
  dynamic _error;
  bool? _success;
Countries copyWith({  List<DataCountries>? data,
  dynamic error,
  bool? success,
}) => Countries(  data: data ?? _data,
  error: error ?? _error,
  success: success ?? _success,
);
  List<DataCountries>? get data => _data;
  dynamic get error => _error;
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['error'] = _error;
    map['success'] = _success;
    return map;
  }

}

/// country_id : "f918ae49-cea0-4f92-82f6-6c8f52692b9b"
/// country_name : "USA"
/// code : 2
/// code_name : "USA"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1695288635161
/// updated_at : 1695288635161
/// provinces : null
/// longitude : -98.5
/// latitude : 39.76

class DataCountries {
  DataCountries({
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

  DataCountries.fromJson(dynamic json) {
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
DataCountries copyWith({  String? countryId,
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
}) => DataCountries(  countryId: countryId ?? _countryId,
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

}