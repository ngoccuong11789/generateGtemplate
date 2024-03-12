import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

/// data : [{"id":"27fde4a9-9712-42aa-bda7-478242a7086e","name":"Bakery","image":{"id":"20230927T151150525611007_d6228fd8-229b-457e-991f-c403b5a3e123_bakery","extension":".png","original_name":"bakery.png","size":5110,"type":"image/png","description":"bakery","content":null,"signature":"a5a236a47aff82f3bcf4506fa8bb194a"}},{"id":"095e32b8-f46d-40ad-8de3-3a8c236853d6","name":"Buffet","image":{"id":"20230928T003830477452165_d6228fd8-229b-457e-991f-c403b5a3e123_buffet","extension":".png","original_name":"buffet.png","size":3279,"type":"image/png","description":"buffet","content":null,"signature":"866f80e62e01b97f48a291e198b9e8ce"}},{"id":"b9ee26ad-920d-4fe3-bc28-084663d3f011","name":"Street Food","image":{"id":"20230911T183615009763081_00000000-0000-0000-0000-000000000000_streetfood","extension":".png","original_name":"street-food.png","size":5201,"type":"image/png","description":"street-food","content":null,"signature":"d6d47c32384ef2f716fab26db4e5ab25"}},{"id":"afe94734-8e7c-4cff-ad35-1a857ff2ac77","name":"Restaurant","image":{"id":"20230927T145730733570857_d6228fd8-229b-457e-991f-c403b5a3e123_restaurant","extension":".png","original_name":"restaurant.png","size":5590,"type":"image/png","description":"restaurant","content":null,"signature":"f755c74705f55c8dc6085d3bdb2322ac"}},{"id":"f5591d5b-7a59-41a1-972c-6c87741301ea","name":"Fast food","image":{"id":"20231002T231102450905908_00000000-0000-0000-0000-000000000000_istockphoto940932474612x612","extension":".jpg","original_name":"istockphoto-940932474-612x612.jpg","size":78036,"type":"image/jpeg","description":"","content":null,"signature":"00cb84f6a52d7e08f280c367560fb0e7"}},{"id":"926c57bb-c955-40ce-a273-670bfd3bf17d","name":"Night club","image":{"id":"20230927T144733967455869_d6228fd8-229b-457e-991f-c403b5a3e123_nightclub","extension":".png","original_name":"night-club.png","size":5485,"type":"image/png","description":"night-club","content":null,"signature":"45532be7a5995e15657e8fb0abb603d3"}},{"id":"947d6009-6f5c-4bb2-acb2-92b8c6370103","name":"Soup kitchen","image":{"id":"20230927T144242910024809_d6228fd8-229b-457e-991f-c403b5a3e123_soupkitchen","extension":".png","original_name":"soup-kitchen.png","size":5600,"type":"image/png","description":"soup-kitchen","content":null,"signature":"724a4bd278867f64867d43e573fc81ee"}},{"id":"9890a3f9-1c29-4736-a2f2-40b3d8e48122","name":"Pizza","image":{"id":"20230918T100205689487315_00000000-0000-0000-0000-000000000000_pizzatype","extension":".png","original_name":"pizza-type.png","size":5949,"type":"image/png","description":"PIZZA","content":null,"signature":"2ba620b1ffed6fe13fb16e14f783b3da"}},{"id":"6104e2e9-1112-47e4-a456-ca1f818d1492","name":"Japanese Food","image":{"id":"20230911T180123275197350_00000000-0000-0000-0000-000000000000_japanesefood","extension":".png","original_name":"japanese-food.png","size":2897,"type":"image/png","description":"japanese-food","content":null,"signature":"6b7e859b232837805e2c25330ddd453b"}},{"id":"92d68aba-68d5-451b-8332-a8f2fe4fc30a","name":"Pub","image":{"id":"20230928T002958707003950_d6228fd8-229b-457e-991f-c403b5a3e123_pub","extension":".png","original_name":"pub.png","size":6637,"type":"image/png","description":"pub","content":null,"signature":"4d0ec17c283246930811dcaf1019cc49"}}]
part 'category_restaurant.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class CategoryRestaurant {
  CategoryRestaurant({
      List<Category>? data,}){
    _data = data;
}

  CategoryRestaurant.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Category.fromJson(v));
      });
    }
  }
  List<Category>? _data;
CategoryRestaurant copyWith({  List<Category>? data,
}) => CategoryRestaurant(  data: data ?? _data,
);
  List<Category>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "27fde4a9-9712-42aa-bda7-478242a7086e"
/// name : "Bakery"
/// image : {"id":"20230927T151150525611007_d6228fd8-229b-457e-991f-c403b5a3e123_bakery","extension":".png","original_name":"bakery.png","size":5110,"type":"image/png","description":"bakery","content":null,"signature":"a5a236a47aff82f3bcf4506fa8bb194a"}

class Category extends Equatable {
  Category({
      String? id, 
      String? name,
      Image? image,}){
    _id = id;
    _name = name;
    _image = image;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
  String? _id;
  String? _name;
  Image? _image;
Category copyWith({  String? id,
  String? name,
  Image? image,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  String? get id => _id;
  String? get name => _name;
  Image? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    image
  ];

}

/// id : "20230927T151150525611007_d6228fd8-229b-457e-991f-c403b5a3e123_bakery"
/// extension : ".png"
/// original_name : "bakery.png"
/// size : 5110
/// type : "image/png"
/// description : "bakery"
/// content : null
/// signature : "a5a236a47aff82f3bcf4506fa8bb194a"

class Image {
  Image({
      String? id, 
      String? extension, 
      String? originalName, 
      num? size, 
      String? type, 
      String? description, 
      dynamic content, 
      String? signature,}){
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
    _signature = signature;
}

  Image.fromJson(dynamic json) {
    _id = json['id'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _content = json['content'];
    _signature = json['signature'];
  }
  String? _id;
  String? _extension;
  String? _originalName;
  num? _size;
  String? _type;
  String? _description;
  dynamic _content;
  String? _signature;
Image copyWith({  String? id,
  String? extension,
  String? originalName,
  num? size,
  String? type,
  String? description,
  dynamic content,
  String? signature,
}) => Image(  id: id ?? _id,
  extension: extension ?? _extension,
  originalName: originalName ?? _originalName,
  size: size ?? _size,
  type: type ?? _type,
  description: description ?? _description,
  content: content ?? _content,
  signature: signature ?? _signature,
);
  String? get id => _id;
  String? get extension => _extension;
  String? get originalName => _originalName;
  num? get size => _size;
  String? get type => _type;
  String? get description => _description;
  dynamic get content => _content;
  String? get signature => _signature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['content'] = _content;
    map['signature'] = _signature;
    return map;
  }

}