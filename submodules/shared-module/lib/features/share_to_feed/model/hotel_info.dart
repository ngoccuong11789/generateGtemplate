import 'package:json_annotation/json_annotation.dart';
part 'hotel_info.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class HotelInfo {
  final String propertyId;
  final String? propertyName;
  final int? propertyTypeId;
  final String? propertyTypeName;
  final String? address;
  final String? cityName;
  final String? countryCode;
  final Coordinates? coordinates;
  final double? distanceFromCenter;
  final int? rank;
  final dynamic propertyDescription;
  final int? totalRooms;
  final int? totalFloors;
  final List<String>? spokenLanguages;
  final List<String>? paymentOptions;
  final String? currency;
  final String? timeZone;
  final String? propertyImageOverviewUrl;
  final List<String>? propertyImageUrls;
  final List<dynamic>? propertyVideoUrls;
  final double? star;
  final List<PropertyAmenityList>? propertyAmenityList;
  final int? numOfRatings;
  final double? averageRatingPoint;
  final String? averageRatingText;
  final CustomerReview? customerReview;
  final dynamic policy;
  final List<LocationNearByList>? locationNearby;
  final bool isSupportMultiRoom;
  final int resourceId;

  HotelInfo(
    this.propertyId,
    this.propertyName,
    this.propertyTypeId,
    this.propertyTypeName,
    this.address,
    this.cityName,
    this.countryCode,
    this.coordinates,
    this.distanceFromCenter,
    this.rank,
    this.propertyDescription,
    this.totalRooms,
    this.totalFloors,
    this.spokenLanguages,
    this.paymentOptions,
    this.currency,
    this.timeZone,
    this.propertyImageOverviewUrl,
    this.propertyImageUrls,
    this.propertyVideoUrls,
    this.star,
    this.propertyAmenityList,
    this.numOfRatings,
    this.averageRatingPoint,
    this.averageRatingText,
    this.customerReview,
    this.policy,
    this.locationNearby,
    this.isSupportMultiRoom,
    this.resourceId,
  );

  factory HotelInfo.initial() {
    return HotelInfo(
        '',
        '',
        0,
        '',
        '',
        '',
        '',
        Coordinates(0.0, 0.0),
        0.0,
        0,
        null,
        0,
        0,
        [],
        [],
        '',
        '',
        '',
        null,
        [],
        0.0,
        [],
        0,
        0.0,
        '',
        CustomerReview(
          0.0,
          0.0,
          0.0,
          0.0,
          0,
        ),
        null,
        [], false, 1);
  }

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Coordinates {
  final double? latitude;
  final double? longitude;

  Coordinates(
    this.latitude,
    this.longitude,
  );

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class CustomerReview {
  final double? location;
  final double? services;
  final double? cleanliness;
  final double? facilities;
  final double? valueForMoney;

  CustomerReview(
    this.location,
    this.services,
    this.cleanliness,
    this.facilities,
    this.valueForMoney,
  );

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerReviewToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PropertyAmenityList {
  final String? amenityName;
  final String? amenityIcon;

  PropertyAmenityList(
    this.amenityName,
    this.amenityIcon,
  );

  factory PropertyAmenityList.fromJson(Map<String, dynamic> json) =>
      _$PropertyAmenityListFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyAmenityListToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class LocationNearByList {
  final String? placeIcon;
  final String? placeName;
  final double? distance;
  final String? distanceUnit;

  LocationNearByList(
    this.placeIcon,
    this.placeName,
    this.distance,
    this.distanceUnit,
  );

  factory LocationNearByList.fromJson(Map<String, dynamic> json) =>
      _$LocationNearByListFromJson(json);

  Map<String, dynamic> toJson() => _$LocationNearByListToJson(this);
}
