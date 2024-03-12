class Avatar {
  Avatar({
      this.id, 
      this.name, 
      this.extension, 
      this.originalName, 
      this.size, 
      this.type, 
      this.description, 
      this.content,});

  Avatar.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    extension = json['extension'];
    originalName = json['original_name'];
    size = json['size'];
    type = json['type'];
    description = json['description'];
    content = json['content'];
  }
  String? id;
  String? name;
  String? extension;
  String? originalName;
  num? size;
  String? type;
  String? description;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['extension'] = extension;
    map['original_name'] = originalName;
    map['size'] = size;
    map['type'] = type;
    map['description'] = description;
    map['content'] = content;
    return map;
  }

}