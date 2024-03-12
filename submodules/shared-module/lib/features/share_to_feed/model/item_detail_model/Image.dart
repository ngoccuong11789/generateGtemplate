class Image {
  Image({
      this.id, 
      this.extension, 
      this.originalName, 
      this.size, 
      this.type, 
      this.description, 
      this.signature,});

  Image.fromJson(dynamic json) {
    id = json['id'];
    extension = json['extension'];
    originalName = json['original_name'];
    size = json['size'];
    type = json['type'];
    description = json['description'];
    signature = json['signature'];
  }
  String? id;
  String? extension;
  String? originalName;
  num? size;
  String? type;
  String? description;
  String? signature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['extension'] = extension;
    map['original_name'] = originalName;
    map['size'] = size;
    map['type'] = type;
    map['description'] = description;
    map['signature'] = signature;
    return map;
  }

}