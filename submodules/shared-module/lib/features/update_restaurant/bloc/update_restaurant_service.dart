import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';
import 'package:shared_module/features/update_restaurant/model/restaurant_update_request.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/features/update_shop/model/district.dart';


import '../../../models/base_response.dart';
import '../model/restaurant_info.dart';

part 'update_restaurant_service.g.dart';

@RestApi(baseUrl: '')
abstract class UpdateRestaurantService{

  factory UpdateRestaurantService(Dio dio, {String baseUrl}) = _UpdateRestaurantService;

  @GET("restaurant/restaurants/info")
  Future<BaseResponse<RestaurantInformationModel>> getRestaurantInfo();

  @GET("shipment/address/countries")
  Future<BaseResponse<List<Countries>>> getListCountries();

  @GET("shipment/address/provinces")
  Future<BaseResponse<List<Provinces>>> getListProvincesByCountryId(@Query("countryId") String countryId);

  @GET("shipment/address/districts")
  Future<BaseResponse<List<District>>> getListDistrictByProvinceId(@Query("provinceId")String provinceId);

  @GET("restaurant/restaurant-types")
  Future<BaseResponse<CategoryRestaurant>> getListCategory();
  
  @PUT("restaurant/restaurants/info/{id}")
  Future<BaseResponse<RestaurantInformationModel>> updateRestaurant (@Body() RestaurantUpdateRequest request, @Path() String id);

}