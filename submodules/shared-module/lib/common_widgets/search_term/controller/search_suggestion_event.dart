import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/models/base_response.dart';

import '../model/PopularKeyword.dart';
import '../model/SearchSuggestion.dart';

part 'search_suggestion_event.g.dart';

@RestApi()
abstract class SearchSuggestionService {
  factory SearchSuggestionService(Dio dio, {String baseUrl}) =
  _SearchSuggestionService;

  @GET("stock/products/preflight-search")
  Future<BaseResponse<SearchSuggestionModel>> fetchData(@Query("keyword") String key);
  @GET("esearch/suggestions")
  Future<BaseResponse<PopularKeyword>> getKeysWork();
  @POST("esearch/suggestions")
  Future<BaseResponse<dynamic>> createSuggestion(@Query("keyword") String key);
}
