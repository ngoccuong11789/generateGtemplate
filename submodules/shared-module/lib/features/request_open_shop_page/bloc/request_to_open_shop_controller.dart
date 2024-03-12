import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/request_open_shop_page/bloc/request_to_open_shop_service.dart';
import 'package:shared_module/features/request_open_shop_page/model/countries.dart';
import 'package:shared_module/features/request_open_shop_page/model/data_open_shop_response.dart';
import 'package:shared_module/features/request_open_shop_page/model/district.dart';
import 'package:shared_module/features/request_open_shop_page/model/logo_shop.dart';
import 'package:shared_module/features/request_open_shop_page/model/provinces.dart';
import 'package:shared_module/features/request_open_shop_page/model/send_request_open_shop.dart';
import 'package:shared_module/features/request_open_shop_page/model/user_information.dart';
import 'package:shared_module/features/request_open_shop_page/model/ward.dart';

class RequestToOpenShopController extends BaseApiController {
  final RequestToOpenShopService service;

  RequestToOpenShopController(Dio dio) : service = RequestToOpenShopService(dio);

  Future<Provinces> getListProvincesByCountryId(String countryId) {
    return service.getListProvincesByCountryId(countryId);
  }

  Future<District> getListDistrictByProvinceId(String provinceId){
    return service.getListDistrictByProvinceId(provinceId);
  }

  Future<Ward> getListWardByDistrictId(String districtId){
    return service.getListWardByDistrictId(districtId);
  }

  Future<DataOpenShopResponse> handleSendRequestToOpenShop(SendRequestOpenShop request){
    return handleWithFreshTokenRetry(() => service.sendRequestOpenShop(request));
  }

  Future<DataFile> handlePostLogoShop(FormData data){
    return handleWithFreshTokenRetry(() => service.postLogoShop(data));
  }

  Future<List<DataFile>> handlePostListAttachment (FormData data){
    return handleWithFreshTokenRetry(() => service.postListAttachment(data));
  }

  Future<DataOpenShopResponse> handleCreateNewShop (SendRequestOpenShop request){
    return handleWithFreshTokenRetry(() => service.createNewShop(request));
  }

  Future<Countries> handleGetListCountries(){
    return service.getListCountries();
  }

  Future<User> handleGetInformationUser (String userId){
    return handleWithFreshTokenRetry(() => service.getInfoUser(userId));
  }

}
