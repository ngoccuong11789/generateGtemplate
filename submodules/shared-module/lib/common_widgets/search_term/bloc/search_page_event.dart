part of 'search_page_bloc.dart';

class SearchPageEvent {}

class Search extends SearchPageEvent {
  final FilterModel searchTerm;
  final FieldNameFilter? fieldNameFilter;
  final String? search;
  Search({required this.searchTerm,this.fieldNameFilter,this.search});
}
class GetDataForFilter extends SearchPageEvent {
  final FilterModel searchTerm;
  GetDataForFilter(this.searchTerm);
}

class LoadMore extends SearchPageEvent {}
class ResetFilter extends SearchPageEvent {}

class HandleTapItemInSection extends SearchPageEvent {
  final ItemFilterContent itemFilterContent;
  final TypeSectionEnum type;
  HandleTapItemInSection(this.itemFilterContent, this.type);
}
class HandleTapItemInSort extends SearchPageEvent {
  final ItemFilterContent itemFilterContent;
  HandleTapItemInSort(this.itemFilterContent);
}

class SearchSuggestion extends SearchPageEvent {
  final String? search;
  SearchSuggestion(this.search);
}
class GetKeyword extends SearchPageEvent {}
class ClearSearch extends SearchPageEvent {}