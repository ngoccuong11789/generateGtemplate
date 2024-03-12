import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/global_catalog.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/models/base_response.dart';

part 'category_service.g.dart';

@RestApi()
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @GET("catalog/global-catalogs/tree")
  Future<BaseResponse<List<GlobalCatalog>>> getAllEcommerceGlobalCatalogs();

  @GET("catalog/global-catalogs/travel")
  Future<BaseResponse<GlobalCatalog>> getTravelGlobalCatalog();

  @GET("catalog/global-food-category/tree")
  Future<BaseResponse<List<GlobalCatalog>>> getAllFoodGlobalCatalogs();

  @GET("catalog/shop-catalogs/my-shop?pageNum=0&pageSize=99")
  Future<BaseResponse<LocalCatalogResponse>> getAllShopCatalogs();

  @GET("catalog/food-categories/my-food?pageNum=0&pageSize=99")
  Future<BaseResponse<LocalCatalogResponse>> getAllRestaurantCatalogs();

  @GET("stock/catalogs/{catalogId}/products")
  Future<BaseResponse<CatalogProduct>> getEcommerceProductInCatalog(@Path() String catalogId);

  @GET("food/catalogs/{catalogId}/products")
  Future<BaseResponse<CatalogProduct>> getFoodProductInCatalog(@Path() String catalogId);


  @POST("catalog/shop-catalogs")
  Future<BaseResponse> addShopCatalog(@Body() Map<String, dynamic> catalog);

  @POST("catalog/food-categories")
  Future<BaseResponse> addRestaurantCatalog(@Body() Map<String, dynamic> catalog);

  @PUT("catalog/shop-catalogs/{id}")
  Future<BaseResponse> editShopCatalog(@Path() String id, @Body() Map<String, dynamic> catalog);

  @PUT("catalog/food-categories/{id}")
  Future<BaseResponse> editRestaurantCatalog(@Path() String id, @Body() Map<String, dynamic> catalog);

  @POST("{type}/catalogs/{catalogId}/products")
  Future<BaseResponse> updateCatalogProduct(@Path("catalogId") String catalogId,
      @Path("type") String type, @Body() Map<String, dynamic> body);

  @DELETE("catalog/shop-catalogs/{id}")
  Future<BaseResponse> deleteShopCatalog(@Path() String id);

  @DELETE("catalog/food-categories/{id}")
  Future<BaseResponse> deleteRestaurantCatalog(@Path() String id);

  @GET("stock/shops/my-shop/catalog/search")
  Future<BaseResponse<BasePagingModel<Data>>> getMyShopProducts(
      @Query("pageNum") int pageNum, @Query("pageSize") int pageSize);

  @GET("food/restaurants/my-restaurant/products")
  Future<BaseResponse<BasePagingContainer<Data>>> getMyRestaurantMeals(
      @Query("pageNum") int pageNum,
      @Query("pageSize") int pageSize);

  @GET("catalog/shop-catalogs/{id}")
  Future<BaseResponse> getShopCatalog(@Path() String id);
}
