class ProvinceModel {
  ProvinceModel({
    required this.provinceId,
    required this.countryId,
    required this.provinceName,
    required this.code,
    required this.codeName,
    required this.supportType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  ProvinceModel.fromJson(dynamic json)
      : provinceId = json['province_id'],
        countryId = json['country_id'],
        provinceName = json['province_name'],
        code = json['code'],
        codeName = json['code_name'],
        supportType = json['support_type'],
        status = json['status'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  final String provinceId;
  final String countryId;
  final String provinceName;
  final int code;
  final String codeName;
  final String supportType;
  final String status;
  final String createdAt;
  final String updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['province_id'] = provinceId;
    map['country_id'] = countryId;
    map['province_name'] = provinceName;
    map['code'] = code;
    map['code_name'] = codeName;
    map['support_type'] = supportType;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
