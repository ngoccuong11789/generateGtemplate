import 'package:shared_module/common_widgets/search_term/filter_common/model/item_filter_content.dart';
import 'package:shared_module/common_widgets/search_term/model/SearchSuggestion.dart';

abstract mixin class SearchPageController {
 Future<dynamic> search(String query,int pageNum,String? sort);
 Future<List<ItemFilterContent>> catalog(String query);
 Future<List<ItemFilterContent>> regions(String query);
 Future<SearchSuggestionModel> getListSuggestion(String query);
}


