import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';
import 'package:shared_module/features/update_restaurant/bloc/update_restaurant_service.dart';
import 'package:shared_module/features/update_restaurant/model/restaurant_info.dart';
import 'package:shared_module/features/update_restaurant/model/restaurant_update_request.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';

class UpdateRestaurantController extends BaseApiController{
  final UpdateRestaurantService service;

  UpdateRestaurantController(Dio dio) : service = UpdateRestaurantService(dio);

  Future<RestaurantInformationModel> handleGetRestaurantInfo(){
    return handleWithFreshTokenRetry(() => service.getRestaurantInfo());
  }

  Future<List<Countries>> getListCountries() {
    return handleWithFreshTokenRetry(() => service.getListCountries()) ;
  }

  Future<List<Provinces>> getListProvincesByCountryId(String countryId) {
    return handleWithFreshTokenRetry(() => service.getListProvincesByCountryId(countryId));
  }

  Future<List<District>> getListDistrictByProvinceId(String provincesId) {
    return handleWithFreshTokenRetry(() => service.getListDistrictByProvinceId(provincesId));
  }

  Future<CategoryRestaurant> getListCategoryRestaurant(){
    return handleWithFreshTokenRetry(() => service.getListCategory());
  }

  Future<RestaurantInformationModel> updateRestaurant(RestaurantUpdateRequest request, String id){
    return handleWithFreshTokenRetry(() => service.updateRestaurant(request, id));
  }
}