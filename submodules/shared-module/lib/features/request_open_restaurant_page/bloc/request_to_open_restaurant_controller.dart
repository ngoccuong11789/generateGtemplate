import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_service.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/data_restaurant_response.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/send_request_open_restaurant.dart';
import 'package:shared_module/features/request_open_shop_page/model/user_information.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';

class RequestToOpenRestaurantController extends BaseApiController{
  final RequestToOpenRestaurantService service;

  RequestToOpenRestaurantController(Dio dio) : service = RequestToOpenRestaurantService(dio);

  Future<User> handleGetUserInformation(String id){
    return handleWithFreshTokenRetry(() => service.getInfoUser(id));
  }

  Future<CategoryRestaurant> handleGetListCategory(){
    return handleWithFreshTokenRetry(() => service.getListCategory());
  }

  Future<DataRestaurantResponse> handleCreateNewRestaurant( SendRequestOpenRestaurant request){
    return handleWithFreshTokenRetry(() => service.createNewRestaurant(request));
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
}