import 'dart:convert';

/// page : 0
/// pageSize : 10
/// totalElement : 3
/// data : [{"id":"e40b3ddc-cb55-428e-846c-5aa433268ab9","name":"Korean Food","image":{"id":"20230908T083338172960794_b788e562-2704-4fc6-85ed-a865c6a04c4a_koreanfood","extension":".png","original_name":"korean-food.png","size":6201,"type":"image/png","description":"korean-food","signature":"0f412be0cb06b176e8f35be1f2d3a48d"}},{"id":"0b915be2-6a1e-410e-bc98-d66e26be62dc","name":"Street Food","image":{"id":"20230908T082300809897248_b788e562-2704-4fc6-85ed-a865c6a04c4a_streetfood","extension":".png","original_name":"street-food.png","size":5201,"type":"image/png","description":"street-food","signature":"b0232b72797924487ffd51589ed0bb0d"}},{"id":"d6f68703-dc05-4102-b4cf-1a4873de9338","name":"Japanese Food","image":{"id":"20230908T082000049978649_b788e562-2704-4fc6-85ed-a865c6a04c4a_japanesefood","extension":".png","original_name":"japanese-food.png","size":2897,"type":"image/png","description":"japanese-food","signature":"bfae246f775b160a4716688acb85a35f"}}]

RestaurantType restaurantTypeFromJson(String str) =>
    RestaurantType.fromJson(json.decode(str));
String restaurantTypeToJson(RestaurantType data) => json.encode(data.toJson());

class RestaurantType {
  RestaurantType({
    num? page,
    num? pageSize,
    num? totalElement,
    List<Data>? data,
  }) {
    _page = page;
    _pageSize = pageSize;
    _totalElement = totalElement;
    _data = data;
  }

  RestaurantType.fromJson(dynamic json) {
    _page = json['page'];
    _pageSize = json['pageSize'];
    _totalElement = json['totalElement'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _page;
  num? _pageSize;
  num? _totalElement;
  List<Data>? _data;
  RestaurantType copyWith({
    num? page,
    num? pageSize,
    num? totalElement,
    List<Data>? data,
  }) =>
      RestaurantType(
        page: page ?? _page,
        pageSize: pageSize ?? _pageSize,
        totalElement: totalElement ?? _totalElement,
        data: data ?? _data,
      );
  num? get page => _page;
  num? get pageSize => _pageSize;
  num? get totalElement => _totalElement;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['pageSize'] = _pageSize;
    map['totalElement'] = _totalElement;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "e40b3ddc-cb55-428e-846c-5aa433268ab9"
/// name : "Korean Food"
/// image : {"id":"20230908T083338172960794_b788e562-2704-4fc6-85ed-a865c6a04c4a_koreanfood","extension":".png","original_name":"korean-food.png","size":6201,"type":"image/png","description":"korean-food","signature":"0f412be0cb06b176e8f35be1f2d3a48d"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? name,
    Image? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
  String? _id;
  String? _name;
  Image? _image;
  Data copyWith({
    String? id,
    String? name,
    Image? image,
  }) =>
      Data(
        id: id ?? _id,
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
}

/// id : "20230908T083338172960794_b788e562-2704-4fc6-85ed-a865c6a04c4a_koreanfood"
/// extension : ".png"
/// original_name : "korean-food.png"
/// size : 6201
/// type : "image/png"
/// description : "korean-food"
/// signature : "0f412be0cb06b176e8f35be1f2d3a48d"

Image imageFromJson(String str) => Image.fromJson(json.decode(str));
String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  Image({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? signature,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _signature = signature;
  }

  Image.fromJson(dynamic json) {
    _id = json['id'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _signature = json['signature'];
  }
  String? _id;
  String? _extension;
  String? _originalName;
  num? _size;
  String? _type;
  String? _description;
  String? _signature;
  Image copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? signature,
  }) =>
      Image(
        id: id ?? _id,
        extension: extension ?? _extension,
        originalName: originalName ?? _originalName,
        size: size ?? _size,
        type: type ?? _type,
        description: description ?? _description,
        signature: signature ?? _signature,
      );
  String? get id => _id;
  String? get extension => _extension;
  String? get originalName => _originalName;
  num? get size => _size;
  String? get type => _type;
  String? get description => _description;
  String? get signature => _signature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['signature'] = _signature;
    return map;
  }
}
