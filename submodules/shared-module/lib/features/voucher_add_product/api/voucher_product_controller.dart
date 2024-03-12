import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/voucher_add_product/api/voucher_product_service.dart';

class VoucherProductController extends BaseApiController {
  final VoucherProductService service;

  VoucherProductController(Dio dio) : service = VoucherProductService(dio);

  Future<LocalCatalogResponse> getAllShopCatalogs() async {
    return handleResponse(await service.getAllShopCatalogs());
  }

  Future<LocalCatalogResponse> getAllRestaurantCatalogs() async {
    return handleResponse(await service.getAllRestaurantCatalogs());
  }

  Future<CatalogProduct> getEcommerceProductInCatalog(String catalogId) async {
    return handleResponse(await service.getEcommerceProductInCatalog(catalogId));
  }

  Future<CatalogProduct> getFoodProductInCatalog(String catalogId) async {
    return handleResponse(await service.getFoodProductInCatalog(catalogId));
  }
}
