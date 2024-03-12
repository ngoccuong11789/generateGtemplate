import 'package:json_annotation/json_annotation.dart';

part 'Shops.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DataMyCart {
  final String? userId;
  final List<Shops>? shops;
  final int? totalItems;

  DataMyCart({this.userId, this.shops, this.totalItems});

  factory DataMyCart.fromJson(Map<String, dynamic> json) {
    return _$DataMyCartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataMyCartToJson(this);
  }

  @override
  String toString() {
    return 'DataMyCart{userId: $userId, shops: $shops, totalItems: $totalItems}';
  }

  DataMyCart copyWith({
    String? userId,
    List<Shops>? shops,
    int? totalItems,
  }) {
    return DataMyCart(
      userId: userId ?? this.userId,
      shops: shops ?? this.shops,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

/// id : "627acf70-7bdf-4d5d-895a-9361b25020ba"
/// name : null
/// avatar : null
/// shoppingCartDTOs : [{"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","stock_id":"9687f880-4259-11ee-8670-ada0fc851e94","shop_id":"627acf70-7bdf-4d5d-895a-9361b25020ba","quantity":10,"id":"41b953b0-4afd-11ee-8928-bf7d3d9f2df6","user_id":"a381cadb-2f28-4d3f-884d-893bbad2469a","product_name":"Chelsea Jersey 23/24","stock":{"id":"9687f880-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"9678dd50-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":1,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},"original_price":81800,"price":11000,"avatar":{"id":"20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea","extension":".jpg","original_name":"chelsea.jpg","type":"image/jpeg","size":104624,"description":""},"created_at":"2023-09-04T15:30:08.491","created_by":"a381cadb-2f28-4d3f-884d-893bbad2469a","updated_at":"2023-09-07T16:55:19.549","updated_by":"a381cadb-2f28-4d3f-884d-893bbad2469a","stock_detail":null,"stock_pricing_fulls":[{"id":"96772fa1-4259-11ee-8670-ada0fc851e94","name":"Color","code":"COLOR","form_id":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","html_source":"string","stock_variations":[{"id":"9677cbe0-4259-11ee-8670-ada0fc851e94","name":"Blue","code":"BLUE","order":1,"pricing_order":1,"color":"#FFFF","image":{"id":"20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea","extension":".jpg","original_name":"chelsea.jpg","size":104624,"type":"image/jpeg","description":"","signature":"bc2899f9fb35c68eecd299ebec61a4bc"},"pricing_id":null,"index_image":0}],"order":1}],"stock_fulls":[{"id":"96803050-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"9677cbe0-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":"Blue","variation_second_name":null,"quantity":100,"order_first":1,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9687f880-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"9678dd50-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":1,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9688e2e0-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9689cd40-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"967a63f0-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":3,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false}]},{"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","stock_id":"96803050-4259-11ee-8670-ada0fc851e94","shop_id":"627acf70-7bdf-4d5d-895a-9361b25020ba","quantity":10,"id":"318eaf80-4afd-11ee-8928-bf7d3d9f2df6","user_id":"a381cadb-2f28-4d3f-884d-893bbad2469a","product_name":"Chelsea Jersey 23/24","stock":{"id":"96803050-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"9677cbe0-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":"Blue","variation_second_name":null,"quantity":100,"order_first":1,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},"original_price":81800,"price":11000,"avatar":{"id":"20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea","extension":".jpg","original_name":"chelsea.jpg","type":"image/jpeg","size":104624,"description":""},"created_at":"2023-09-04T15:29:41.369","created_by":"a381cadb-2f28-4d3f-884d-893bbad2469a","updated_at":"2023-09-07T16:55:16.887","updated_by":"a381cadb-2f28-4d3f-884d-893bbad2469a","stock_detail":null,"stock_pricing_fulls":[{"id":"96772fa1-4259-11ee-8670-ada0fc851e94","name":"Color","code":"COLOR","form_id":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","html_source":"string","stock_variations":[{"id":"9677cbe0-4259-11ee-8670-ada0fc851e94","name":"Blue","code":"BLUE","order":1,"pricing_order":1,"color":"#FFFF","image":{"id":"20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea","extension":".jpg","original_name":"chelsea.jpg","size":104624,"type":"image/jpeg","description":"","signature":"bc2899f9fb35c68eecd299ebec61a4bc"},"pricing_id":null,"index_image":0}],"order":1}],"stock_fulls":[{"id":"96803050-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"9677cbe0-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":"Blue","variation_second_name":null,"quantity":100,"order_first":1,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9687f880-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"9678dd50-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":1,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9688e2e0-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9689cd40-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"967a63f0-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":3,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false}]}]

class Shops {
  Shops({
    String? id,
    String? name,
    AvatarShop? avatar,
    List<ShoppingCartDtOs>? shoppingCartDTOs,
  }) {
    _id = id;
    _name = name;
    _avatar = avatar;
    _shoppingCartDTOs = shoppingCartDTOs;
  }

  Shops.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar =
        json['avatar'] != null ? AvatarShop.fromJson(json['avatar']) : null;
    if (json['shoppingCartDTOs'] != null) {
      _shoppingCartDTOs = [];
      json['shoppingCartDTOs'].forEach((v) {
        _shoppingCartDTOs?.add(ShoppingCartDtOs.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  AvatarShop? _avatar;
  List<ShoppingCartDtOs>? _shoppingCartDTOs;
  Shops copyWith({
    String? id,
    String? name,
    AvatarShop? avatar,
    List<ShoppingCartDtOs>? shoppingCartDTOs,
  }) =>
      Shops(
        id: id ?? _id,
        name: name ?? _name,
        avatar: avatar ?? _avatar,
        shoppingCartDTOs: shoppingCartDTOs ?? _shoppingCartDTOs,
      );
  String? get id => _id;
  String? get name => _name;
  AvatarShop? get avatar => _avatar;
  List<ShoppingCartDtOs>? get shoppingCartDTOs => _shoppingCartDTOs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['avatar'] = _avatar;
    if (_shoppingCartDTOs != null) {
      map['shoppingCartDTOs'] =
          _shoppingCartDTOs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// product_id : "96772fa0-4259-11ee-8670-ada0fc851e94"
/// stock_id : "9687f880-4259-11ee-8670-ada0fc851e94"
/// shop_id : "627acf70-7bdf-4d5d-895a-9361b25020ba"
/// quantity : 10
/// id : "41b953b0-4afd-11ee-8928-bf7d3d9f2df6"
/// user_id : "a381cadb-2f28-4d3f-884d-893bbad2469a"
/// product_name : "Chelsea Jersey 23/24"
/// stock : {"id":"9687f880-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"9678dd50-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":1,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false}
/// original_price : 81800
/// price : 11000
/// avatar : {"id":"20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea","extension":".jpg","original_name":"chelsea.jpg","type":"image/jpeg","size":104624,"description":""}
/// created_at : "2023-09-04T15:30:08.491"
/// created_by : "a381cadb-2f28-4d3f-884d-893bbad2469a"
/// updated_at : "2023-09-07T16:55:19.549"
/// updated_by : "a381cadb-2f28-4d3f-884d-893bbad2469a"
/// stock_detail : null
/// stock_pricing_fulls : [{"id":"96772fa1-4259-11ee-8670-ada0fc851e94","name":"Color","code":"COLOR","form_id":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","html_source":"string","stock_variations":[{"id":"9677cbe0-4259-11ee-8670-ada0fc851e94","name":"Blue","code":"BLUE","order":1,"pricing_order":1,"color":"#FFFF","image":{"id":"20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea","extension":".jpg","original_name":"chelsea.jpg","size":104624,"type":"image/jpeg","description":"","signature":"bc2899f9fb35c68eecd299ebec61a4bc"},"pricing_id":null,"index_image":0}],"order":1}]
/// stock_fulls : [{"id":"96803050-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"9677cbe0-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":"Blue","variation_second_name":null,"quantity":100,"order_first":1,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9687f880-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"9678dd50-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":1,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9688e2e0-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"96792b70-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":2,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false},{"id":"9689cd40-4259-11ee-8670-ada0fc851e94","created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"product_id":"96772fa0-4259-11ee-8670-ada0fc851e94","variation_first_id":"96786820-4259-11ee-8670-ada0fc851e94","variation_second_id":"967a63f0-4259-11ee-8670-ada0fc851e94","variation_first_name":null,"variation_second_name":null,"quantity":100,"order_first":2,"order_second":3,"price":11,"original_price":81.8,"sku":"TDT_SK","new":false}]

class ShoppingCartDtOs {
  ShoppingCartDtOs({
    String? productId,
    String? stockId,
    String? shopId,
    num? quantity,
    String? id,
    String? userId,
    String? productName,
    Stock? stock,
    num? originalPrice,
    num? price,
    AvatarProduct? avatar,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    dynamic stockDetail,
  }) {
    _productId = productId;
    _stockId = stockId;
    _shopId = shopId;
    _quantity = quantity;
    _id = id;
    _userId = userId;
    _productName = productName;
    _stock = stock;
    _originalPrice = originalPrice;
    _price = price;
    _avatar = avatar;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _stockDetail = stockDetail;
  }

  ShoppingCartDtOs.fromJson(dynamic json) {
    _productId = json['product_id'];
    _stockId = json['stock_id'];
    _shopId = json['shop_id'];
    _quantity = json['quantity'];
    _id = json['id'];
    _userId = json['user_id'];
    _productName = json['product_name'];
    _stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
    _originalPrice = json['original_price'];
    _price = json['price'];
    _avatar =
        json['avatar'] != null ? AvatarProduct.fromJson(json['avatar']) : null;
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _stockDetail = json['stock_detail'];
  }
  String? _productId;
  String? _stockId;
  String? _shopId;
  num? _quantity;
  String? _id;
  String? _userId;
  String? _productName;
  Stock? _stock;
  num? _originalPrice;
  num? _price;
  AvatarProduct? _avatar;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  dynamic _stockDetail;
  ShoppingCartDtOs copyWith({
    String? productId,
    String? stockId,
    String? shopId,
    num? quantity,
    String? id,
    String? userId,
    String? productName,
    Stock? stock,
    num? originalPrice,
    num? price,
    AvatarProduct? avatar,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    dynamic stockDetail,
  }) =>
      ShoppingCartDtOs(
        productId: productId ?? _productId,
        stockId: stockId ?? _stockId,
        shopId: shopId ?? _shopId,
        quantity: quantity ?? _quantity,
        id: id ?? _id,
        userId: userId ?? _userId,
        productName: productName ?? _productName,
        stock: stock ?? _stock,
        originalPrice: originalPrice ?? _originalPrice,
        price: price ?? _price,
        avatar: avatar ?? _avatar,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
        stockDetail: stockDetail ?? _stockDetail,
      );
  String? get productId => _productId;
  String? get stockId => _stockId;
  String? get shopId => _shopId;
  num? get quantity => _quantity;
  String? get id => _id;
  String? get userId => _userId;
  String? get productName => _productName;
  Stock? get stock => _stock;
  num? get originalPrice => _originalPrice;
  num? get price => _price;
  AvatarProduct? get avatar => _avatar;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  dynamic get stockDetail => _stockDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['stock_id'] = _stockId;
    map['shop_id'] = _shopId;
    map['quantity'] = _quantity;
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_name'] = _productName;
    if (_stock != null) {
      map['stock'] = _stock?.toJson();
    }
    map['original_price'] = _originalPrice;
    map['price'] = _price;
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['stock_detail'] = _stockDetail;
    return map;
  }
}

class StockVariations {
  StockVariations({
    String? id,
    String? name,
    String? code,
    num? order,
    num? pricingOrder,
    String? color,
    ImageStock? image,
    dynamic pricingId,
    num? indexImage,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _order = order;
    _pricingOrder = pricingOrder;
    _color = color;
    _image = image;
    _pricingId = pricingId;
    _indexImage = indexImage;
  }

  StockVariations.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _order = json['order'];
    _pricingOrder = json['pricing_order'];
    _color = json['color'];
    _image = json['image'] != null ? ImageStock.fromJson(json['image']) : null;
    _pricingId = json['pricing_id'];
    _indexImage = json['index_image'];
  }
  String? _id;
  String? _name;
  String? _code;
  num? _order;
  num? _pricingOrder;
  String? _color;
  ImageStock? _image;
  dynamic _pricingId;
  num? _indexImage;
  StockVariations copyWith({
    String? id,
    String? name,
    String? code,
    num? order,
    num? pricingOrder,
    String? color,
    ImageStock? image,
    dynamic pricingId,
    num? indexImage,
  }) =>
      StockVariations(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        order: order ?? _order,
        pricingOrder: pricingOrder ?? _pricingOrder,
        color: color ?? _color,
        image: image ?? _image,
        pricingId: pricingId ?? _pricingId,
        indexImage: indexImage ?? _indexImage,
      );
  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  num? get order => _order;
  num? get pricingOrder => _pricingOrder;
  String? get color => _color;
  ImageStock? get image => _image;
  dynamic get pricingId => _pricingId;
  num? get indexImage => _indexImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['order'] = _order;
    map['pricing_order'] = _pricingOrder;
    map['color'] = _color;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['pricing_id'] = _pricingId;
    map['index_image'] = _indexImage;
    return map;
  }
}

/// id : "20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea"
/// extension : ".jpg"
/// original_name : "chelsea.jpg"
/// size : 104624
/// type : "image/jpeg"
/// description : ""
/// signature : "bc2899f9fb35c68eecd299ebec61a4bc"

class ImageStock {
  ImageStock({
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

  ImageStock.fromJson(dynamic json) {
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
  ImageStock copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? signature,
  }) =>
      ImageStock(
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

/// id : "20230824T151128627017751_00000000-0000-0000-0000-000000000000_chelsea"
/// extension : ".jpg"
/// original_name : "chelsea.jpg"
/// type : "image/jpeg"
/// size : 104624
/// description : ""

class AvatarShop {
  AvatarShop({
    String? id,
    String? extension,
    String? originalName,
    String? type,
    num? size,
    String? description,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _type = type;
    _size = size;
    _description = description;
  }

  AvatarShop.fromJson(dynamic json) {
    _id = json['id'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _type = json['type'];
    _size = json['size'];
    _description = json['description'];
  }
  String? _id;
  String? _extension;
  String? _originalName;
  String? _type;
  num? _size;
  String? _description;
  AvatarShop copyWith({
    String? id,
    String? extension,
    String? originalName,
    String? type,
    num? size,
    String? description,
  }) =>
      AvatarShop(
        id: id ?? _id,
        extension: extension ?? _extension,
        originalName: originalName ?? _originalName,
        type: type ?? _type,
        size: size ?? _size,
        description: description ?? _description,
      );
  String? get id => _id;
  String? get extension => _extension;
  String? get originalName => _originalName;
  String? get type => _type;
  num? get size => _size;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['type'] = _type;
    map['size'] = _size;
    map['description'] = _description;
    return map;
  }
}

class AvatarProduct {
  AvatarProduct({
    String? id,
    String? extension,
    String? originalName,
    String? type,
    num? size,
    String? description,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _type = type;
    _size = size;
    _description = description;
  }

  AvatarProduct.fromJson(dynamic json) {
    _id = json['id'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _type = json['type'];
    _size = json['size'];
    _description = json['description'];
  }
  String? _id;
  String? _extension;
  String? _originalName;
  String? _type;
  num? _size;
  String? _description;
  AvatarProduct copyWith({
    String? id,
    String? extension,
    String? originalName,
    String? type,
    num? size,
    String? description,
  }) =>
      AvatarProduct(
        id: id ?? _id,
        extension: extension ?? _extension,
        originalName: originalName ?? _originalName,
        type: type ?? _type,
        size: size ?? _size,
        description: description ?? _description,
      );
  String? get id => _id;
  String? get extension => _extension;
  String? get originalName => _originalName;
  String? get type => _type;
  num? get size => _size;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['type'] = _type;
    map['size'] = _size;
    map['description'] = _description;
    return map;
  }
}

/// id : "9687f880-4259-11ee-8670-ada0fc851e94"
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null
/// product_id : "96772fa0-4259-11ee-8670-ada0fc851e94"
/// variation_first_id : "96786820-4259-11ee-8670-ada0fc851e94"
/// variation_second_id : "9678dd50-4259-11ee-8670-ada0fc851e94"
/// variation_first_name : null
/// variation_second_name : null
/// quantity : 100
/// order_first : 2
/// order_second : 1
/// price : 11
/// original_price : 81.8
/// sku : "TDT_SK"
/// new : false

class Stock {
  Stock({
    String? id,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
    String? productId,
    String? variationFirstId,
    String? variationSecondId,
    dynamic variationFirstName,
    dynamic variationSecondName,
    num? quantity,
    num? orderFirst,
    num? orderSecond,
    num? price,
    num? originalPrice,
    String? sku,
    bool? newStock,
  }) {
    _id = id;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _productId = productId;
    _variationFirstId = variationFirstId;
    _variationSecondId = variationSecondId;
    _variationFirstName = variationFirstName;
    _variationSecondName = variationSecondName;
    _quantity = quantity;
    _orderFirst = orderFirst;
    _orderSecond = orderSecond;
    _price = price;
    _originalPrice = originalPrice;
    _sku = sku;
    _new = newStock;
  }

  Stock.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _productId = json['product_id'];
    _variationFirstId = json['variation_first_id'];
    _variationSecondId = json['variation_second_id'];
    _variationFirstName = json['variation_first_name'];
    _variationSecondName = json['variation_second_name'];
    _quantity = json['quantity'];
    _orderFirst = json['order_first'];
    _orderSecond = json['order_second'];
    _price = json['price'];
    _originalPrice = json['original_price'];
    _sku = json['sku'];
    _new = json['new'];
  }
  String? _id;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  String? _productId;
  String? _variationFirstId;
  String? _variationSecondId;
  dynamic _variationFirstName;
  dynamic _variationSecondName;
  num? _quantity;
  num? _orderFirst;
  num? _orderSecond;
  num? _price;
  num? _originalPrice;
  String? _sku;
  bool? _new;
  Stock copyWith({
    String? id,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
    String? productId,
    String? variationFirstId,
    String? variationSecondId,
    dynamic variationFirstName,
    dynamic variationSecondName,
    num? quantity,
    num? orderFirst,
    num? orderSecond,
    num? price,
    num? originalPrice,
    String? sku,
    bool? newStock,
  }) =>
      Stock(
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
        productId: productId ?? _productId,
        variationFirstId: variationFirstId ?? _variationFirstId,
        variationSecondId: variationSecondId ?? _variationSecondId,
        variationFirstName: variationFirstName ?? _variationFirstName,
        variationSecondName: variationSecondName ?? _variationSecondName,
        quantity: quantity ?? _quantity,
        orderFirst: orderFirst ?? _orderFirst,
        orderSecond: orderSecond ?? _orderSecond,
        price: price ?? _price,
        originalPrice: originalPrice ?? _originalPrice,
        sku: sku ?? _sku,
        newStock: newStock ?? _new,
      );
  String? get id => _id;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get productId => _productId;
  String? get variationFirstId => _variationFirstId;
  String? get variationSecondId => _variationSecondId;
  dynamic get variationFirstName => _variationFirstName;
  dynamic get variationSecondName => _variationSecondName;
  num? get quantity => _quantity;
  num? get orderFirst => _orderFirst;
  num? get orderSecond => _orderSecond;
  num? get price => _price;
  num? get originalPrice => _originalPrice;
  String? get sku => _sku;
  bool? get newStock => _new;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['product_id'] = _productId;
    map['variation_first_id'] = _variationFirstId;
    map['variation_second_id'] = _variationSecondId;
    map['variation_first_name'] = _variationFirstName;
    map['variation_second_name'] = _variationSecondName;
    map['quantity'] = _quantity;
    map['order_first'] = _orderFirst;
    map['order_second'] = _orderSecond;
    map['price'] = _price;
    map['original_price'] = _originalPrice;
    map['sku'] = _sku;
    map['new'] = _new;
    return map;
  }
}
