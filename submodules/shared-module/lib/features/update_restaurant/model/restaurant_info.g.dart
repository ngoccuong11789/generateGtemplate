// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantInformationModel _$RestaurantInformationModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantInformationModel(
      json['name'] as String?,
      json['country'] == null
          ? null
          : CountryResponse.fromJson(json['country']),
      json['province'] == null
          ? null
          : ProvinceResponse.fromJson(json['province']),
      json['district'] == null
          ? null
          : DistrictResponse.fromJson(json['district']),
      json['street'] as String?,
      json['sub_street'] as String?,
      (json['restaurant_type_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['restaurant_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['owner_name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['id_card'] as String?,
      json['open_time'] == null
          ? null
          : DateTime.parse(json['open_time'] as String),
      json['closed_time'] == null
          ? null
          : DateTime.parse(json['closed_time'] as String),
      json['id'] as String?,
      json['accepted_status'] as String?,
    );

Map<String, dynamic> _$RestaurantInformationModelToJson(
        RestaurantInformationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country?.toJson(),
      'province': instance.province?.toJson(),
      'district': instance.district?.toJson(),
      'street': instance.street,
      'sub_street': instance.subStreet,
      'restaurant_type_ids': instance.restaurantTypeIds,
      'restaurant_types': instance.restaurantTypes,
      'owner_name': instance.ownerName,
      'email': instance.email,
      'phone': instance.phone,
      'id_card': instance.idCard,
      'open_time': instance.openTime?.toIso8601String(),
      'closed_time': instance.closedTime?.toIso8601String(),
      'id': instance.id,
      'accepted_status': instance.acceptedStatus,
    };
