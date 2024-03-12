import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_module/common_widgets/location_search_bottom_sheet/models/country_detail_model.dart';
import 'package:shared_module/models/base_response.dart';

part 'province_location_service.g.dart';

@RestApi()
abstract class ProvinceLocationService {
  factory ProvinceLocationService(Dio dio, {String? baseUrl}) = _ProvinceLocationService;

  @GET("shipment/address/countries/detail")
  Future<BaseResponse<CountryDetailModel>> getCountryDetail();
}