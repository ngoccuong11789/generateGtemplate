import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/data_restaurant_response.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/send_request_open_restaurant.dart';
import 'package:shared_module/features/request_open_shop_page/model/user_information.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/models/base_response.dart';

part 'request_to_open_restaurant_service.g.dart';

@RestApi(baseUrl: '')
abstract class RequestToOpenRestaurantService {
  factory RequestToOpenRestaurantService(Dio dio, {String baseUrl}) =
  _RequestToOpenRestaurantService;

  @GET("user/users/{id}")
  Future<BaseResponse<User>> getInfoUser (@Path() String id);
  
  @GET("restaurant/restaurant-types")
  Future<BaseResponse<CategoryRestaurant>> getListCategory();
  
  @POST("restaurant/restaurants")
  Future<BaseResponse<DataRestaurantResponse>> createNewRestaurant (@Body() SendRequestOpenRestaurant request);

  @GET("shipment/address/countries")
  Future<BaseResponse<List<Countries>>> getListCountries();

  @GET("shipment/address/provinces")
  Future<BaseResponse<List<Provinces>>> getListProvincesByCountryId(@Query("countryId") String countryId);

  @GET("shipment/address/districts")
  Future<BaseResponse<List<District>>> getListDistrictByProvinceId(@Query("provinceId")String provinceId);
}