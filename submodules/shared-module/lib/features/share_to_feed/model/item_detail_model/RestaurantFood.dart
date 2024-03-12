import 'Avatar.dart';
import 'Country.dart';
import 'Province.dart';
import 'District.dart';
import 'Ward.dart';

class RestaurantFood {
  RestaurantFood({
      this.id, 
      this.name, 
      this.avatar, 
      this.restaurantTypeIds, 
      this.restaurantTypes, 
      this.country, 
      this.province, 
      this.district, 
      this.ward, 
      this.street, 
      this.longitude, 
      this.latitude,});

  RestaurantFood.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    restaurantTypeIds = json['restaurant_type_ids'] != null ? json['restaurant_type_ids'].cast<String>() : [];
    restaurantTypes = json['restaurant_types'] != null ? json['restaurant_types'].cast<String>() : [];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    province = json['province'] != null ? Province.fromJson(json['province']) : null;
    district = json['district'] != null ? District.fromJson(json['district']) : null;
    ward = json['ward'] != null ? Ward.fromJson(json['ward']) : null;
    street = json['street'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
  String? id;
  String? name;
  Avatar? avatar;
  List<String>? restaurantTypeIds;
  List<String>? restaurantTypes;
  Country? country;
  Province? province;
  District? district;
  Ward? ward;
  String? street;
  num? longitude;
  num? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (avatar != null) {
      map['avatar'] = avatar?.toJson();
    }
    map['restaurant_type_ids'] = restaurantTypeIds;
    map['restaurant_types'] = restaurantTypes;
    if (country != null) {
      map['country'] = country?.toJson();
    }
    if (province != null) {
      map['province'] = province?.toJson();
    }
    if (district != null) {
      map['district'] = district?.toJson();
    }
    if (ward != null) {
      map['ward'] = ward?.toJson();
    }
    map['street'] = street;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }

  RestaurantFood copyWith({
    String? id,
    String? name,
    Avatar? avatar,
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
    return RestaurantFood(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      restaurantTypeIds: restaurantTypeIds ?? this.restaurantTypeIds,
      restaurantTypes: restaurantTypes ?? this.restaurantTypes,
      country: country ?? this.country,
      province: province ?? this.province,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      street: street ?? this.street,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}