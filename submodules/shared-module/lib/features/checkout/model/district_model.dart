import 'package:json_annotation/json_annotation.dart';

/// data : [{"district_id":"6a04574e-b070-4ffd-946b-5b30111c4773","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Huyện Cờ Đỏ","code":925,"code_name":"huyen_co_do","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201210535,"longitude":105.46491,"latitude":10.12151,"postal_code":"900600"},{"district_id":"c2d418d8-7ba1-4d1e-9bfe-88b953059834","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Huyện Phong Điền","code":926,"code_name":"huyen_phong_dien","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201210639,"longitude":105.67016,"latitude":9.99957,"postal_code":"900500"},{"district_id":"98b80373-3cef-452c-b9c1-0c676d555652","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Huyện Thới Lai","code":927,"code_name":"huyen_thoi_lai","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201210843,"longitude":105.54557,"latitude":10.02657,"postal_code":"900900"},{"district_id":"54c5e01d-dce0-4b85-8f69-67fa5f050e8b","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Huyện Vĩnh Thạnh","code":924,"code_name":"huyen_vinh_thanh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201210740,"longitude":105.38032,"latitude":10.20289,"postal_code":"900700"},{"district_id":"d326448f-9f78-4f22-bc4f-0b135dc48af9","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Quận Bình Thuỷ","code":918,"code_name":"quan_binh_thuy","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201190890,"longitude":105.7293,"latitude":10.06288,"postal_code":"900200"},{"district_id":"60f03bf3-a762-4006-b74c-82b0c988d735","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Quận Cái Răng","code":919,"code_name":"quan_cai_rang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201190993,"longitude":0,"latitude":0,"postal_code":"900300"},{"district_id":"78ff6bab-207e-4245-90e8-cfffe6eb1394","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Quận Ninh Kiều","code":916,"code_name":"quan_ninh_kieu","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201080737,"longitude":105.76253,"latitude":10.02905,"postal_code":"900100"},{"district_id":"0e51b3b1-7c94-44b1-bcba-68e6b4590f9f","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Quận Ô Môn","code":917,"code_name":"quan_o_mon","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201210432,"longitude":105.63692,"latitude":10.13171,"postal_code":"900400"},{"district_id":"a20c5963-a998-44f3-953c-ffc794bb74df","province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","district_name":"Quận Thốt Nốt","code":923,"code_name":"quan_thot_not","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698201191096,"longitude":105.5338,"latitude":10.27213,"postal_code":"900800"}]
/// error : null
/// success : true
part 'district_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DistrictModel {
  final List<ItemDistrict>? data;

  DistrictModel({this.data});

  DistrictModel copyWith({
    List<ItemDistrict>? data,
  }) {
    return DistrictModel(
      data: data ?? this.data,
    );
  }

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return _$DistrictModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DistrictModelToJson(this);
  }
}

/// district_id : "6a04574e-b070-4ffd-946b-5b30111c4773"
/// province_id : "e0779e4a-0370-438b-96ae-50c7d0bf6a6d"
/// district_name : "Huyện Cờ Đỏ"
/// code : 925
/// code_name : "huyen_co_do"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1698201210535
/// longitude : 105.46491
/// latitude : 10.12151
/// postal_code : "900600"

class ItemDistrict {
  ItemDistrict({
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
      String? postalCode,}){
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
    _postalCode = postalCode;
}

  ItemDistrict.fromJson(dynamic json) {
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
    _postalCode = json['postal_code'];
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
  String? _postalCode;
ItemDistrict copyWith({  String? districtId,
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
  String? postalCode,
}) => ItemDistrict(  districtId: districtId ?? _districtId,
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
  postalCode: postalCode ?? _postalCode,
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
  String? get postalCode => _postalCode;

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
    map['postal_code'] = _postalCode;
    return map;
  }

}