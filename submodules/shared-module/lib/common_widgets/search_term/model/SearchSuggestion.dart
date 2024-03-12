import 'dart:convert';
/// page : 0
/// pageSize : 10
/// totalElement : 4
/// data : ["Iphone 14 ProMax","Iphone 14 Plus","HipHop Hoodie","Case iPhone"]

SearchSuggestionModel searchSuggestionFromJson(String str) => SearchSuggestionModel.fromJson(json.decode(str));
String searchSuggestionToJson(SearchSuggestionModel data) => json.encode(data.toJson());
class SearchSuggestionModel {
  SearchSuggestionModel({
      num? page, 
      num? pageSize, 
      num? totalElement, 
      List<String>? data,}){
    _page = page;
    _pageSize = pageSize;
    _totalElement = totalElement;
    _data = data;
}

  SearchSuggestionModel.fromJson(dynamic json) {
    _page = json['page'];
    _pageSize = json['pageSize'];
    _totalElement = json['totalElement'];
    _data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  num? _page;
  num? _pageSize;
  num? _totalElement;
  List<String>? _data;
  SearchSuggestionModel copyWith({  num? page,
  num? pageSize,
  num? totalElement,
  List<String>? data,
}) => SearchSuggestionModel(  page: page ?? _page,
  pageSize: pageSize ?? _pageSize,
  totalElement: totalElement ?? _totalElement,
  data: data ?? _data,
);
  num? get page => _page;
  num? get pageSize => _pageSize;
  num? get totalElement => _totalElement;
  List<String>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['pageSize'] = _pageSize;
    map['totalElement'] = _totalElement;
    map['data'] = _data;
    return map;
  }

}