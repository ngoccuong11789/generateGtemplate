
class VoucherType {
  String? id;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? name;
  String? description;
  String? code;
  String? icon;
  String? color;
  String? type;

  VoucherType({this.id, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy, this.name, this.description, this.code, this.icon, this.color, this.type});

  VoucherType.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["created_by"] is String) {
      createdBy = json["created_by"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["updated_by"] is String) {
      updatedBy = json["updated_by"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["icon"] is String) {
      icon = json["icon"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["created_by"] = createdBy;
    _data["updated_at"] = updatedAt;
    _data["updated_by"] = updatedBy;
    _data["name"] = name;
    _data["description"] = description;
    _data["code"] = code;
    _data["icon"] = icon;
    _data["color"] = color;
    _data["type"] = type;
    return _data;
  }
}