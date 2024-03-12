import 'dart:convert';

import 'package:shared_module/features/share_to_feed/model/ProductDetail.dart';

/// id : "017ccec6-e5a3-47e1-a27f-f4b380b5502a"
/// name : "Grand Blue"
/// avatar : {"id":"20230911T153937662299707_00000000-0000-0000-0000-000000000000_FixedRatioImage","extension":".jfif","original_name":"jp-avatar.jfif","size":6899,"type":"image/jpeg","description":"jp-avatar","content":null,"signature":"fe50114193ee7c0a679bbaf258e8780e"}
/// background : {"id":"20230911T153937662299707_00000000-0000-0000-0000-000000000000_FixedRatioImage","extension":".jfif","original_name":"jp-bg.jfif","size":14216,"type":"image/jpeg","description":"jp-bg","content":null,"signature":"284f79de08aceff99c7945484b7ebb57"}
/// followers : 0
/// total_foods : 1
/// sum_reviews : 0
/// rating : 0
/// restaurant_status_id : "6f6cde00-4d67-11ee-bd6b-8b357fdc2e0c"
/// restaurant_status : {"id":"6f6cde00-4d67-11ee-bd6b-8b357fdc2e0c","name":"Open","code":"OPEN","from_at":"2023-09-11T15:40:20.325","to_at":"2023-09-11T15:40:20.325","created_at":"2023-09-07T17:15:14.233","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-07T17:15:14.233","updated_by":"00000000-0000-0000-0000-000000000000"}
/// created_at : "2023-09-11T15:40:20.325"
/// created_by : "4d3772ba-4f3f-4bb4-90b4-b2d6739590eb"
/// updated_at : "2023-09-12T07:55:41.383"
/// updated_by : "00000000-0000-0000-0000-000000000000"
/// restaurant_categories : [{"id":"bb20bf49-4754-4d0e-a86e-00ebd16cdf82","name":"Sushi","order":1,"restaurant_sections":[{"id":"1875d360-5107-11ee-b0c3-6f94e291a0da","restaurant_category_id":"bb20bf49-4754-4d0e-a86e-00ebd16cdf82","restaurant_dec_collection_id":"bae58bb0-509c-11ee-a827-3589652ccf1c","restaurant_decoration_collection":{"id":"bae58bb0-509c-11ee-a827-3589652ccf1c","name":"Image banner","code":"BANNER","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":1,"created_at":"2023-09-11T19:14:22.312","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:14:22.312","updated_by":"00000000-0000-0000-0000-000000000000"},"order":0,"contents":[{"id":"20230912T073636381808192_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood2","extension":".jpg","original_name":"japan_food_2.jpg","size":60890,"type":"image/webp","description":"","content":null,"signature":"1a8942ca8294f415369c38417f8d06ed"}],"food_ids":null,"category_ids":null,"max_row":0,"is_food_list":false,"is_category_list":false},{"id":"1872c621-5107-11ee-b0c3-6f94e291a0da","restaurant_category_id":"bb20bf49-4754-4d0e-a86e-00ebd16cdf82","restaurant_dec_collection_id":"8ecc9830-509b-11ee-a827-3589652ccf1c","restaurant_decoration_collection":{"id":"8ecc9830-509b-11ee-a827-3589652ccf1c","name":"Image with text","code":"IWT","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":0,"created_at":"2023-09-11T19:05:56.487","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:05:56.487","updated_by":"00000000-0000-0000-0000-000000000000"},"order":1,"contents":[{"id":"20230912T073619360201136_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood1","extension":".jpg","original_name":"japan_food_1.jpg","size":44606,"type":"image/webp","description":"","content":"Japanese Traditional Cuisine: Sushi","signature":"dd3f0d4848c5079907ba35fb168d4241"}],"food_ids":null,"category_ids":null,"max_row":0,"is_food_list":false,"is_category_list":false}]},{"id":"ed31fefd-37c0-4008-8e0b-06f238f79172","name":"Ramen","order":2,"restaurant_sections":[{"id":"1881e150-5107-11ee-b0c3-6f94e291a0da","restaurant_category_id":"ed31fefd-37c0-4008-8e0b-06f238f79172","restaurant_dec_collection_id":"e695eed0-509c-11ee-a827-3589652ccf1c","restaurant_decoration_collection":{"id":"e695eed0-509c-11ee-a827-3589652ccf1c","name":"Image with multiple slice","code":"MULTIPLESLIDESHOW","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":2,"created_at":"2023-09-11T19:15:30.888","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:15:30.888","updated_by":"00000000-0000-0000-0000-000000000000"},"order":0,"contents":[{"id":"20230912T073653810144878_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood3","extension":".jpg","original_name":"japan_food_3.jpg","size":368433,"type":"image/jpeg","description":"","content":null,"signature":"1a42417100145d4c72de57d921bcdb51"},{"id":"20230912T073713697019024_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood4","extension":".jpg","original_name":"japan_food_4.jpg","size":11848,"type":"image/jpeg","description":"","content":null,"signature":"1e75223012945c75be9251cbefb85686"}],"food_ids":null,"category_ids":null,"max_row":0,"is_food_list":false,"is_category_list":false},{"id":"187ed411-5107-11ee-b0c3-6f94e291a0da","restaurant_category_id":"ed31fefd-37c0-4008-8e0b-06f238f79172","restaurant_dec_collection_id":"8ecc9830-509b-11ee-a827-3589652ccf1c","restaurant_decoration_collection":{"id":"8ecc9830-509b-11ee-a827-3589652ccf1c","name":"Image with text","code":"IWT","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":0,"created_at":"2023-09-11T19:05:56.487","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:05:56.487","updated_by":"00000000-0000-0000-0000-000000000000"},"order":1,"contents":[{"id":"20230912T073653810144878_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood3","extension":".jpg","original_name":"japan_food_3.jpg","size":368433,"type":"image/jpeg","description":"","content":"The best place Ramen for you","signature":"1a42417100145d4c72de57d921bcdb51"}],"food_ids":null,"category_ids":null,"max_row":0,"is_food_list":false,"is_category_list":false}]}]
/// open_time : "2023-09-07T09:00:00"
/// closed_time : "2023-09-07T18:00:00"
/// food_type_ids : ["0b1ed700-4d35-11ee-b460-2dcfd19b6a25"]
/// food_types : ["Rice"]
/// restaurant_type_ids : ["6104e2e9-1112-47e4-a456-ca1f818d1492"]
/// restaurant_types : ["Japanese Food"]
/// country : {"id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","code":"viet_nam","name":"Việt Nam","longitude":0,"latitude":0}
/// province : {"id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","code":"thanh_pho_ho_chi_minh","name":"Thành phố Hồ Chí Minh","longitude":106.6297,"latitude":10.8231}
/// district : {"id":"83f2b672-495c-484d-9280-7ee52e9f3758","code":"quan_binh_tan","name":"Bình Tân","longitude":106.6039,"latitude":10.7653}
/// ward : {"id":"a6c4a86b-aa95-4ef7-b288-1dab9db82d2a","code":"phuong_binh_hung_hoa","name":"Bình Hưng Hòa","longitude":106.6026,"latitude":10.8027}
/// street : "đường số 11"
/// longitude : 106.6026
/// latitude : 10.8027

RestaurantDetail restaurantDetailFromJson(String str) =>
    RestaurantDetail.fromJson(json.decode(str));
String restaurantDetailToJson(RestaurantDetail data) =>
    json.encode(data.toJson());

class RestaurantDetail {
  RestaurantDetail({
    String? id,
    String? name,
    Avatar? avatar,
    Background? background,
    num? followers,
    num? totalFoods,
    num? sumReviews,
    List<Reviews>? reviews,
    num? rating,
    String? restaurantStatusId,
    RestaurantStatus? restaurantStatus,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    List<RestaurantCategories>? restaurantCategories,
    String? openTime,
    String? closedTime,
    List<String>? foodTypeIds,
    List<String>? foodTypes,
    List<String>? restaurantTypeIds,
    List<String>? restaurantTypes,
    Country? country,
    Province? province,
    District? district,
    Ward? ward,
    String? street,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _name = name;
    _avatar = avatar;
    _background = background;
    _followers = followers;
    _totalFoods = totalFoods;
    _sumReviews = sumReviews;
    _reviews = reviews;
    _rating = rating;
    _restaurantStatusId = restaurantStatusId;
    _restaurantStatus = restaurantStatus;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _restaurantCategories = restaurantCategories;
    _openTime = openTime;
    _closedTime = closedTime;
    _foodTypeIds = foodTypeIds;
    _foodTypes = foodTypes;
    _restaurantTypeIds = restaurantTypeIds;
    _restaurantTypes = restaurantTypes;
    _country = country;
    _province = province;
    _district = district;
    _ward = ward;
    _street = street;
    _longitude = longitude;
    _latitude = latitude;
  }

  RestaurantDetail.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    _background = json['background'] != null
        ? Background.fromJson(json['background'])
        : null;
    _followers = json['followers'];
    _totalFoods = json['total_foods'];
    _sumReviews = json['sum_reviews'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _rating = json['rating'];
    _restaurantStatusId = json['restaurant_status_id'];
    _restaurantStatus = json['restaurant_status'] != null
        ? RestaurantStatus.fromJson(json['restaurant_status'])
        : null;
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    if (json['restaurant_categories'] != null) {
      _restaurantCategories = [];
      json['restaurant_categories'].forEach((v) {
        _restaurantCategories?.add(RestaurantCategories.fromJson(v));
      });
    }
    _openTime = json['open_time'];
    _closedTime = json['closed_time'];
    _foodTypeIds = json['food_type_ids'] != null
        ? json['food_type_ids'].cast<String>()
        : [];
    _foodTypes =
        json['food_types'] != null ? json['food_types'].cast<String>() : [];
    _restaurantTypeIds = json['restaurant_type_ids'] != null
        ? json['restaurant_type_ids'].cast<String>()
        : [];
    _restaurantTypes = json['restaurant_types'] != null
        ? json['restaurant_types'].cast<String>()
        : [];
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    _province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    _district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    _ward = json['ward'] != null ? Ward.fromJson(json['ward']) : null;
    _street = json['street'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _name;
  Avatar? _avatar;
  Background? _background;
  num? _followers;
  num? _totalFoods;
  num? _sumReviews;
  List<Reviews>? _reviews;
  num? _rating;
  String? _restaurantStatusId;
  RestaurantStatus? _restaurantStatus;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  List<RestaurantCategories>? _restaurantCategories;
  String? _openTime;
  String? _closedTime;
  List<String>? _foodTypeIds;
  List<String>? _foodTypes;
  List<String>? _restaurantTypeIds;
  List<String>? _restaurantTypes;
  Country? _country;
  Province? _province;
  District? _district;
  Ward? _ward;
  String? _street;
  num? _longitude;
  num? _latitude;
  RestaurantDetail copyWith({
    String? id,
    String? name,
    Avatar? avatar,
    Background? background,
    num? followers,
    num? totalFoods,
    num? sumReviews,
    List<Reviews>? reviews,
    num? rating,
    String? restaurantStatusId,
    RestaurantStatus? restaurantStatus,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    List<RestaurantCategories>? restaurantCategories,
    String? openTime,
    String? closedTime,
    List<String>? foodTypeIds,
    List<String>? foodTypes,
    List<String>? restaurantTypeIds,
    List<String>? restaurantTypes,
    Country? country,
    Province? province,
    District? district,
    Ward? ward,
    String? street,
    num? longitude,
    num? latitude,
  }) =>
      RestaurantDetail(
        id: id ?? _id,
        name: name ?? _name,
        avatar: avatar ?? _avatar,
        background: background ?? _background,
        followers: followers ?? _followers,
        totalFoods: totalFoods ?? _totalFoods,
        sumReviews: sumReviews ?? _sumReviews,
        reviews: reviews ?? _reviews,
        rating: rating ?? _rating,
        restaurantStatusId: restaurantStatusId ?? _restaurantStatusId,
        restaurantStatus: restaurantStatus ?? _restaurantStatus,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
        restaurantCategories: restaurantCategories ?? _restaurantCategories,
        openTime: openTime ?? _openTime,
        closedTime: closedTime ?? _closedTime,
        foodTypeIds: foodTypeIds ?? _foodTypeIds,
        foodTypes: foodTypes ?? _foodTypes,
        restaurantTypeIds: restaurantTypeIds ?? _restaurantTypeIds,
        restaurantTypes: restaurantTypes ?? _restaurantTypes,
        country: country ?? _country,
        province: province ?? _province,
        district: district ?? _district,
        ward: ward ?? _ward,
        street: street ?? _street,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
      );
  String? get id => _id;
  String? get name => _name;
  Avatar? get avatar => _avatar;
  Background? get background => _background;
  num? get followers => _followers;
  num? get totalFoods => _totalFoods;
  num? get sumReviews => _sumReviews;
  List<Reviews>? get reviews => _reviews;
  num? get rating => _rating;
  String? get restaurantStatusId => _restaurantStatusId;
  RestaurantStatus? get restaurantStatus => _restaurantStatus;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  List<RestaurantCategories>? get restaurantCategories => _restaurantCategories;
  String? get openTime => _openTime;
  String? get closedTime => _closedTime;
  List<String>? get foodTypeIds => _foodTypeIds;
  List<String>? get foodTypes => _foodTypes;
  List<String>? get restaurantTypeIds => _restaurantTypeIds;
  List<String>? get restaurantTypes => _restaurantTypes;
  Country? get country => _country;
  Province? get province => _province;
  District? get district => _district;
  Ward? get ward => _ward;
  String? get street => _street;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    if (_background != null) {
      map['background'] = _background?.toJson();
    }
    map['followers'] = _followers;
    map['total_foods'] = _totalFoods;
    map['sum_reviews'] = _sumReviews;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['rating'] = _rating;
    map['restaurant_status_id'] = _restaurantStatusId;
    if (_restaurantStatus != null) {
      map['restaurant_status'] = _restaurantStatus?.toJson();
    }
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    if (_restaurantCategories != null) {
      map['restaurant_categories'] =
          _restaurantCategories?.map((v) => v.toJson()).toList();
    }
    map['open_time'] = _openTime;
    map['closed_time'] = _closedTime;
    map['food_type_ids'] = _foodTypeIds;
    map['food_types'] = _foodTypes;
    map['restaurant_type_ids'] = _restaurantTypeIds;
    map['restaurant_types'] = _restaurantTypes;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_province != null) {
      map['province'] = _province?.toJson();
    }
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    if (_ward != null) {
      map['ward'] = _ward?.toJson();
    }
    map['street'] = _street;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}

/// id : "a6c4a86b-aa95-4ef7-b288-1dab9db82d2a"
/// code : "phuong_binh_hung_hoa"
/// name : "Bình Hưng Hòa"
/// longitude : 106.6026
/// latitude : 10.8027

Ward wardFromJson(String str) => Ward.fromJson(json.decode(str));
String wardToJson(Ward data) => json.encode(data.toJson());

class Ward {
  Ward({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  Ward.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
  Ward copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      Ward(
        id: id ?? _id,
        code: code ?? _code,
        name: name ?? _name,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
      );
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}

/// id : "83f2b672-495c-484d-9280-7ee52e9f3758"
/// code : "quan_binh_tan"
/// name : "Bình Tân"
/// longitude : 106.6039
/// latitude : 10.7653

District districtFromJson(String str) => District.fromJson(json.decode(str));
String districtToJson(District data) => json.encode(data.toJson());

class District {
  District({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  District.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
  District copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      District(
        id: id ?? _id,
        code: code ?? _code,
        name: name ?? _name,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
      );
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}

/// id : "75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8"
/// code : "thanh_pho_ho_chi_minh"
/// name : "Thành phố Hồ Chí Minh"
/// longitude : 106.6297
/// latitude : 10.8231

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));
String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  Province.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
  Province copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      Province(
        id: id ?? _id,
        code: code ?? _code,
        name: name ?? _name,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
      );
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}

/// id : "1e5effa4-c844-48ee-a7b7-3f3c62ffc883"
/// code : "viet_nam"
/// name : "Việt Nam"
/// longitude : 0
/// latitude : 0

Country countryFromJson(String str) => Country.fromJson(json.decode(str));
String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _longitude = longitude;
    _latitude = latitude;
  }

  Country.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _code;
  String? _name;
  num? _longitude;
  num? _latitude;
  Country copyWith({
    String? id,
    String? code,
    String? name,
    num? longitude,
    num? latitude,
  }) =>
      Country(
        id: id ?? _id,
        code: code ?? _code,
        name: name ?? _name,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
      );
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}

/// id : "bb20bf49-4754-4d0e-a86e-00ebd16cdf82"
/// name : "Sushi"
/// order : 1
/// restaurant_sections : [{"id":"1875d360-5107-11ee-b0c3-6f94e291a0da","restaurant_category_id":"bb20bf49-4754-4d0e-a86e-00ebd16cdf82","restaurant_dec_collection_id":"bae58bb0-509c-11ee-a827-3589652ccf1c","restaurant_decoration_collection":{"id":"bae58bb0-509c-11ee-a827-3589652ccf1c","name":"Image banner","code":"BANNER","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":1,"created_at":"2023-09-11T19:14:22.312","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:14:22.312","updated_by":"00000000-0000-0000-0000-000000000000"},"order":0,"contents":[{"id":"20230912T073636381808192_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood2","extension":".jpg","original_name":"japan_food_2.jpg","size":60890,"type":"image/webp","description":"","content":null,"signature":"1a8942ca8294f415369c38417f8d06ed"}],"food_ids":null,"category_ids":null,"max_row":0,"is_food_list":false,"is_category_list":false},{"id":"1872c621-5107-11ee-b0c3-6f94e291a0da","restaurant_category_id":"bb20bf49-4754-4d0e-a86e-00ebd16cdf82","restaurant_dec_collection_id":"8ecc9830-509b-11ee-a827-3589652ccf1c","restaurant_decoration_collection":{"id":"8ecc9830-509b-11ee-a827-3589652ccf1c","name":"Image with text","code":"IWT","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":0,"created_at":"2023-09-11T19:05:56.487","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:05:56.487","updated_by":"00000000-0000-0000-0000-000000000000"},"order":1,"contents":[{"id":"20230912T073619360201136_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood1","extension":".jpg","original_name":"japan_food_1.jpg","size":44606,"type":"image/webp","description":"","content":"Japanese Traditional Cuisine: Sushi","signature":"dd3f0d4848c5079907ba35fb168d4241"}],"food_ids":null,"category_ids":null,"max_row":0,"is_food_list":false,"is_category_list":false}]

RestaurantCategories restaurantCategoriesFromJson(String str) =>
    RestaurantCategories.fromJson(json.decode(str));
String restaurantCategoriesToJson(RestaurantCategories data) =>
    json.encode(data.toJson());

class RestaurantCategories {
  RestaurantCategories({
    String? id,
    String? name,
    num? order,
    List<RestaurantSections>? restaurantSections,
  }) {
    _id = id;
    _name = name;
    _order = order;
    _restaurantSections = restaurantSections;
  }

  RestaurantCategories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    if (json['restaurant_sections'] != null) {
      _restaurantSections = [];
      json['restaurant_sections'].forEach((v) {
        _restaurantSections?.add(RestaurantSections.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  num? _order;
  List<RestaurantSections>? _restaurantSections;
  RestaurantCategories copyWith({
    String? id,
    String? name,
    num? order,
    List<RestaurantSections>? restaurantSections,
  }) =>
      RestaurantCategories(
        id: id ?? _id,
        name: name ?? _name,
        order: order ?? _order,
        restaurantSections: restaurantSections ?? _restaurantSections,
      );
  String? get id => _id;
  String? get name => _name;
  num? get order => _order;
  List<RestaurantSections>? get restaurantSections => _restaurantSections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['order'] = _order;
    if (_restaurantSections != null) {
      map['restaurant_sections'] =
          _restaurantSections?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1875d360-5107-11ee-b0c3-6f94e291a0da"
/// restaurant_category_id : "bb20bf49-4754-4d0e-a86e-00ebd16cdf82"
/// restaurant_dec_collection_id : "bae58bb0-509c-11ee-a827-3589652ccf1c"
/// restaurant_decoration_collection : {"id":"bae58bb0-509c-11ee-a827-3589652ccf1c","name":"Image banner","code":"BANNER","restaurant_dec_category_id":"a0322060-ff7f-4c4a-90fc-cd36960ead44","image":{"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null},"order":1,"created_at":"2023-09-11T19:14:22.312","created_by":"00000000-0000-0000-0000-000000000000","updated_at":"2023-09-11T19:14:22.312","updated_by":"00000000-0000-0000-0000-000000000000"}
/// order : 0
/// contents : [{"id":"20230912T073636381808192_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood2","extension":".jpg","original_name":"japan_food_2.jpg","size":60890,"type":"image/webp","description":"","content":null,"signature":"1a8942ca8294f415369c38417f8d06ed"}]
/// food_ids : null
/// category_ids : null
/// max_row : 0
/// is_food_list : false
/// is_category_list : false

RestaurantSections restaurantSectionsFromJson(String str) =>
    RestaurantSections.fromJson(json.decode(str));
String restaurantSectionsToJson(RestaurantSections data) =>
    json.encode(data.toJson());

class RestaurantSections {
  RestaurantSections({
    String? id,
    String? restaurantCategoryId,
    String? restaurantDecCollectionId,
    RestaurantDecorationCollection? restaurantDecorationCollection,
    num? order,
    List<Contents>? contents,
    dynamic foodIds,
    dynamic categoryIds,
    num? maxRow,
    bool? isFoodList,
    bool? isCategoryList,
  }) {
    _id = id;
    _restaurantCategoryId = restaurantCategoryId;
    _restaurantDecCollectionId = restaurantDecCollectionId;
    _restaurantDecorationCollection = restaurantDecorationCollection;
    _order = order;
    _contents = contents;
    _foodIds = foodIds;
    _categoryIds = categoryIds;
    _maxRow = maxRow;
    _isFoodList = isFoodList;
    _isCategoryList = isCategoryList;
  }

  RestaurantSections.fromJson(dynamic json) {
    _id = json['id'];
    _restaurantCategoryId = json['restaurant_category_id'];
    _restaurantDecCollectionId = json['restaurant_dec_collection_id'];
    _restaurantDecorationCollection =
        json['restaurant_decoration_collection'] != null
            ? RestaurantDecorationCollection.fromJson(
                json['restaurant_decoration_collection'])
            : null;
    _order = json['order'];
    if (json['contents'] != null) {
      _contents = [];
      json['contents'].forEach((v) {
        _contents?.add(Contents.fromJson(v));
      });
    }
    _foodIds = json['food_ids'];
    _categoryIds = json['category_ids'];
    _maxRow = json['max_row'];
    _isFoodList = json['is_food_list'];
    _isCategoryList = json['is_category_list'];
  }
  String? _id;
  String? _restaurantCategoryId;
  String? _restaurantDecCollectionId;
  RestaurantDecorationCollection? _restaurantDecorationCollection;
  num? _order;
  List<Contents>? _contents;
  dynamic _foodIds;
  dynamic _categoryIds;
  num? _maxRow;
  bool? _isFoodList;
  bool? _isCategoryList;
  RestaurantSections copyWith({
    String? id,
    String? restaurantCategoryId,
    String? restaurantDecCollectionId,
    RestaurantDecorationCollection? restaurantDecorationCollection,
    num? order,
    List<Contents>? contents,
    dynamic foodIds,
    dynamic categoryIds,
    num? maxRow,
    bool? isFoodList,
    bool? isCategoryList,
  }) =>
      RestaurantSections(
        id: id ?? _id,
        restaurantCategoryId: restaurantCategoryId ?? _restaurantCategoryId,
        restaurantDecCollectionId:
            restaurantDecCollectionId ?? _restaurantDecCollectionId,
        restaurantDecorationCollection:
            restaurantDecorationCollection ?? _restaurantDecorationCollection,
        order: order ?? _order,
        contents: contents ?? _contents,
        foodIds: foodIds ?? _foodIds,
        categoryIds: categoryIds ?? _categoryIds,
        maxRow: maxRow ?? _maxRow,
        isFoodList: isFoodList ?? _isFoodList,
        isCategoryList: isCategoryList ?? _isCategoryList,
      );
  String? get id => _id;
  String? get restaurantCategoryId => _restaurantCategoryId;
  String? get restaurantDecCollectionId => _restaurantDecCollectionId;
  RestaurantDecorationCollection? get restaurantDecorationCollection =>
      _restaurantDecorationCollection;
  num? get order => _order;
  List<Contents>? get contents => _contents;
  dynamic get foodIds => _foodIds;
  dynamic get categoryIds => _categoryIds;
  num? get maxRow => _maxRow;
  bool? get isFoodList => _isFoodList;
  bool? get isCategoryList => _isCategoryList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['restaurant_category_id'] = _restaurantCategoryId;
    map['restaurant_dec_collection_id'] = _restaurantDecCollectionId;
    if (_restaurantDecorationCollection != null) {
      map['restaurant_decoration_collection'] =
          _restaurantDecorationCollection?.toJson();
    }
    map['order'] = _order;
    if (_contents != null) {
      map['contents'] = _contents?.map((v) => v.toJson()).toList();
    }
    map['food_ids'] = _foodIds;
    map['category_ids'] = _categoryIds;
    map['max_row'] = _maxRow;
    map['is_food_list'] = _isFoodList;
    map['is_category_list'] = _isCategoryList;
    return map;
  }
}

/// id : "20230912T073636381808192_805fed19-212f-4e94-8122-0bbd2a17b744_japanfood2"
/// extension : ".jpg"
/// original_name : "japan_food_2.jpg"
/// size : 60890
/// type : "image/webp"
/// description : ""
/// content : null
/// signature : "1a8942ca8294f415369c38417f8d06ed"

Contents contentsFromJson(String str) => Contents.fromJson(json.decode(str));
String contentsToJson(Contents data) => json.encode(data.toJson());

class Contents {
  Contents({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    dynamic content,
    String? signature,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
    _signature = signature;
  }

  Contents.fromJson(dynamic json) {
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
  Contents copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    dynamic content,
    String? signature,
  }) =>
      Contents(
        id: id ?? _id,
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

/// id : "bae58bb0-509c-11ee-a827-3589652ccf1c"
/// name : "Image banner"
/// code : "BANNER"
/// restaurant_dec_category_id : "a0322060-ff7f-4c4a-90fc-cd36960ead44"
/// image : {"id":"string","extension":"string","original_name":"string","size":0,"type":"string","description":"string","content":"string","signature":null}
/// order : 1
/// created_at : "2023-09-11T19:14:22.312"
/// created_by : "00000000-0000-0000-0000-000000000000"
/// updated_at : "2023-09-11T19:14:22.312"
/// updated_by : "00000000-0000-0000-0000-000000000000"

RestaurantDecorationCollection restaurantDecorationCollectionFromJson(
        String str) =>
    RestaurantDecorationCollection.fromJson(json.decode(str));
String restaurantDecorationCollectionToJson(
        RestaurantDecorationCollection data) =>
    json.encode(data.toJson());

class RestaurantDecorationCollection {
  RestaurantDecorationCollection({
    String? id,
    String? name,
    String? code,
    String? restaurantDecCategoryId,
    ImageRestaurant? image,
    num? order,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _restaurantDecCategoryId = restaurantDecCategoryId;
    _image = image;
    _order = order;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
  }

  RestaurantDecorationCollection.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _restaurantDecCategoryId = json['restaurant_dec_category_id'];
    _image = json['image'] != null ? ImageRestaurant.fromJson(json['image']) : null;
    _order = json['order'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  String? _id;
  String? _name;
  String? _code;
  String? _restaurantDecCategoryId;
  ImageRestaurant? _image;
  num? _order;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  RestaurantDecorationCollection copyWith({
    String? id,
    String? name,
    String? code,
    String? restaurantDecCategoryId,
    ImageRestaurant? image,
    num? order,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      RestaurantDecorationCollection(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        restaurantDecCategoryId:
            restaurantDecCategoryId ?? _restaurantDecCategoryId,
        image: image ?? _image,
        order: order ?? _order,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
      );
  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get restaurantDecCategoryId => _restaurantDecCategoryId;
  ImageRestaurant? get image => _image;
  num? get order => _order;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['restaurant_dec_category_id'] = _restaurantDecCategoryId;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['order'] = _order;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }
}

/// id : "string"
/// extension : "string"
/// original_name : "string"
/// size : 0
/// type : "string"
/// description : "string"
/// content : "string"
/// signature : null

ImageRestaurant imageFromJson(String str) => ImageRestaurant.fromJson(json.decode(str));
String imageToJson(ImageRestaurant data) => json.encode(data.toJson());

class ImageRestaurant {
  ImageRestaurant({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? content,
    dynamic signature,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
    _signature = signature;
  }

  ImageRestaurant.fromJson(dynamic json) {
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
  String? _content;
  dynamic _signature;
  ImageRestaurant copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? content,
    dynamic signature,
  }) =>
      ImageRestaurant(
        id: id ?? _id,
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
  String? get content => _content;
  dynamic get signature => _signature;

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

/// id : "6f6cde00-4d67-11ee-bd6b-8b357fdc2e0c"
/// name : "Open"
/// code : "OPEN"
/// from_at : "2023-09-11T15:40:20.325"
/// to_at : "2023-09-11T15:40:20.325"
/// created_at : "2023-09-07T17:15:14.233"
/// created_by : "00000000-0000-0000-0000-000000000000"
/// updated_at : "2023-09-07T17:15:14.233"
/// updated_by : "00000000-0000-0000-0000-000000000000"

RestaurantStatus restaurantStatusFromJson(String str) =>
    RestaurantStatus.fromJson(json.decode(str));
String restaurantStatusToJson(RestaurantStatus data) =>
    json.encode(data.toJson());

class RestaurantStatus {
  RestaurantStatus({
    String? id,
    String? name,
    String? code,
    String? fromAt,
    String? toAt,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _fromAt = fromAt;
    _toAt = toAt;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
  }

  RestaurantStatus.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _fromAt = json['from_at'];
    _toAt = json['to_at'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  String? _id;
  String? _name;
  String? _code;
  String? _fromAt;
  String? _toAt;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  RestaurantStatus copyWith({
    String? id,
    String? name,
    String? code,
    String? fromAt,
    String? toAt,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      RestaurantStatus(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        fromAt: fromAt ?? _fromAt,
        toAt: toAt ?? _toAt,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
      );
  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get fromAt => _fromAt;
  String? get toAt => _toAt;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['from_at'] = _fromAt;
    map['to_at'] = _toAt;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }
}

/// id : "20230911T153937662299707_00000000-0000-0000-0000-000000000000_FixedRatioImage"
/// extension : ".jfif"
/// original_name : "jp-bg.jfif"
/// size : 14216
/// type : "image/jpeg"
/// description : "jp-bg"
/// content : null
/// signature : "284f79de08aceff99c7945484b7ebb57"

Background backgroundFromJson(String str) =>
    Background.fromJson(json.decode(str));
String backgroundToJson(Background data) => json.encode(data.toJson());

class Background {
  Background({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    dynamic content,
    String? signature,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
    _signature = signature;
  }

  Background.fromJson(dynamic json) {
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
  Background copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    dynamic content,
    String? signature,
  }) =>
      Background(
        id: id ?? _id,
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

/// id : "20230911T153937662299707_00000000-0000-0000-0000-000000000000_FixedRatioImage"
/// extension : ".jfif"
/// original_name : "jp-avatar.jfif"
/// size : 6899
/// type : "image/jpeg"
/// description : "jp-avatar"
/// content : null
/// signature : "fe50114193ee7c0a679bbaf258e8780e"

Avatar avatarFromJson(String str) => Avatar.fromJson(json.decode(str));
String avatarToJson(Avatar data) => json.encode(data.toJson());

class Avatar {
  Avatar({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    dynamic content,
    String? signature,
  }) {
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
    _signature = signature;
  }

  Avatar.fromJson(dynamic json) {
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
  Avatar copyWith({
    String? id,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    dynamic content,
    String? signature,
  }) =>
      Avatar(
        id: id ?? _id,
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
