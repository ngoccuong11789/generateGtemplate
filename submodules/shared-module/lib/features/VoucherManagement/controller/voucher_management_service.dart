import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/models/base_response.dart';

import '../model/ItemQuantity.dart';
import '../model/VoucherResponseModel.dart';


part 'voucher_management_service.g.dart';

@RestApi()
abstract class VoucherManagementService {
  factory VoucherManagementService(Dio dio, {String baseUrl}) =
  _VoucherManagementService;
  @GET("promotion/vouchers/management")
  Future<BaseResponse<VoucherResponseModel>> getData(
      @Query("filters") String filters,
      @Query("pageNum") int pageNum,
      @Query("tab") String tab,
      @Query("type") String type
      );
  @GET("promotion/vouchers/status/quantity")
  Future<BaseResponse<List<ItemQuantity>>> getQuantity(
      @Query("type") String type,
      );
  @GET("promotion/voucher-types")
  Future<BaseResponse<List<VoucherType>>> getVoucherType(
      @Query("type") String type,
      );
  @DELETE("promotion/vouchers/{id}")
  Future<BaseResponse<dynamic>> deleteVoucher(
      @Path("id") String id,
      );
  @PUT("promotion/vouchers/{id}/status")
  Future<BaseResponse<dynamic>> publicVoucher(
      @Path("id") String id,
      );
}
