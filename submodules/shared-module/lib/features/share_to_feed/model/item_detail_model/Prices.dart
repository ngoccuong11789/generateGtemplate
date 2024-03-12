import 'Variations.dart';

class Prices {
  Prices({
      this.id, 
      this.name, 
      this.code, 
      this.variations, 
      this.htmlSource, 
      this.order, 
      this.isContainsImage,});

  Prices.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(Variations.fromJson(v));
      });
    }
    htmlSource = json['html_source'];
    order = json['order'];
    isContainsImage = json['is_contains_image'];
  }
  String? id;
  String? name;
  String? code;
  List<Variations>? variations;
  String? htmlSource;
  num? order;
  bool? isContainsImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    if (variations != null) {
      map['variations'] = variations?.map((v) => v.toJson()).toList();
    }
    map['html_source'] = htmlSource;
    map['order'] = order;
    map['is_contains_image'] = isContainsImage;
    return map;
  }
}