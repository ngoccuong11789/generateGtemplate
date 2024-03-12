import '../models/location_details.dart';

abstract class LocationSearchController {
  Future<List<LocationDetails>> getLocations(String keyword);

  Future<LocationDetails?> getMyLocation();
}
