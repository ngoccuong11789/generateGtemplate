class DropdownItemModel {
  DropdownItemModel( {
    required this.name,
    required this.id,
    required this.code
  });

  DropdownItemModel.fromJson(dynamic json)
      : name = json['name'] ??
            json["province_name"] ??
            json["district_name"] ??
            json["ward_name"] ??
            json["country_name"],
        code = json['code'] ??
      json["province_code"] ??
      json["district_code"] ??
      json["ward_code"] ??
      json["country_code"],
        id = json['id'] ??
            json["ward_id"] ??
            json["district_id"] ??
            json["province_id"] ??
            json["country_id"];

  final String name;
  final String id;
  final num code;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['code'] = code;
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
