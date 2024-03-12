import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/vouchers/api/shop_voucher_service.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';

class ShopVouchersController extends BaseApiController {
  final ShopVouchersService service;

  ShopVouchersController(Dio dio) : service = ShopVouchersService(dio);

  Future<DataShopVouchers> fetchShopVouchers(int pageNum, List<String> objectIds, List<String> elementIds) {
    return handleWithFreshTokenRetry(() => service.fetchShopVouchers(pageNum, objectIds, elementIds));
  }

  Future<DataShippingVouchers> fetchShippingVouchers(int pageNum, List<String> objectIds, List<String> elementIds) {
    return handleWithFreshTokenRetry(() => service.fetchShippingVouchers(pageNum, objectIds, 50, elementIds));
  }
}
