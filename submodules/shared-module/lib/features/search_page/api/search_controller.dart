import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/search_page/api/search_service.dart';
import 'package:shared_module/features/search_page/model/SearchLocation.dart';
import 'package:shared_module/features/search_page/model/ecommerce_search_result.dart';
import 'package:shared_module/features/search_page/model/food_search_result.dart';

class SearchController extends BaseApiController {
  final SearchService service;

  SearchController(Dio dio) : service = SearchService(dio);

  Future<SearchLocation> getLocations(String provinceId) async {
    return handleResponse(await service.getLocations(provinceId));
  }

  Future<EcommerceSearchResult> getEcommerceResultList(Map<String, dynamic> queries) async {
    return handleResponse(await service.getEcommerceResultList(queries));
  }

    Future<FoodSearchResult> getFoodResultList(Map<String, dynamic> queries) async {
    return handleResponse(await service.getFoodResultList(queries));
  }
}
