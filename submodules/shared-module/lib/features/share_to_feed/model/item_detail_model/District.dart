class District {
  District({
      this.id, 
      this.code, 
      this.name, 
      this.longitude, 
      this.latitude,});

  District.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
  String? id;
  String? code;
  String? name;
  num? longitude;
  num? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }
}