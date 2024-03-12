class CartRequest {
  String? objectType;
  String? entityId;
  String? objectId;
  String? stockId;
  int? quantity;
  String? note;

  CartRequest(
      {this.objectType,
      this.entityId,
      this.objectId,
      this.stockId,
      this.quantity,
      this.note});

  CartRequest.fromJson(Map<String, dynamic> json) {
    if (json["object_type"] is String) {
      objectType = json["object_type"];
    }
    if (json["entity_id"] is String) {
      entityId = json["entity_id"];
    }
    if (json["object_id"] is String) {
      objectId = json["object_id"];
    }
    if (json["stock_id"] is String) {
      stockId = json["stock_id"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["object_type"] = objectType;
    _data["entity_id"] = entityId;
    _data["object_id"] = objectId;
    _data["stock_id"] = stockId;
    _data["quantity"] = quantity;
    _data["note"] = note;
    return _data;
  }

  @override
  String toString() {
    return 'CartRequest{objectType: $objectType, entityId: $entityId, objectId: $objectId, stockId: $stockId, quantity: $quantity, note: $note}';
  }
}
