import 'package:dio/dio.dart';
import 'package:shared_module/common_widgets/search_term/controller/search_suggestion_event.dart';

import '../../../base_api_controller.dart';
import '../model/PopularKeyword.dart';
import '../model/SearchSuggestion.dart';

class SearchSuggestionController extends BaseApiController {
  final SearchSuggestionService service;

  SearchSuggestionController(Dio dio) : service = SearchSuggestionService(dio);

  Future<SearchSuggestionModel> searchSuggestion(String query) async {
    return handleResponse(await service.fetchData(query));
  }

  Future<PopularKeyword> getKeyword() async {
    return handleResponse(await service.getKeysWork());
  }

  Future<dynamic> create(String query) async {
    return handleResponse(await service.createSuggestion(query));
  }

}
