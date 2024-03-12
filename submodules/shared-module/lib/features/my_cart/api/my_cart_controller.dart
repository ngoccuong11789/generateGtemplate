import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/my_cart/api/my_cart_service.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/share_to_feed/model/ProductDetail.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';

class MyCartController extends BaseApiController {
  final MyCartService service;

  MyCartController(Dio dio) : service = MyCartService(dio);

  Future<CartResponse> getMyCart(Map<String, dynamic> objectType) {
    return handleWithFreshTokenRetry(() => service.getMyCart(objectType));
  }

  Future updateCartById(CartRequest dto, String id) {
    return handleWithFreshTokenRetry(() => service.updateCartById(dto, id));
  }

  Future deleteItemCart(String id) {
    return handleWithFreshTokenRetry(() => service.deleteItemCart(id));
  }

  Future addToCart(CartRequest dto) {
    return handleWithFreshTokenRetry(() => service.addToCart(dto));
  }

  Future<DataShopVouchers> fetchShopVouchers(int pageNum, List<String> objectIds, List<String> elementIds) {
    return handleWithFreshTokenRetry(() => service.fetchShopVouchers(pageNum, objectIds, elementIds));
  }

  Future<ProductDetail> fetchProduct(String productId) {
    return handleResponseFuture(service.fetchProduct(productId));
  }
}
