class LocalCatalogResponse {
  int? page;
  int? pageSize;
  int? totalElement;
  List<LocalCatalog>? data;

  LocalCatalogResponse(
      {this.page, this.pageSize, this.totalElement, this.data});

  LocalCatalogResponse.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if (json["totalElement"] is int) {
      totalElement = json["totalElement"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => LocalCatalog.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["pageSize"] = pageSize;
    _data["totalElement"] = totalElement;
    if (data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}

class LocalCatalog {
  String? id;
  String? name;
  int? depth;
  String? shopId;
  String? parentId;
  String? globalId;
  String? globalReferenceId;
  String? globalReference;
  String? reference;
  String? referenceId;
  int? quantity;
  String? globalName;
  bool? isUsed;

  LocalCatalog(
      {this.id,
      this.name,
      this.depth,
      this.shopId,
      this.parentId,
      this.globalId,
      this.globalReferenceId,
      this.globalReference,
      this.reference,
      this.referenceId,
      this.quantity,
      this.globalName,
      this.isUsed});

  LocalCatalog.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["depth"] is int) {
      depth = json["depth"];
    }
    if (json["shop_id"] is String) {
      shopId = json["shop_id"];
    }
    if (json["restaurant_id"] is String) {
      shopId = json["restaurant_id"];
    }
    if (json["parent_id"] is String) {
      parentId = json["parent_id"];
    }
    if (json["global_id"] is String) {
      globalId = json["global_id"];
    }
    if (json["global_reference_id"] is String) {
      globalReferenceId = json["global_reference_id"];
    }
    if (json["global_reference"] is String) {
      globalReference = json["global_reference"];
    }
    if (json["reference"] is String) {
      reference = json["reference"];
    }
    if (json["reference_id"] is String) {
      referenceId = json["reference_id"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["global_name"] is String) {
      globalName = json["global_name"];
    }

    if (json["is_used"] is bool) {
      isUsed = json["is_used"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["depth"] = depth;
    _data["shop_id"] = shopId;
    _data["parent_id"] = parentId;
    _data["global_id"] = globalId;
    _data["global_reference_id"] = globalReferenceId;
    _data["global_reference"] = globalReference;
    _data["reference"] = reference;
    _data["reference_id"] = referenceId;
    _data["quantity"] = quantity;
    _data["global_name"] = globalName;
    _data["is_used"] = isUsed;
    return _data;
  }
}
