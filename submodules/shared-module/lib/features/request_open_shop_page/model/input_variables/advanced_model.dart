import 'package:equatable/equatable.dart';

class AdvancedModel extends Equatable {
  final String addressAdvance;
  final String googleMapUrl;
  final String longitude;
  final String latitude;

  const AdvancedModel({
    this.addressAdvance = "",
    this.googleMapUrl = "",
    this.longitude = "",
    this.latitude = "",
  });

  AdvancedModel copyWith({
    String? addressAdvance,
    String? googleMapUrl,
    String? longitude,
    String? latitude,
  }) {
    return AdvancedModel(
      addressAdvance: addressAdvance ?? this.addressAdvance,
      googleMapUrl: googleMapUrl ?? this.googleMapUrl,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  @override
  List<Object?> get props => [
        addressAdvance,
        googleMapUrl,
        longitude,
        latitude,
      ];
}
