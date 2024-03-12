import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/features/auth/auth_controller.dart';
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_controller.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/select_category.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/send_request_open_restaurant.dart';
import 'package:shared_module/features/request_open_shop_page/model/input_variables/user_model.dart';
import 'package:shared_module/features/update_shop/bloc/update_shop_controller.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/shared_module.dart';

import '../model/restaurant_model.dart';

part 'request_to_open_restaurant_event.dart';

part 'request_to_open_restaurant_state.dart';

class RequestToOpenRestaurantBloc
    extends Bloc<RequestToOpenRestaurantEvent, RequestToOpenRestaurantState> {

  final RequestToOpenRestaurantController requestToOpenRestaurantController =
      RequestToOpenRestaurantController(SharedModule.appDelegates!.dio);

  RequestToOpenRestaurantBloc() : super(const RequestToOpenRestaurantState()) {
    on<HandleGetListCountries>((event, emit) async {
      final listCountries = await requestToOpenRestaurantController.getListCountries();
      emit(
        state.copyWith(listCountries: Optional.of(listCountries)),
      );
    });

    on<HandleSelectedCountries>((event, emit) async {
      final listProvinceByCountriesId = await requestToOpenRestaurantController
          .getListProvincesByCountryId(event.countries.countryId ?? "");
      emit(state.copyWith(
        selectedCountries: Optional.of(event.countries),
        listProvinces: Optional.of(listProvinceByCountriesId),
        selectedProvince: Optional.empty(),
        selectedDistrict: Optional.empty(),
      ));
    });

    on<HandleSelectedProvinces>((event, emit) async {
      final dataDistrict = await requestToOpenRestaurantController
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

    on<ChangeInputFieldRestaurant>((event, emit) async {
      RestaurantModel restaurantModel = RestaurantModel(
          addressLineOne: event.restaurantModel.addressLineOne,
          merchantName: event.restaurantModel.merchantName,
          addressLineTwo: event.restaurantModel.addressLineTwo);
      emit(state.copyWith(restaurantModel: restaurantModel));
    });

    on<ChangeInputFieldUser>((event, emit) async {
      UserModel userModel = UserModel(
          fullName: event.userModel.fullName,
          email: event.userModel.email,
          phoneNumber: event.userModel.phoneNumber);
      emit(state.copyWith(userModel: userModel));
    });

    on<HandleGetUserInformation>((event, emit) async {
      AuthController authController = AuthController.instance;
      String? stringAuthModel = await authController.getAuthModel();
      Map<String, dynamic> valueMap = jsonDecode(stringAuthModel!);

      AuthModel authModel = AuthModel.fromJson(valueMap);
      final userInfo = await requestToOpenRestaurantController
          .handleGetUserInformation(authModel.user.id);
      UserModel userModel = UserModel(
          fullName: userInfo.fullName ?? "",
          phoneNumber: userInfo.phone ?? "",
          email: userInfo.email ?? "");
      emit(state.copyWith(userModel: userModel));
    });

    on<HandleGetListCategory>((event, emit) async {
      final result =
          await requestToOpenRestaurantController.handleGetListCategory();
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

    on<SendRequest>(
      (event, emit) async {
        CountryRestaurantRequest countryRestaurantRequest =
            CountryRestaurantRequest(
                id: event.country.countryId,
                name: event.country.countryName,
                code: event.country.codeName);

        ProvinceRestaurantRequest provinceRestaurantRequest =
            ProvinceRestaurantRequest(
                id: event.province.provinceId,
                name: event.province.provinceName,
                code: event.province.codeName);

        DistrictRestaurantRequest districtRestaurantRequest =
            DistrictRestaurantRequest(
                id: event.district.districtId,
                name: event.district.districtName,
                code: event.district.codeName);

        DateTime openTime = DateTime.now();
        DateTime dateTimeOpen = DateTime(
          openTime.year,
          openTime.month,
          openTime.day,
          event.openTime.hour,
          event.openTime.minute,
        );

        DateTime closeTime = DateTime.now();
        DateTime dateTimeClose = DateTime(
          closeTime.year,
          closeTime.month,
          closeTime.day,
          event.closedTime.hour,
          event.closedTime.minute,
        );

        SendRequestOpenRestaurant request = SendRequestOpenRestaurant(
            event.name,
            countryRestaurantRequest,
            provinceRestaurantRequest,
            districtRestaurantRequest,
            event.street,
            event.subStreet,
            event.restaurantTypeIds,
            event.restaurantTypes,
            event.ownerName,
            event.email,
            event.phone,
            event.idCard,
            dateTimeOpen,
            dateTimeClose);
        final data = await requestToOpenRestaurantController
            .handleCreateNewRestaurant(request);
      },
    );
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

  String choosingText(bool opening) {
    if (opening && state.openingTime != const TimeOfDay(hour: 0, minute: 0)) {
      return "${state.openingTime.hour}:${state.openingTime.minute == 0 ? "00" : state.openingTime.minute}";
    } else if (!opening &&
        state.closedTime != const TimeOfDay(hour: 0, minute: 0)) {
      return "${state.closedTime.hour}:${state.closedTime.minute == 0 ? "00" : state.closedTime.minute}";
    }
    return "Time";
  }

  bool sendRequest() {
    bool checkSelectedTime = state.openingTime.hour <= state.closedTime.hour ||
        (state.openingTime.hour == state.closedTime.hour && state.openingTime.minute <= state.closedTime.minute);
    bool isNameRestaurant = state.restaurantModel.merchantName.isNotEmpty && state.restaurantModel.addressLineOne.isNotEmpty;
    bool isCheckUserInfo = state.userModel.fullName.isNotEmpty && isEmail( state.userModel.email) && state.userModel.phoneNumber.isNotEmpty;
    return state.openingTime != const TimeOfDay(hour: 0, minute: 0) &&
        state.closedTime != const TimeOfDay(hour: 0, minute: 0) && checkSelectedTime && isNameRestaurant && isCheckUserInfo;
  }
  bool isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    return emailRegex.hasMatch(email);
  }
}
