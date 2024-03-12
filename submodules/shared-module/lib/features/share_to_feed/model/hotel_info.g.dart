// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInfo _$HotelInfoFromJson(Map<String, dynamic> json) => HotelInfo(
      json['property_id'] as String,
      json['property_name'] as String?,
      json['property_type_id'] as int?,
      json['property_type_name'] as String?,
      json['address'] as String?,
      json['city_name'] as String?,
      json['country_code'] as String?,
      json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      (json['distance_from_center'] as num?)?.toDouble(),
      json['rank'] as int?,
      json['property_description'],
      json['total_rooms'] as int?,
      json['total_floors'] as int?,
      (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['payment_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['currency'] as String?,
      json['time_zone'] as String?,
      json['property_image_overview_url'] as String?,
      (json['property_image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['property_video_urls'] as List<dynamic>?,
      (json['star'] as num?)?.toDouble(),
      (json['property_amenity_list'] as List<dynamic>?)
          ?.map((e) => PropertyAmenityList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['num_of_ratings'] as int?,
      (json['average_rating_point'] as num?)?.toDouble(),
      json['average_rating_text'] as String?,
      json['customer_review'] == null
          ? null
          : CustomerReview.fromJson(
              json['customer_review'] as Map<String, dynamic>),
      json['policy'],
      (json['location_nearby'] as List<dynamic>?)
          ?.map((e) => LocationNearByList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['is_support_multi_room'] as bool,
      json['resource_id'] as int,
    );

Map<String, dynamic> _$HotelInfoToJson(HotelInfo instance) => <String, dynamic>{
      'property_id': instance.propertyId,
      'property_name': instance.propertyName,
      'property_type_id': instance.propertyTypeId,
      'property_type_name': instance.propertyTypeName,
      'address': instance.address,
      'city_name': instance.cityName,
      'country_code': instance.countryCode,
      'coordinates': instance.coordinates?.toJson(),
      'distance_from_center': instance.distanceFromCenter,
      'rank': instance.rank,
      'property_description': instance.propertyDescription,
      'total_rooms': instance.totalRooms,
      'total_floors': instance.totalFloors,
      'spoken_languages': instance.spokenLanguages,
      'payment_options': instance.paymentOptions,
      'currency': instance.currency,
      'time_zone': instance.timeZone,
      'property_image_overview_url': instance.propertyImageOverviewUrl,
      'property_image_urls': instance.propertyImageUrls,
      'property_video_urls': instance.propertyVideoUrls,
      'star': instance.star,
      'property_amenity_list':
          instance.propertyAmenityList?.map((e) => e.toJson()).toList(),
      'num_of_ratings': instance.numOfRatings,
      'average_rating_point': instance.averageRatingPoint,
      'average_rating_text': instance.averageRatingText,
      'customer_review': instance.customerReview?.toJson(),
      'policy': instance.policy,
      'location_nearby':
          instance.locationNearby?.map((e) => e.toJson()).toList(),
      'is_support_multi_room': instance.isSupportMultiRoom,
      'resource_id': instance.resourceId,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) =>
    CustomerReview(
      (json['location'] as num?)?.toDouble(),
      (json['services'] as num?)?.toDouble(),
      (json['cleanliness'] as num?)?.toDouble(),
      (json['facilities'] as num?)?.toDouble(),
      (json['value_for_money'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CustomerReviewToJson(CustomerReview instance) =>
    <String, dynamic>{
      'location': instance.location,
      'services': instance.services,
      'cleanliness': instance.cleanliness,
      'facilities': instance.facilities,
      'value_for_money': instance.valueForMoney,
    };

PropertyAmenityList _$PropertyAmenityListFromJson(Map<String, dynamic> json) =>
    PropertyAmenityList(
      json['amenity_name'] as String?,
      json['amenity_icon'] as String?,
    );

Map<String, dynamic> _$PropertyAmenityListToJson(
        PropertyAmenityList instance) =>
    <String, dynamic>{
      'amenity_name': instance.amenityName,
      'amenity_icon': instance.amenityIcon,
    };

LocationNearByList _$LocationNearByListFromJson(Map<String, dynamic> json) =>
    LocationNearByList(
      json['place_icon'] as String?,
      json['place_name'] as String?,
      (json['distance'] as num?)?.toDouble(),
      json['distance_unit'] as String?,
    );

Map<String, dynamic> _$LocationNearByListToJson(LocationNearByList instance) =>
    <String, dynamic>{
      'place_icon': instance.placeIcon,
      'place_name': instance.placeName,
      'distance': instance.distance,
      'distance_unit': instance.distanceUnit,
    };
