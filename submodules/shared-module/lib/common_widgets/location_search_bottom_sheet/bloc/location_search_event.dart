part of 'location_search_bloc.dart';

abstract class LocationSearchEvent {}

class LoadLocations extends LocationSearchEvent {}

class KeywordChanged extends LocationSearchEvent {
  final String keyword;

  KeywordChanged({
    required this.keyword,
  });
}

class LocationSelected extends LocationSearchEvent {
  final LocationDetails locationDetails;

  LocationSelected({required this.locationDetails});
}

class MyLocationSelected extends LocationSearchEvent {}
