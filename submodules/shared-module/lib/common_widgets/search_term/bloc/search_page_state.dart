import 'package:equatable/equatable.dart';
import 'package:shared_module/common_widgets/search_term/filter_common/model/item_filter_content.dart';
import 'package:shared_module/common_widgets/search_term/model/FilterModel.dart';
import 'package:shared_module/common_widgets/search_term/model/searchModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/FieldNameFilter.dart';
import '../model/PopularKeyword.dart';

class SearchPageState extends Equatable {
  final SearchModel searchResponse;
  final bool loading;
  final bool loadPage;

  final List<ItemFilterContent> catalogs;
  final List<ItemFilterContent> regions;
  final FilterModel filterValue;
  final int build;
  final FieldNameFilter fieldNameFilter;
  final List<String> suggestion;
  final PopularKeyword popularKeyword;

  const SearchPageState({
    required this.searchResponse,
    this.loading = false,
    required this.popularKeyword,
    this.build = 0,
    required this.suggestion,
    this.loadPage = false,
    required this.fieldNameFilter,
    required this.catalogs,
    required this.regions,
    required this.filterValue,
  });

  @override
  List<Object> get props => [
        searchResponse,
        loading,
        catalogs,
        fieldNameFilter,
        loadPage,
        regions,
        build,
        filterValue,
        suggestion,
    popularKeyword
      ];

  SearchPageState copyWith(
      {SearchModel? data,
      String? filter,
      List<ItemFilterContent>? catalogs,
      List<ItemFilterContent>? regions,
      FilterModel? filterValue,
      FieldNameFilter? fieldNameFilter,
      List<String>? suggestion,
      int? build,
      PopularKeyword? popularKeyword,
      bool? loadPage,
      bool? loading}) {
    return SearchPageState(
      build: build ?? this.build,
      searchResponse: data ?? searchResponse,
      loading: loading ?? this.loading,
      loadPage: loadPage ?? this.loadPage,
      catalogs: catalogs ?? this.catalogs,
      regions: regions ?? this.regions,
      filterValue: filterValue ?? this.filterValue,
      fieldNameFilter: fieldNameFilter ?? this.fieldNameFilter,
      suggestion: suggestion ?? this.suggestion,
      popularKeyword: popularKeyword ?? this.popularKeyword,
    );
  }
}
