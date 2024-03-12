import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/update_shop/bloc/update_shop_service.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/information_shop_model.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/features/update_shop/model/update_shop_request.dart';

class UpdateShopController extends BaseApiController{
  final UpdateShopService service;

  UpdateShopController(Dio dio) : service = UpdateShopService(dio);

  Future<List<Countries>> getListCountries() {
    return handleWithFreshTokenRetry(() => service.getListCountries()) ;
  }

  Future<List<Provinces>> getListProvincesByCountryId(String countryId) {
    return handleWithFreshTokenRetry(() => service.getListProvincesByCountryId(countryId)) ;
  }

  Future<List<District>> getListDistrictByProvinceId(String provincesId) {
    return handleWithFreshTokenRetry(() => service.getListDistrictByProvinceId(provincesId)) ;
  }

  Future<InformationShopModel> getShopInformation(){
    return handleWithFreshTokenRetry(() => service.getShopInformation());
  }

  Future<InformationShopModel> handleUpdateShopInformation(String id, UpdateShopRequest request){
    return handleWithFreshTokenRetry(() => service.updateShopInformation(id, request));
  }
}