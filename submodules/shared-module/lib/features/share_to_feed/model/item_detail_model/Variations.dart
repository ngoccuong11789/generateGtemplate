import 'Image.dart';

class Variations {
  Variations({
      this.id, 
      this.name, 
      this.code, 
      this.order, 
      this.color, 
      this.image, 
      this.pricingId,});

  Variations.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    order = json['order'];
    color = json['color'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    pricingId = json['pricing_id'];
  }
  String? id;
  String? name;
  String? code;
  num? order;
  String? color;
  Image? image;
  String? pricingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['order'] = order;
    map['color'] = color;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['pricing_id'] = pricingId;
    return map;
  }

}