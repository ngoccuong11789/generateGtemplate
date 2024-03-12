import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/information_shop_model.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/features/update_shop/model/update_shop_request.dart';
import 'package:shared_module/models/base_response.dart';

part 'update_shop_service.g.dart';

@RestApi(baseUrl: '')
abstract class UpdateShopService{

  factory UpdateShopService(Dio dio, {String baseUrl}) = _UpdateShopService;

  @GET("shipment/address/countries")
  Future<BaseResponse<List<Countries>>> getListCountries();

  @GET("shipment/address/provinces")
  Future<BaseResponse<List<Provinces>>> getListProvincesByCountryId(@Query("countryId") String countryId);

  @GET("shipment/address/districts")
  Future<BaseResponse<List<District>>> getListDistrictByProvinceId(@Query("provinceId")String provinceId);

  @GET("shop/shops/info")
  Future<BaseResponse<InformationShopModel>> getShopInformation();
  
  @PUT("shop/shops/{id}/info")
  Future<BaseResponse<InformationShopModel>> updateShopInformation(@Path() String id, @Body() UpdateShopRequest request);
}