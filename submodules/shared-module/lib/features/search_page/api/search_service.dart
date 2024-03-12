import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/search_page/model/SearchLocation.dart';
import 'package:shared_module/features/search_page/model/ecommerce_search_result.dart';
import 'package:shared_module/features/search_page/model/food_search_result.dart';
import 'package:shared_module/models/base_response.dart';

part 'search_service.g.dart';

@RestApi()
abstract class SearchService {
  factory SearchService(Dio dio, {String baseUrl}) = _SearchService;

  @GET("shipment/address/provinces/{provinceId}/detail")
  Future<BaseResponse<SearchLocation>> getLocations(@Path() String provinceId);

  @GET("stock/products/search")
  Future<BaseResponse<EcommerceSearchResult>> getEcommerceResultList(
      @Queries() Map<String, dynamic> queries);

  @GET("restaurant/restaurants")
  Future<BaseResponse<FoodSearchResult>> getFoodResultList(
      @Queries() Map<String, dynamic> queries);
}
