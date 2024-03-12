import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/add_new_voucher/models/add_voucher_request.dart';
import 'package:shared_module/features/add_new_voucher/models/area_type.dart';
import 'package:shared_module/features/add_new_voucher/models/payment_type.dart';
import 'package:shared_module/features/add_new_voucher/models/voucher_type.dart';
import 'package:shared_module/models/base_response.dart';

part 'add_voucher_service.g.dart';

@RestApi()
abstract class AddVoucherService {
  factory AddVoucherService(Dio dio, {String baseUrl}) = _AddVoucherService;

  @GET("promotion/voucher-types")
  Future<BaseResponse<List<VoucherType>>> getVoucherType(@Query("type") String buytype);

  @GET("payment/payment-type")
  Future<BaseResponse<List<PaymentType>>> getPayment();

  @POST("shop/vouchers")
  Future<BaseResponse> addVoucher(@Body() AddVoucherRequest request);

   @POST("restaurant/restaurant-vouchers")
  Future<BaseResponse> addRestaurantVoucher(@Body() AddVoucherRequest request);

  @GET("shipment/address/payment-method/areas")
  Future<BaseResponse<List<AreaType>>> getArea();

}
