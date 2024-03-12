import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/api/category_service.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/global_catalog.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/models/base_response.dart';

class CategoryController extends BaseApiController {
  final CategoryService service;

  CategoryController(Dio dio) : service = CategoryService(dio);

  Future<List<GlobalCatalog>> getAllEcommerceGlobalCatalogs() async {
    return handleResponse(await service.getAllEcommerceGlobalCatalogs());
  }

  Future<GlobalCatalog> getTravelGlobalCatalog() async {
    return handleResponse(await service.getTravelGlobalCatalog());
  }

  Future<List<GlobalCatalog>> getAllFoodGlobalCatalogs() async {
    return handleResponse(await service.getAllFoodGlobalCatalogs());
  }

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

  Future addShopCatalog(Map<String, dynamic> catalog) async {
    return handleResponse(await service.addShopCatalog(catalog));
  }

  Future addRestaurantCatalog(Map<String, dynamic> catalog) async {
    return handleResponse(await service.addRestaurantCatalog(catalog));
  }

  Future editShopCatalog(String id, Map<String, dynamic> catalog) async {
    return handleResponse(await service.editShopCatalog(id, catalog));
  }

  Future editRestaurantCatalog(String id, Map<String, dynamic> catalog) async {
    return handleResponse(await service.editRestaurantCatalog(id, catalog));
  }


  Future removeShopProduct(BUYTYPE type, String catalogId, String productId) {
    return _updateShopProduct(type, catalogId, productId, true);
  }

  Future addShopProduct(BUYTYPE type, String catalogId, String productId) {
    return _updateShopProduct(type, catalogId, productId, false);
  }

  Future _updateShopProduct(
      BUYTYPE type, String catalogId, String productId, bool isRemove) {
    String typePath;
    if (type == BUYTYPE.ecommerce) {
      typePath = "stock";
    } else {
      typePath = "food";
    }
    Map<String, dynamic> request = {
      "addData": isRemove ? [] : [productId],
      "deleteData": isRemove ? [productId] : []
    };
    return handleWithFreshTokenRetry(
        () => service.updateCatalogProduct(catalogId, typePath, request));
  }

  Future deleteShopCatalog(String id) {
    return handleWithFreshTokenRetry(() => service.deleteShopCatalog(id));
  }

  Future deleteRestaurantCatalog(String id) {
    return handleWithFreshTokenRetry(() => service.deleteRestaurantCatalog(id));
  }

  Future<BasePagingModel<Data>> getMyShopProducts(int pageNum, int pageSize) {
    return handleWithFreshTokenRetry(
        () => service.getMyShopProducts(pageNum, pageSize));
  }

  Future<BasePagingModel<Data>> getMyRestaurantMeals(
      int pageNum, int pageSize) async {
    final container = await handleWithFreshTokenRetry(
        () => service.getMyRestaurantMeals(pageNum, pageSize));
    return container.responsePage;
  }

  Future getShopCatalog(String id) async {
    return handleResponse(await service.getShopCatalog(id));
  }
}
