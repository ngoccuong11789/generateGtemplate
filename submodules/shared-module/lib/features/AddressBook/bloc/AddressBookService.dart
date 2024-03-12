import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/AddressBook/model/CreateAddress.dart';
import 'package:shared_module/features/AddressBook/model/DropdownItemModel.dart';
import 'package:shared_module/models/base_response.dart';

part 'AddressBookService.g.dart';

@RestApi()
abstract class AddressBookService {
  factory AddressBookService(Dio dio, {String baseUrl}) = _AddressBookService;

  @GET("order/address")
  Future<BaseResponse<List<AddressNewModel>>> getListAddress();

  @GET("shipment/address/countries")
  Future<BaseResponse<List<DropdownItemModel>>> getCountry();

  @GET("shipment/address/provinces")
  Future<BaseResponse<List<DropdownItemModel>>> getProvince(
      @Query("countryId") String countryId);

  @GET("shipment/address/districts")
  Future<BaseResponse<List<DropdownItemModel>>> getDistrict(
      @Query("provinceId") String provinceId);

  @GET("shipment/address/wards")
  Future<BaseResponse<List<DropdownItemModel>>> getWard(
      @Query("districtId") String districtId);

  @POST("order/address")
  Future<BaseResponse<AddressNewModel>> createAddress(
      @Body() Map<String, dynamic> data);

  @DELETE("order/address/{id}")
  Future<BaseResponse<dynamic>> deleteAddress(@Path("id") String id);

  @PUT("order/address/{id}")
  Future<BaseResponse<AddressNewModel>> updateAddress(
      @Body()  Map<String, dynamic> data, @Path("id") String id);
}
