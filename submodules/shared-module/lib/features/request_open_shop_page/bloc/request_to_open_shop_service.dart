import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/request_open_shop_page/model/countries.dart';
import 'package:shared_module/features/request_open_shop_page/model/data_open_shop_response.dart';
import 'package:shared_module/features/request_open_shop_page/model/district.dart';
import 'package:shared_module/features/request_open_shop_page/model/logo_shop.dart';
import 'package:shared_module/features/request_open_shop_page/model/provinces.dart';
import 'package:shared_module/features/request_open_shop_page/model/user_information.dart';
import 'package:shared_module/features/request_open_shop_page/model/ward.dart';
import 'package:shared_module/models/base_response.dart';

import '../model/send_request_open_shop.dart';

part 'request_to_open_shop_service.g.dart';

@RestApi(baseUrl: '')
abstract class RequestToOpenShopService {
  factory RequestToOpenShopService(Dio dio, {String baseUrl}) =
  _RequestToOpenShopService;

  @GET("shipment/address/provinces")
  Future<Provinces> getListProvincesByCountryId(@Query("countryId") String countryId);

  @GET("shipment/address/districts")
  Future<District> getListDistrictByProvinceId(@Query("provinceId")String provinceId);

  @GET("shipment/address/wards")
  Future<Ward> getListWardByDistrictId(@Query("districtId") String districtId);
  
  @POST("shop/shops/info")
  Future<BaseResponse<DataOpenShopResponse>> sendRequestOpenShop(@Body() SendRequestOpenShop dto);

  @POST("storage/files/upload-file")
  Future<BaseResponse<DataFile>> postLogoShop(@Body() FormData data);

  @POST("storage/files/upload-files")
  Future<BaseResponse<List<DataFile>>> postListAttachment (@Body() FormData listData);

  @POST("shop/shops/info")
  Future<BaseResponse<DataOpenShopResponse>> createNewShop (@Body() SendRequestOpenShop request);
  
  @GET("shipment/address/countries")
  Future<Countries> getListCountries();

  @GET("user/users/{id}")
  Future<BaseResponse<User>> getInfoUser (@Path() String id);
}