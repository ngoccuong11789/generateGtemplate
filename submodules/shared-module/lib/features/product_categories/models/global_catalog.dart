
class GlobalCatalog {
  String? id;
  String? name;
  Image? image;
  dynamic parentId;
  int? depth;
  String? reference;
  Status? status;
  String? createdAt;
  int? quantity;
  List<GlobalCatalog>? subCatalogs;
  bool? isUseForHome;
  bool? isEndpoint;
  bool? isUsed;

  GlobalCatalog({this.id, this.name, this.image, this.parentId, this.depth, this.reference, this.status, this.createdAt, this.quantity, this.subCatalogs, this.isUseForHome, this.isEndpoint, this.isUsed});

  GlobalCatalog.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is Map) {
      image = json["image"] == null ? null : Image.fromJson(json["image"]);
    }
    parentId = json["parent_id"];
    if(json["depth"] is int) {
      depth = json["depth"];
    }
    if(json["reference"] is String) {
      reference = json["reference"];
    }
    if(json["status"] is Map) {
      status = json["status"] == null ? null : Status.fromJson(json["status"]);
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["sub_catalogs"] is List) {
      subCatalogs = json["sub_catalogs"] == null ? null : (json["sub_catalogs"] as List).map((e) => GlobalCatalog.fromJson(e)).toList();
    }
    if(json["sub_food_types"] is List) {
      subCatalogs = json["sub_food_types"] == null ? null : (json["sub_food_types"] as List).map((e) => GlobalCatalog.fromJson(e)).toList();
    }
    if(json["is_use_for_home"] is bool) {
      isUseForHome = json["is_use_for_home"];
    }
    if(json["is_endpoint"] is bool) {
      isEndpoint = json["is_endpoint"];
    }
    if(json["is_used"] is bool) {
      isUsed = json["is_used"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["parent_id"] = parentId;
    _data["depth"] = depth;
    _data["reference"] = reference;
    if(status != null) {
      _data["status"] = status?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["quantity"] = quantity;
    if(subCatalogs != null) {
      _data["sub_catalogs"] = subCatalogs?.map((e) => e.toJson()).toList();
    }
    _data["is_use_for_home"] = isUseForHome;
    _data["is_endpoint"] = isEndpoint;
    _data["is_used"] = isUsed;
    return _data;
  }
}

class SubCatalogs {
  String? id;
  String? name;
  Image1? image;
  String? parentId;
  int? depth;
  String? reference;
  Status1? status;
  String? createdAt;
  int? quantity;
  List<SubCatalogs1>? subCatalogs;
  bool? isUseForHome;
  bool? isEndpoint;
  bool? isUsed;

  SubCatalogs({this.id, this.name, this.image, this.parentId, this.depth, this.reference, this.status, this.createdAt, this.quantity, this.subCatalogs, this.isUseForHome, this.isEndpoint, this.isUsed});

  SubCatalogs.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is Map) {
      image = json["image"] == null ? null : Image1.fromJson(json["image"]);
    }
    if(json["parent_id"] is String) {
      parentId = json["parent_id"];
    }
    if(json["depth"] is int) {
      depth = json["depth"];
    }
    if(json["reference"] is String) {
      reference = json["reference"];
    }
    if(json["status"] is Map) {
      status = json["status"] == null ? null : Status1.fromJson(json["status"]);
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["sub_catalogs"] is List) {
      subCatalogs = json["sub_catalogs"] == null ? null : (json["sub_catalogs"] as List).map((e) => SubCatalogs1.fromJson(e)).toList();
    }
    if(json["is_use_for_home"] is bool) {
      isUseForHome = json["is_use_for_home"];
    }
    if(json["is_endpoint"] is bool) {
      isEndpoint = json["is_endpoint"];
    }
    if(json["is_used"] is bool) {
      isUsed = json["is_used"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["parent_id"] = parentId;
    _data["depth"] = depth;
    _data["reference"] = reference;
    if(status != null) {
      _data["status"] = status?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["quantity"] = quantity;
    if(subCatalogs != null) {
      _data["sub_catalogs"] = subCatalogs?.map((e) => e.toJson()).toList();
    }
    _data["is_use_for_home"] = isUseForHome;
    _data["is_endpoint"] = isEndpoint;
    _data["is_used"] = isUsed;
    return _data;
  }
}

class SubCatalogs1 {
  String? id;
  String? name;
  Image2? image;
  String? parentId;
  int? depth;
  String? reference;
  Status2? status;
  String? createdAt;
  int? quantity;
  dynamic subCatalogs;
  bool? isUseForHome;
  bool? isEndpoint;
  bool? isUsed;

  SubCatalogs1({this.id, this.name, this.image, this.parentId, this.depth, this.reference, this.status, this.createdAt, this.quantity, this.subCatalogs, this.isUseForHome, this.isEndpoint, this.isUsed});

  SubCatalogs1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is Map) {
      image = json["image"] == null ? null : Image2.fromJson(json["image"]);
    }
    if(json["parent_id"] is String) {
      parentId = json["parent_id"];
    }
    if(json["depth"] is int) {
      depth = json["depth"];
    }
    if(json["reference"] is String) {
      reference = json["reference"];
    }
    if(json["status"] is Map) {
      status = json["status"] == null ? null : Status2.fromJson(json["status"]);
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    subCatalogs = json["sub_catalogs"];
    if(json["is_use_for_home"] is bool) {
      isUseForHome = json["is_use_for_home"];
    }
    if(json["is_endpoint"] is bool) {
      isEndpoint = json["is_endpoint"];
    }
    if(json["is_used"] is bool) {
      isUsed = json["is_used"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["parent_id"] = parentId;
    _data["depth"] = depth;
    _data["reference"] = reference;
    if(status != null) {
      _data["status"] = status?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["quantity"] = quantity;
    _data["sub_catalogs"] = subCatalogs;
    _data["is_use_for_home"] = isUseForHome;
    _data["is_endpoint"] = isEndpoint;
    _data["is_used"] = isUsed;
    return _data;
  }
}

class Status2 {
  String? id;
  String? name;
  String? code;
  String? color;

  Status2({this.id, this.name, this.code, this.color});

  Status2.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["color"] = color;
    return _data;
  }
}

class Image2 {
  String? id;
  String? extension;
  String? originalName;
  String? type;
  int? size;
  String? description;

  Image2({this.id, this.extension, this.originalName, this.type, this.size, this.description});

  Image2.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["extension"] is String) {
      extension = json["extension"];
    }
    if(json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["type"] = type;
    _data["size"] = size;
    _data["description"] = description;
    return _data;
  }
}

class Status1 {
  String? id;
  String? name;
  String? code;
  String? color;

  Status1({this.id, this.name, this.code, this.color});

  Status1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["color"] = color;
    return _data;
  }
}

class Image1 {
  String? id;
  String? extension;
  String? originalName;
  String? type;
  int? size;
  String? description;

  Image1({this.id, this.extension, this.originalName, this.type, this.size, this.description});

  Image1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["extension"] is String) {
      extension = json["extension"];
    }
    if(json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["type"] = type;
    _data["size"] = size;
    _data["description"] = description;
    return _data;
  }
}

class Status {
  String? id;
  String? name;
  String? code;
  String? color;

  Status({this.id, this.name, this.code, this.color});

  Status.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["color"] = color;
    return _data;
  }
}

class Image {
  String? id;
  String? extension;
  String? originalName;
  String? type;
  int? size;
  String? description;

  Image({this.id, this.extension, this.originalName, this.type, this.size, this.description});

  Image.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["extension"] is String) {
      extension = json["extension"];
    }
    if(json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["extension"] = extension;
    _data["original_name"] = originalName;
    _data["type"] = type;
    _data["size"] = size;
    _data["description"] = description;
    return _data;
  }
}