import 'package:shared_module/features/search_page/model/FilterModel.dart';

List<FilterElementModel> sorts = ([
  FilterElementModel(name: "Price: Low to High", id: "priceLowToHigh"),
  FilterElementModel(name: "Price: High to Low", id: "priceHighToLow"),
  FilterElementModel(name: "Rating: Low to High", id: "ratingLowToHigh"),
  FilterElementModel(name: "Rating: High to Low", id: "ratingHighToLow"),
  FilterElementModel(name: "Best Seller", id: "bestSeller"),
  FilterElementModel(name: "Newest Arrival", id: "newArrival"),
]);

List<FilterElementModel> ratingStars = [
  FilterElementModel(id: "5", name: "5"),
  FilterElementModel(id: "4", name: "4"),
  FilterElementModel(id: "3", name: "3"),
  FilterElementModel(id: "2", name: "2"),
  FilterElementModel(id: "1", name: "1"),
];
