import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/search_page/api/search_controller.dart';
import 'package:shared_module/features/search_page/bloc/SearchEvent.dart';
import 'package:shared_module/features/search_page/model/FilterModel.dart';
import 'package:shared_module/features/search_page/model/SearchLocation.dart';
import 'package:shared_module/features/search_page/model/ecommerce_search_result.dart'
    as ecommerce;
import 'package:shared_module/features/search_page/model/food_search_result.dart'
    as food;
import 'package:shared_module/shared_module.dart';

import 'SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final dio = SharedModule.appDelegates!.dio;

  Future<ecommerce.EcommerceSearchResult> searchEcommerceWithContent(
      {required FilterModel filterModel, int indexPage = 0}) async {
    try {
      Map<String, dynamic> queryParameters = {
        "pageNum": indexPage,
        "pageSize": 10,
        "filters":
            "${state.currentCity != null ? "province.id@=${state.currentCity!.provinceId}" : ""},${filterModel.searchTerm.isEmpty ? "" : "name@=${filterModel.searchTerm}"},${ecommerceQuery(filterModel)}"
      };
      print(
          "${filterModel.searchTerm.isEmpty ? "" : "name@=${filterModel.searchTerm}"},${ecommerceQuery(filterModel)}");
      return await SearchController(dio)
          .getEcommerceResultList(queryParameters);
    } catch (error) {
      print(error);
      return ecommerce.EcommerceSearchResult();
    }
  }

  Future<food.FoodSearchResult> searchFoodWithContent(
      {required FilterModel filterModel, int indexPage = 0}) async {
    try {
      Map<String, dynamic> queryParameters = {
        "pageNum": indexPage,
        "pageSize": 10,
        "foodPageSize": 10,
        "filters":
            "${state.currentCity != null ? "province.id@=${state.currentCity!.provinceId}" : ""},${filterModel.searchTerm.isEmpty ? "" : "name@=${filterModel.searchTerm}"},${foodQuery(filterModel)}"
      };
      print(
          "${filterModel.searchTerm.isEmpty ? "" : "name@=${filterModel.searchTerm}"},${foodQuery(filterModel)}");
      return await SearchController(dio).getFoodResultList(queryParameters);
    } catch (error) {
      print(error);
      return food.FoodSearchResult();
    }
  }

  String foodQuery(FilterModel data) {
    String res = "";
    String params = "";
    for (var i in data.rating) {
      res += "rating>=${i.name},";
    }
    params = "";
    for (var i in data.district) {
      params += "${i.id}|";
    }
    if (params.isNotEmpty) {
      res += "district.id@=$params,";
    }
    params = "";
    for (var i in data.restaurantType) {
      params += "${i.id}|";
    }
    if (params.isNotEmpty) {
      res += "restaurant_type_ids==$params,";
    }
    return res;
  }

  String ecommerceQuery(FilterModel data) {
    String res = "";
    String params = "";
    for (var i in data.rating) {
      res += "rating>=${i.name},";
    }
    params = "";
    for (var i in data.district) {
      params += "${i.id}|";
    }
    if (params.isNotEmpty) {
      res += "district.id@=$params,";
    }
    params = "";
    for (var i in data.restaurantType) {
      params += "${i.id}|";
    }
    if (params.isNotEmpty) {
      res += "restaurant_type_ids==$params,";
    }
    return res;
  }

  SearchBloc()
      : super(SearchState(
          buyType: BUYTYPE.ecommerce,
          filterModel: FilterModel(
            searchTerm: "",
            restaurantType: [],
            district: [],
            rating: [],
            isFilter: false,
          ),
        )) {
    on<SaveCityId>(
      (event, emit) async {
        SearchLocation a =
            await SearchController(dio).getLocations(event.cityId);
        emit(state.copyWith(currentCity: a));
      },
    );
    on<SaveBuyTypeEvent>((event, emit) {
      emit(state.copyWith(buyType: event.buyType));
    });

    on<InitialLoadingFilter>((event, emit) async {
      food.FoodSearchResult searchResult =
          await searchFoodWithContent(filterModel: state.filterModel);

      List<FilterElementModel> restaurantTypes = [];
      List<FilterElementModel> restaurantLocations = [];
      for (var restaurant in searchResult.data as List<food.Data>) {
        if (!restaurantTypes.any(
          (element) => element.id == restaurant.restaurantTypeIds?[0],
        )) {
          restaurantTypes.add(FilterElementModel(
              name: restaurant.restaurantTypes?[0] ?? "Others",
              id: restaurant.restaurantTypeIds?[0] ?? ""));
          restaurantLocations.add(FilterElementModel(
              name: restaurant.district?.name ?? "Others",
              id: restaurant.district?.id ?? ""));
        }
      }

      emit(state.copyWith(
        categories: restaurantTypes,
        locations: restaurantLocations,
        ratingStars: [
          FilterElementModel(id: "5", name: "5"),
          FilterElementModel(id: "4", name: "4"),
          FilterElementModel(id: "3", name: "3"),
          FilterElementModel(id: "2", name: "2"),
          FilterElementModel(id: "1", name: "1"),
        ],
      ));
    });

    on<Filter>((event, emit) async {
      try {
        if (state.buyType == BUYTYPE.ecommerce) {
          ecommerce.EcommerceSearchResult dataProduct =
              await searchEcommerceWithContent(filterModel: event.filterModel);
          emit(state.copyWith(
              dataProduct: dataProduct, filterModel: event.filterModel));
        } else {
          food.FoodSearchResult dataFood =
              await searchFoodWithContent(filterModel: event.filterModel);
          emit(state.copyWith(
              dataFood: dataFood, filterModel: event.filterModel));
        }
      } catch (error) {
        print(error);
      }
    });

    on<Pagination>((event, emit) async {
      try {
        if (state.buyType == BUYTYPE.ecommerce) {
          ecommerce.EcommerceSearchResult dataProduct = await searchEcommerceWithContent(
              filterModel: state.filterModel, indexPage: event.index);
          emit(state.copyWith(dataProduct: dataProduct));
        } else {
           food.FoodSearchResult dataFood = await searchFoodWithContent(
              filterModel: state.filterModel, indexPage: event.index);
          emit(state.copyWith(dataFood: dataFood));
        }
      } catch (error) {
        print(error);
      }
    });
  }
}
