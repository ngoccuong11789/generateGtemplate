import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/restaurant_model.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/select_category.dart';
import 'package:shared_module/features/update_restaurant/bloc/update_restaurant_controller.dart';
import 'package:shared_module/features/update_restaurant/model/restaurant_update_request.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/shared_module.dart';

import '../../request_open_restaurant_page/model/category_restaurant.dart';
import '../../request_open_shop_page/model/input_variables/user_model.dart';

part 'update_restaurant_event.dart';

part 'update_restaurant_state.dart';

class UpdateRestaurantBloc
    extends Bloc<UpdateRestaurantEvent, UpdateRestaurantState> {
  final UpdateRestaurantController updateRestaurantController =
      UpdateRestaurantController(SharedModule.appDelegates!.dio);

  UpdateRestaurantBloc() : super(const UpdateRestaurantState()) {
    on<HandleGetRestaurantInfo>((event, emit) async {
      final restaurantInfo =
          await updateRestaurantController.handleGetRestaurantInfo();

      RestaurantModel restaurantModel = RestaurantModel(
        merchantName: restaurantInfo.name ?? "",
        addressLineOne: restaurantInfo.street ?? "",
        addressLineTwo: restaurantInfo.subStreet ?? "",
      );

      UserModel userModel = UserModel(
          email: restaurantInfo.email ?? "",
          phoneNumber: restaurantInfo.phone ?? "",
          fullName: restaurantInfo.ownerName ?? "");

      Countries countries = Countries(
          countryId: restaurantInfo.country?.id,
          codeName: restaurantInfo.country?.code,
          countryName: restaurantInfo.country?.name);

      Provinces provinces = Provinces(
          provinceId: restaurantInfo.province?.id,
          codeName: restaurantInfo.province?.code,
          provinceName: restaurantInfo.province?.name,
          countryId: restaurantInfo.country?.id);

      District district = District(
        districtId: restaurantInfo.district?.id,
        codeName: restaurantInfo.district?.code,
        districtName: restaurantInfo.district?.name,
        provinceId: restaurantInfo.province?.id,
      );

      List<Provinces> listProvince = await updateRestaurantController
          .getListProvincesByCountryId(restaurantInfo.country?.id ?? "");

      List<District> listDistrict = await updateRestaurantController
          .getListDistrictByProvinceId(restaurantInfo.province?.id ?? "");

      List<bool> listChooseCategoryIndex = [...state.selectCategory.indexList];

      for (int i = 0; i < state.selectCategory.categoryList.length; i++) {
        if ((restaurantInfo.restaurantTypeIds ?? [])
            .contains(state.selectCategory.categoryList[i].id)) {
          listChooseCategoryIndex[i] = true;
        }
      }

      emit(state.copyWith(
          restaurantModel: restaurantModel,
          userModel: userModel,
          listProvinces: Optional.of(listProvince),
          listDistrict: Optional.of(listDistrict),
          selectedCountries: Optional.of(countries),
          selectedProvince: Optional.of(provinces),
          selectedDistrict: Optional.of(district),
          openingTime:
              TimeOfDay.fromDateTime(restaurantInfo.openTime ?? DateTime.now()),
          closedTime: TimeOfDay.fromDateTime(
              restaurantInfo.closedTime ?? DateTime.now()),
          selectCategory: state.selectCategory
              .copyWith(indexList: listChooseCategoryIndex)));
    });

    on<ChangeInputFieldRestaurant>((event, emit) async {
      RestaurantModel restaurantModel = RestaurantModel(
          addressLineOne: event.restaurantModel.addressLineOne,
          merchantName: event.restaurantModel.merchantName,
          addressLineTwo: event.restaurantModel.addressLineTwo);
      emit(state.copyWith(restaurantModel: restaurantModel));
    });

    on<HandleGetListCountries>((event, emit) async {
      final listCountries = await updateRestaurantController.getListCountries();
      emit(
        state.copyWith(listCountries: Optional.of(listCountries)),
      );
    });

    on<HandleSelectedCountries>((event, emit) async {
      final listProvinceByCountriesId = await updateRestaurantController
          .getListProvincesByCountryId(event.countries.countryId ?? "");
      emit(state.copyWith(
        selectedCountries: Optional.of(event.countries),
        listProvinces: Optional.of(listProvinceByCountriesId),
        selectedProvince: Optional.empty(),
        selectedDistrict: Optional.empty(),
      ));
    });

    on<HandleSelectedProvinces>((event, emit) async {
      final dataDistrict = await updateRestaurantController
          .getListDistrictByProvinceId((event.provinces.provinceId ?? ''));
      emit(state.copyWith(
        selectedProvince: Optional.of(event.provinces),
        listDistrict: Optional.of(dataDistrict),
        selectedDistrict: Optional.empty(),
      ));
    });

    on<HandleSelectedDistrict>((event, emit) async {
      emit(state.copyWith(
        selectedDistrict: Optional.of(event.district),
      ));
    });

    on<HandleGetListCategory>((event, emit) async {
      final result =
          await updateRestaurantController.getListCategoryRestaurant();
      List<bool> indexList = [];
      List<Category> categoryList = [];
      for (int i = 0; i < result.data!.length; i++) {
        bool index = false;
        indexList.add(index);
        categoryList.add(result.data![i]);
      }
      emit(state.copyWith(
          listCategory: result.data,
          selectCategory: state.selectCategory
              .copyWith(indexList: indexList, categoryList: categoryList)));
    });

    on<ChangeCategory>(
      (event, emit) {
        List<bool> newIndexList = [...state.selectCategory.indexList];
        newIndexList[event.index] = !newIndexList[event.index];
        emit(
          state.copyWith(
            selectCategory:
                state.selectCategory.copyWith(indexList: newIndexList),
          ),
        );
      },
    );

    on<DeleteCategory>(
      (event, emit) {
        List<Category> newCategoryList = [...state.selectCategory.categoryList];
        int index = newCategoryList.indexOf(event.category);
        List<bool> newIndexList = [...state.selectCategory.indexList];
        newIndexList[index] = false;
        emit(
          state.copyWith(
            selectCategory:
                state.selectCategory.copyWith(indexList: newIndexList),
          ),
        );
      },
    );

    on<ChangeTimes>(
      (event, emit) {
        event.opening
            ? emit(state.copyWith(openingTime: event.newTime))
            : emit(state.copyWith(closedTime: event.newTime));
      },
    );

    on<UpdateRestaurant>((event, emit) async {
      final restaurantInfo =
          await updateRestaurantController.handleGetRestaurantInfo();
      CountryRequest countryRequest = CountryRequest(
        id: event.country.countryId,
        name: event.country.countryName,
        code: event.country.codeName,
      );

      ProvinceRequest provinceRequest = ProvinceRequest(
          id: event.province?.provinceId,
          name: event.province?.provinceName,
          code: event.province?.codeName);

      DistrictRequest districtRequest = DistrictRequest(
          id: event.district.districtId,
          name: event.district.districtName,
          code: event.district.codeName);

      RestaurantUpdateRequest request = RestaurantUpdateRequest(
          event.name,
          countryRequest,
          provinceRequest,
          districtRequest,
          event.street,
          event.subStreet,
          event.restaurantTypeIds,
          event.restaurantTypes,
          event.ownerName,
          event.email,
          event.phone,
          event.idCard,
          event.openTime,
          event.closedTime);

      await updateRestaurantController.updateRestaurant(request, restaurantInfo.id ?? "");
    });
  }

  List<Category> getChosenCategory() {
    List<Category> ret = [];
    int length = state.selectCategory.categoryList.length;
    for (int i = 0; i < length; i++) {
      if (state.selectCategory.indexList[i] == true) {
        ret.add(state.selectCategory.categoryList[i]);
      }
    }
    return ret;
  }

  String formatTime(TimeOfDay time) {
    return "${time.hour}:${time.minute == 0 ? "00" : time.minute}";
  }

  bool sendRequest() {
    bool checkSelectedTime = state.openingTime.hour <= state.closedTime.hour ||
        (state.openingTime.hour == state.closedTime.hour && state.openingTime.minute <= state.closedTime.minute);
    bool isNameRestaurant = state.restaurantModel.merchantName.isNotEmpty && state.restaurantModel.addressLineOne.isNotEmpty;
    return state.openingTime != const TimeOfDay(hour: 0, minute: 0) &&
        state.closedTime != const TimeOfDay(hour: 0, minute: 0) && checkSelectedTime && isNameRestaurant;
  }
}
