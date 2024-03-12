import 'package:equatable/equatable.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/search_page/model/FilterModel.dart';
import 'package:shared_module/features/search_page/model/SearchLocation.dart';
import 'package:shared_module/features/search_page/model/ecommerce_search_result.dart';
import 'package:shared_module/features/search_page/model/food_search_result.dart';

class SearchState extends Equatable {
  final EcommerceSearchResult? dataProduct;
  final FoodSearchResult? dataFood;
  final FilterModel filterModel;
  final SearchLocation? currentCity;
  final List<FilterElementModel>? locations;
  final List<FilterElementModel>? categories;
  final List<FilterElementModel>? ratingStars;
  final BUYTYPE buyType;

  const SearchState({
    this.currentCity,
    this.dataProduct,
    this.dataFood,
    required this.filterModel,
    this.locations,
    this.categories,
    this.ratingStars,
    required this.buyType,
  });

  @override
  List<Object?> get props =>
      [currentCity, dataProduct, filterModel, locations, categories];

  SearchState copyWith({
    EcommerceSearchResult? dataProduct,
    FoodSearchResult? dataFood,
    FilterModel? filterModel,
    SearchLocation? currentCity,
    List<FilterElementModel>? locations,
    List<FilterElementModel>? categories,
    List<FilterElementModel>? ratingStars,
    BUYTYPE? buyType,
  }) {
    return SearchState(
        dataProduct: dataProduct ?? this.dataProduct,
        dataFood: dataFood ?? this.dataFood,
        filterModel: filterModel ?? this.filterModel,
        currentCity: currentCity ?? this.currentCity,
        locations: locations ?? this.locations,
        categories: categories ?? this.categories,
        ratingStars: ratingStars ?? this.ratingStars,
        buyType: buyType ?? this.buyType);
  }
}
