
class PaymentType {
  String? id;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? code;
  String? name;

  PaymentType({this.id, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy, this.code, this.name});

  PaymentType.fromJson(Map<String, dynamic> json) {
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
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["created_by"] = createdBy;
    _data["updated_at"] = updatedAt;
    _data["updated_by"] = updatedBy;
    _data["code"] = code;
    _data["name"] = name;
    return _data;
  }
}