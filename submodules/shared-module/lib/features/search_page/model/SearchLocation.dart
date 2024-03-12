import 'dart:convert';

/// province_id : "75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8"
/// country_id : "1e5effa4-c844-48ee-a7b7-3f3c62ffc883"
/// country_name : "Việt Nam"
/// province_name : "Thành phố Hồ Chí Minh"
/// code : 79
/// code_name : "thanh_pho_ho_chi_minh"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1691746765799
/// districts : [{"district_id":"d8b3d33b-3fec-4230-a229-8f97360bcb34","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Huyện Bình Chánh","code":785,"code_name":"huyen_binh_chanh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"677b5356-064c-4d40-9178-8eb7f7a62475","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Huyện Cần Giờ","code":787,"code_name":"huyen_can_gio","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"851a8b8b-26df-4fc1-9740-88b48c2f277c","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Huyện Củ Chi","code":783,"code_name":"huyen_cu_chi","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"3131fb40-4b07-4445-a9c0-bb46fea185c5","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Huyện Hóc Môn","code":784,"code_name":"huyen_hoc_mon","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"7e044135-c6c1-4b07-a212-697e78744dc2","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Huyện Nhà Bè","code":786,"code_name":"huyen_nha_be","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"3c5868a6-004c-41d8-84c9-4c3d1734ed5e","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 1","code":760,"code_name":"quan_1","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"3016c119-4e6f-44bf-bf1d-544cab7eb76c","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 10","code":771,"code_name":"quan_10","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"7ba23f3f-984c-4e71-9db0-5615d740136f","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 11","code":772,"code_name":"quan_11","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"2d6e27f7-55d1-4b6c-b313-6a8430cc8d2c","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 12","code":761,"code_name":"quan_12","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"e63e4c6a-eaa4-46df-87eb-d711e706a4ab","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 3","code":770,"code_name":"quan_3","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"de4ab862-a2f7-4d59-b9ae-5b8b3f099859","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 4","code":773,"code_name":"quan_4","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"8e897b36-c264-4b2a-a298-9b6fc345abdc","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 5","code":774,"code_name":"quan_5","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"8b9ba780-21b8-4ff5-a4ff-90a661107b26","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 6","code":775,"code_name":"quan_6","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"c5650757-2817-4432-97ce-5dc68da8cb70","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 7","code":778,"code_name":"quan_7","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"957a64f6-9693-496f-aa9d-a000cc3706f8","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận 8","code":776,"code_name":"quan_8","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"83f2b672-495c-484d-9280-7ee52e9f3758","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận Bình Tân","code":777,"code_name":"quan_binh_tan","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"d1526eb6-712a-4f6d-8cc5-0eaac2ead9a7","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận Bình Thạnh","code":765,"code_name":"quan_binh_thanh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"8b1f418f-88b1-444c-a7c9-b41973203034","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận Gò Vấp","code":764,"code_name":"quan_go_vap","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"8347a5d9-704d-47ab-b196-d5b882031ebe","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận Phú Nhuận","code":768,"code_name":"quan_phu_nhuan","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"537d5b9b-b2b0-4809-a4ae-6692614f08df","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận Tân Bình","code":766,"code_name":"quan_tan_binh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"671bc853-4064-483b-8f5f-63cb20dc06c6","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Quận Tân Phú","code":767,"code_name":"quan_tan_phu","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0},{"district_id":"50cfa47f-3773-4072-bc47-ec9fde10aa4f","province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","district_name":"Thành phố Thủ Đức","code":769,"code_name":"thanh_pho_thu_duc","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1691746765799,"longitude":0,"latitude":0}]
/// longitude : 0
/// latitude : 0

SearchLocation searchLocationFromJson(String str) =>
    SearchLocation.fromJson(json.decode(str));
String searchLocationToJson(SearchLocation data) => json.encode(data.toJson());

class SearchLocation {
  SearchLocation({
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
    List<Districts>? districts,
    num? longitude,
    num? latitude,
  }) {
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

  SearchLocation.fromJson(dynamic json) {
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
    if (json['districts'] != null) {
      _districts = [];
      json['districts'].forEach((v) {
        _districts?.add(Districts.fromJson(v));
      });
    }
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
  List<Districts>? _districts;
  num? _longitude;
  num? _latitude;
  SearchLocation copyWith({
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
    List<Districts>? districts,
    num? longitude,
    num? latitude,
  }) =>
      SearchLocation(
        provinceId: provinceId ?? _provinceId,
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
  List<Districts>? get districts => _districts;
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
    if (_districts != null) {
      map['districts'] = _districts?.map((v) => v.toJson()).toList();
    }
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}

/// district_id : "d8b3d33b-3fec-4230-a229-8f97360bcb34"
/// province_id : "75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8"
/// district_name : "Huyện Bình Chánh"
/// code : 785
/// code_name : "huyen_binh_chanh"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1691746765799
/// longitude : 0
/// latitude : 0

Districts districtsFromJson(String str) => Districts.fromJson(json.decode(str));
String districtsToJson(Districts data) => json.encode(data.toJson());

class Districts {
  Districts({
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
    num? latitude,
  }) {
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

  Districts.fromJson(dynamic json) {
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
  Districts copyWith({
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
    num? latitude,
  }) =>
      Districts(
        districtId: districtId ?? _districtId,
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
}
