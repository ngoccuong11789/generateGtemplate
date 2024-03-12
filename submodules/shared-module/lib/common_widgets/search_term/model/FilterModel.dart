import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../filter_common/model/item_filter_content.dart';

class FilterModel extends Equatable {
  final List<ItemFilterContent> selectRegions;
  final List<ItemFilterContent> selectCatalogs;
  final List<ItemFilterContent> selectFoodCatalogs;
  final List<ItemFilterContent> service;
  final int rating;
  final TextEditingController minPrice;
  final TextEditingController maxPrice;
  final ItemFilterContent? sort;
  final TextEditingController searchTerm;
  final int? discountPercent;
  final String? quick;

  const FilterModel(
      {required this.selectRegions,
      required this.selectCatalogs,
      required this.rating,
      this.sort,
      required this.service,
      required this.searchTerm,
      required this.maxPrice,
      required this.selectFoodCatalogs,
      required this.minPrice,
      required this.discountPercent,
      required this.quick});

  FilterModel copyWith(
          {List<ItemFilterContent>? selectRegions,
          List<ItemFilterContent>? selectCatalogs,
          List<ItemFilterContent>? service,
          List<ItemFilterContent>? selectFoodCatalogs,
          int? rating,
          String? max,
          ItemFilterContent? sort,
          String? searchTerm,
          String? min,
          int? discountPercent,
          String? quick}) =>
      FilterModel(
        selectRegions: selectRegions ?? this.selectRegions,
        selectCatalogs: selectCatalogs ?? this.selectCatalogs,
        rating: rating ?? this.rating,
        maxPrice: TextEditingController(text: max ?? maxPrice.text),
        minPrice: TextEditingController(text: min ?? minPrice.text),
        sort: sort ?? this.sort,
        service: service ?? this.service,
        searchTerm:
            TextEditingController(text: searchTerm ?? this.searchTerm.text),
        selectFoodCatalogs: selectFoodCatalogs ?? this.selectFoodCatalogs,
        discountPercent: discountPercent ?? this.discountPercent,
        quick: quick ?? this.quick
      );

  @override
  List<Object?> get props => [
        selectRegions,
        selectCatalogs,
        rating,
        sort,
        service,
        maxPrice,
        minPrice,
        searchTerm,
        selectFoodCatalogs,
        discountPercent
      ];

  bool validate() {
    if (selectRegions.isEmpty &&
        selectCatalogs.isEmpty &&
        selectFoodCatalogs.isEmpty &&
        minPrice.text.isEmpty &&
        maxPrice.text.isEmpty &&
        service.isEmpty &&
        searchTerm.text.isEmpty &&
        discountPercent == null &&
        quick == null &&
        rating < 1) {
      return false;
    }
    return true;
  }

  bool onlyFilter() {
    if (selectRegions.isEmpty &&
        selectCatalogs.isEmpty &&
        selectFoodCatalogs.isEmpty &&
        minPrice.text.isEmpty &&
        maxPrice.text.isEmpty &&
        service.isEmpty &&
        rating < 1) {
      return false;
    }
    return true;
  }
}

FilterModel newFilterModel() {
  return FilterModel(
      selectRegions: [],
      selectCatalogs: [],
      service: [],
      rating: 0,
      searchTerm: TextEditingController(),
      maxPrice: TextEditingController(),
      minPrice: TextEditingController(),
      selectFoodCatalogs: [],
      discountPercent: 0,
      quick: "");
}
