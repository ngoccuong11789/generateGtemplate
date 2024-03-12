import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/common_widgets/location_search_bottom_sheet/controller/province_location_service.dart';
import 'package:shared_module/exception/soctrip_exeception.dart';
import 'package:shared_module/utils/list_extension.dart';
import 'package:shared_module/utils/location_helper.dart';
import 'package:shared_module/utils/string_extension.dart';
import 'location_search_controller.dart';
import '../models/location_details.dart';

class ProvinceLocationSearchController extends BaseApiController
    implements LocationSearchController {
  final ProvinceLocationService service;

  ProvinceLocationSearchController(Dio dio)
      : service = ProvinceLocationService(dio);

  List<LocationDetails>? _allLocations;

  @override
  Future<List<LocationDetails>> getLocations(String keyword) async {
    _allLocations ??= await getAllLocation();
    return _allLocations!
        .where((element) => element.name.containsIgnoreCase(keyword))
        .toList(growable: false);
  }

  Future<List<LocationDetails>> getAllLocation() async {
    final data =
        await handleWithFreshTokenRetry(() => service.getCountryDetail());
    final locations = data.provinces.mapToList((e, i) => LocationDetails(
        id: e.provinceId, name: e.provinceName, address: data.countryName));

    return locations;
  }

  Future<LocationDetails?> _getFirstLocationAddress() async {
    var locations = await getLocations("");
    if (locations.isEmpty) {
      return null;
    }
    return locations[0];
  }

  @override
  Future<LocationDetails?> getMyLocation() async {
    var location = await LocationHelper.getLocation();
    if (location == null) {
      throw SoctripException(message: "Cannot retrieve your location");
    }
    return MyLocation(
        longitude: location.longitude!, latitude: location.latitude!);
  }
}
