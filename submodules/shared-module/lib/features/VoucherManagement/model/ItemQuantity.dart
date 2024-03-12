class ItemQuantity {
  ItemQuantity({
    required this.code,
    required this.quantity,
  });

  String code;
  int quantity;

  ItemQuantity.fromJson(dynamic json)
      : code = json['code'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['quantity'] = quantity;
    return map;
  }
}
