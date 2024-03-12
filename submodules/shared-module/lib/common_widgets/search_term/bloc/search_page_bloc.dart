import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_module/common_widgets/search_term/bloc/search_page_state.dart';
import 'package:shared_module/common_widgets/search_term/controller/search_page_controller.dart';
import 'package:shared_module/common_widgets/search_term/controller/search_suggestion_controller.dart';
import 'package:shared_module/common_widgets/search_term/filter_common/model/TypeSectionEnum.dart';
import 'package:shared_module/common_widgets/search_term/filter_common/model/item_filter_content.dart';
import 'package:shared_module/common_widgets/search_term/model/FilterModel.dart';
import 'package:shared_module/common_widgets/search_term/model/PopularKeyword.dart';
import 'package:shared_module/common_widgets/search_term/model/searchModel.dart';
import 'package:shared_module/utils/query_builder/query_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared_module.dart';
import '../model/FieldNameFilter.dart';
import '../model/SearchSuggestion.dart';

part 'search_page_event.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final SearchPageController controller;
  SearchSuggestionController searchSuggestionController =
      SearchSuggestionController(SharedModule.appDelegates!.dio);
  final FieldNameFilter fieldNameFilter;
  final String sharedPreferencesKey;

  SearchPageBloc(this.controller, this.fieldNameFilter, this.sharedPreferencesKey)
      : super(SearchPageState(
          searchResponse: SearchModel(
              data: [], totalElement: 0, currentPage: 0, pageSize: 0),
          catalogs: [],
          regions: [],
          filterValue: newFilterModel(),
          fieldNameFilter: const FieldNameFilter(
            catalog: "",
            regions: "",
            rating: "",
            searchTerm: '',
            discountPercent: "",
            quick: ""
          ),
          suggestion: [],
          popularKeyword: const PopularKeyword(storage: {}),
        )) {
    on<Search>((Search event, emit) async {
      saveHistory(event.searchTerm.searchTerm.text);
      FilterModel filter = event.searchTerm.copyWith();
      if (event.searchTerm.maxPrice.text.isNotEmpty &&
          event.searchTerm.minPrice.text.isNotEmpty &&
          (int.parse(event.searchTerm.maxPrice.text) <
              int.parse(event.searchTerm.minPrice.text))) {
        filter = event.searchTerm.copyWith(
            min: event.searchTerm.maxPrice.text,
            max: event.searchTerm.minPrice.text,);
      }
      emit(state.copyWith(loadPage: true, filterValue: filter));
      String query = handleQuery(filter);
      dynamic data =
          await controller.search(query, 0, event.searchTerm.sort?.id ?? "");
      emit(state.copyWith(
          data: SearchModel.fromData(data),
          loadPage: false,
          fieldNameFilter: event.fieldNameFilter));
    });
    on<GetDataForFilter>((GetDataForFilter event, emit) async {
      var catalogs = await controller
          .catalog(checkEmpty(event.searchTerm.searchTerm.text));
      var regions = await controller
          .regions(checkEmpty(event.searchTerm.searchTerm.text));
      emit(state.copyWith(
        regions: regions,
        catalogs: catalogs,
      ));
    });
    on<ClearSearch>((ClearSearch event, emit) async {
      emit(state.copyWith(suggestion: [],filterValue: state.filterValue.copyWith(searchTerm: "")));
    });
    on<LoadMore>((LoadMore event, emit) async {
      if ((state.searchResponse.totalElement / state.searchResponse.pageSize) >
          state.searchResponse.currentPage) {
        var current =
            int.parse((state.searchResponse.currentPage + 1).toString());
        emit(state.copyWith(loading: true));
        dynamic data = await controller.search(
            handleQuery(state.filterValue), current, state.filterValue.sort?.id??"");
        SearchModel mergeData = state.searchResponse.copyWith(data: [
          ...state.searchResponse.data,
          ...SearchModel.fromData(data).data
        ], currentPage: data.page);
        emit(state.copyWith(data: mergeData, loading: false));
      }
    });
    on<HandleTapItemInSort>((HandleTapItemInSort event, emit) async {
      FilterModel filter = state.filterValue.copyWith(sort: event.itemFilterContent);
      emit(state.copyWith(loadPage: true, filterValue: filter));
      String query = handleQuery(filter);
      dynamic data =
      await controller.search(query, 0, event.itemFilterContent.id);
      emit(state.copyWith(
          data: SearchModel.fromData(data),
          loadPage: false));
    });
    on<GetKeyword>((GetKeyword event, emit) async {
      PopularKeyword popularKeyword =
          await searchSuggestionController.getKeyword();
      emit(state.copyWith(popularKeyword: popularKeyword));
    });
    on<SearchSuggestion>((SearchSuggestion event, emit) async {
      if (checkEmpty(event.search ?? "").isNotEmpty) {
        SearchSuggestionModel data = await controller.getListSuggestion(event.search!);
        emit(state.copyWith(suggestion:matchRegex(data.data ?? [],event.search! ).toList()));
      } else {
        emit(state.copyWith(suggestion: []));
      }
    });
    on<ResetFilter>((ResetFilter event, emit) async {
      FilterModel filter = FilterModel(
        selectCatalogs: [],
        rating: 0,
        selectRegions: [],
        maxPrice: TextEditingController(),
        minPrice: TextEditingController(),
        sort: state.filterValue.sort,
        searchTerm:
            TextEditingController(text: state.filterValue.searchTerm.text),
        service: [],
        selectFoodCatalogs: [],
        discountPercent: 0,
        quick: ""
      );
      emit(state.copyWith(loadPage: true));
      String query = handleQuery(filter);
      dynamic data = await controller.search(query, 0, "");
      emit(state.copyWith(
        data: SearchModel.fromData(data),
        filterValue: filter,
        loadPage: false,
      ));
    });
  }

  List<ItemFilterContent> handleTapItemInSection(
      List<ItemFilterContent> dataSelected, ItemFilterContent item) {
    List<ItemFilterContent> data = dataSelected;
    if (data.contains(item)) {
      data.remove(item);
    } else {
      data.add(item);
    }
    return data;
  }

  handleQuery(FilterModel filterValue) {
    QueryBuilder query = QueryBuilder();
    if (filterValue.selectCatalogs.isNotEmpty) {
      handleListQuery(
          query
              .field(fieldNameFilter.catalog)
              .equal(filterValue.selectCatalogs[0].id),
          filterValue.selectCatalogs);
    }
    if (filterValue.selectFoodCatalogs.isNotEmpty &&
        fieldNameFilter.catalogFood != null) {
      handleListQuery(
          query
              .field(fieldNameFilter.catalogFood!)
              .equal(filterValue.selectFoodCatalogs[0].id),
          filterValue.selectFoodCatalogs);
    }
    if (filterValue.service?.isNotEmpty ?? false) {
      for (ItemFilterContent item in filterValue.service) {
        query.field(item.id).equal("true").then();
      }
    }
    if (filterValue.selectRegions.isNotEmpty) {
      handleListQuery(
          query
              .field(fieldNameFilter.regions)
              .equal(filterValue.selectRegions[0].id),
          filterValue.selectRegions);
    }
    if (fieldNameFilter.price != null) {
      if (filterValue.maxPrice.text.isNotEmpty &&
          filterValue.minPrice.text.isNotEmpty) {
        if (int.parse(filterValue.maxPrice.text) >
            int.parse(filterValue.minPrice.text)) {
          query
              .field(fieldNameFilter.price!)
              .inRange(filterValue.minPrice.text, filterValue.maxPrice.text)
              .then();
        } else {
          query
              .field(fieldNameFilter.price!)
              .inRange(filterValue.maxPrice.text, filterValue.minPrice.text)
              .then();
        }
      } else {
        if (filterValue.maxPrice.text.isNotEmpty &&
            filterValue.maxPrice.text != " ") {
          query
              .field(fieldNameFilter.price!)
              .lessThanOrEqual(filterValue.maxPrice.text)
              .then();
        } else {
          if (filterValue.minPrice.text.isNotEmpty) {
            query
                .field(fieldNameFilter.price!)
                .greaterThanOrEqual(filterValue.minPrice.text)
                .then();
          }
        }
      }
    }
    if (filterValue.rating > 0) {
      if (filterValue.rating == 5) {
        query
            .field(fieldNameFilter.rating)
            .equal(filterValue.rating.toString())
            .then();
      } else {
        query
            .field(fieldNameFilter.rating)
            .greaterThanOrEqual(filterValue.rating.toString())
            .then();
      }
    }
    if (checkEmpty(filterValue.searchTerm.text).isNotEmpty) {
      query
          .field(fieldNameFilter.searchTerm)
          .contain(filterValue.searchTerm.text)
          .then();
    }
    if(filterValue.discountPercent != 0) {
      query
          .field(fieldNameFilter.discountPercent!)
          .greaterThanOrEqual(filterValue.discountPercent.toString())
          .then();

    }
    if(filterValue.quick != "") {
      query
          .field(fieldNameFilter.quick!)
          .equal(filterValue.quick.toString())
          .then();
    }
    return query.build();
  }

  QueryBuilder handleListQuery(
      MultipleValueSelected query, List<ItemFilterContent> data) {
    for (var i = 1; i < data.length; i++) {
      query.or(data[i].id);
    }

    return query.then();
  }

  String checkEmpty(String value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i] != " ") {
        return value;
      }
    }
    return "";
  }
  Future<void> saveHistory(String name) async {
    final pref = await SharedPreferences.getInstance();
    List<String> data = await getHistory();
    if (checkEmpty(name).isNotEmpty && !data.contains(name)) {
      data.add(name);
      pref.setStringList(sharedPreferencesKey, data);
    }
  }

  Future<void> deleteHistory(String name) async {
    final pref = await SharedPreferences.getInstance();
    List<String> data = await getHistory()
      ..remove(name);
    pref.setStringList(sharedPreferencesKey, data);
  }

  Future<List<String>> getHistory() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(sharedPreferencesKey) ?? [];
  }

  List<String> formatHistory(List<String> data) {
    for (String term in data) {
      if (checkEmpty(term).isEmpty || data.contains(term)) {}
    }
    return data;
  }

  Set<String> matchRegex(List<String> listOfStrings, String typingText) {
    if (typingText.isEmpty) {
      return const <String>{};
    }
    Set<String> results = {};
    for (String string in listOfStrings) {
      RegExp match = RegExp(
          r'((\w+)?\s)?(\w*' + RegExp.escape(typingText) + r'\w*)(\s(\w+\b))?',caseSensitive: false);
      Match? matchResult = match.firstMatch(string);
      if (matchResult != null) {
        results.add(matchResult.group(3)!.trim().toLowerCase());
        if(matchResult.group(1)!=null) {
          results.add('${matchResult.group(1)}${matchResult.group(3)}'.trim().toLowerCase());
        }
        if(matchResult.group(4)!=null) {
          results.add('${matchResult.group(3)}${matchResult.group(4)}'.trim().toLowerCase());
        }
        results.add(matchResult.group(0)!.trim().toLowerCase());
      }
    }
    return results;
  }

}
