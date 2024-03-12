import 'package:dio/dio.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/checkout/model/food_checkout_request.dart';
import 'package:shared_module/features/checkout/model/checkout_response.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/models/base_response.dart';

part 'shop_voucher_service.g.dart';

@RestApi()
abstract class ShopVouchersService {
  factory ShopVouchersService(Dio dio, {String baseUrl}) = _ShopVouchersService;

  @GET("promotion/vouchers/filters")
  Future<BaseResponse<DataShopVouchers>> fetchShopVouchers(@Query("pageNum") int pageNum, @Query("object_ids") List<String> objectIds, @Query("element_ids") List<String> elementIds );

  @GET("promotion/soctrip-vouchers/filters")
  Future<BaseResponse<DataShippingVouchers>> fetchShippingVouchers(@Query("pageNum") int pageNum, @Query("object_ids") List<String> objectIds, @Query("pageSize") int pageSize, @Query("element_ids") List<String> elementIds );
}
