import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/share_to_feed/model/ProductDetail.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/models/base_response.dart';

part 'my_cart_service.g.dart';

@RestApi()
abstract class MyCartService {
  factory MyCartService(Dio dio, {String baseUrl}) = _MyCartService;

  @GET("cart/carts/my-cart")
  Future<BaseResponse<CartResponse>> getMyCart(
      @Queries() Map<String, dynamic> objectType);

  @PUT("cart/carts/{id}")
  Future<BaseResponse> updateCartById(@Body() CartRequest dto, @Path() String id);

  @DELETE("cart/carts/{id}")
  Future<BaseResponse> deleteItemCart(@Path() String id);

  @GET("stock/products/{productId}")
  Future<BaseResponse<ProductDetail>> fetchProduct(@Path() String productId);

  @POST("cart/carts")
  Future<BaseResponse> addToCart(@Body() CartRequest dto);

  @GET("promotion/vouchers/filters")
  Future<BaseResponse<DataShopVouchers>> fetchShopVouchers(@Query("pageNum") int pageNum, @Query("object_ids") List<String> objectIds, @Query("element_ids") List<String> elementIds );
}
