import 'package:dio/dio.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/models/base_response.dart';

part 'voucher_product_service.g.dart';

@RestApi()
abstract class VoucherProductService {
  factory VoucherProductService(Dio dio, {String baseUrl}) = _VoucherProductService;

  @GET("catalog/shop-catalogs/my-shop?pageNum=0&pageSize=99")
  Future<BaseResponse<LocalCatalogResponse>> getAllShopCatalogs();

  @GET("catalog/food-categories/my-food?pageNum=0&pageSize=99")
  Future<BaseResponse<LocalCatalogResponse>> getAllRestaurantCatalogs();

  @GET("stock/catalogs/{catalogId}/products")
  Future<BaseResponse<CatalogProduct>> getEcommerceProductInCatalog(@Path() String catalogId);

  @GET("food/catalogs/{catalogId}/products")
  Future<BaseResponse<CatalogProduct>> getFoodProductInCatalog(@Path() String catalogId);
}
