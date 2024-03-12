
import 'package:flutter/material.dart';

class LocationModal {
  const LocationModal({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.type,
    this.dayNo,
    this.order,
  });

  final String id;
  final double? latitude;
  final double? longitude;
  final IconType type;
  final int? dayNo;
  final int? order;
}

class IconMarker {
  const IconMarker({
    required this.source,
    required this.type,
    this.ratio = 1.0,
  });

  final Widget source;
  final IconType type;
  final double ratio;
}

enum IconType {
  social,
  travelAssistant,
  booking,
  ecommerce
}