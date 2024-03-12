// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_open_shop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOpenShopResponse _$DataOpenShopResponseFromJson(
        Map<String, dynamic> json) =>
    DataOpenShopResponse(
      json['id'] as String?,
      json['accepted_status'] as String?,
      json['name'] as String?,
      json['owner_name'] as String?,
      json['phone'] as String?,
      json['country'] == null ? null : CountryRequest.fromJson(json['country']),
      json['province'] == null
          ? null
          : ProvinceRequest.fromJson(json['province']),
      json['district'] == null
          ? null
          : DistrictRequest.fromJson(json['district']),
      json['ward'] == null ? null : WardRequest.fromJson(json['ward']),
      json['street'] as String?,
      json['sub_street'] as String?,
      json['email'] as String?,
      json['id_card'] as String?,
      json['open_time'] as String?,
      json['closed_time'] as String?,
      (json['working_days'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['address'] as String?,
      json['google_map_url'] as String?,
      json['longitude'] as num?,
      json['latitude'] as num?,
      json['avatar'] == null ? null : Avatar.fromJson(json['avatar']),
      (json['attachments'] as List<dynamic>?)
          ?.map(AttachmentDTO.fromJson)
          .toList(),
      json['is_offline_store'] as bool?,
    );

Map<String, dynamic> _$DataOpenShopResponseToJson(
        DataOpenShopResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accepted_status': instance.acceptedStatus,
      'name': instance.name,
      'owner_name': instance.ownerName,
      'phone': instance.phone,
      'country': instance.country?.toJson(),
      'province': instance.province?.toJson(),
      'district': instance.district?.toJson(),
      'ward': instance.ward?.toJson(),
      'street': instance.street,
      'sub_street': instance.subStreet,
      'email': instance.email,
      'id_card': instance.idCard,
      'open_time': instance.openTime,
      'closed_time': instance.closedTime,
      'working_days': instance.workingDays,
      'address': instance.address,
      'google_map_url': instance.googleMapUrl,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'avatar': instance.avatar?.toJson(),
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'is_offline_store': instance.isOfflineStore,
    };
