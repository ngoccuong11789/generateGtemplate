import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/update_restaurant/bloc/update_restaurant_bloc.dart';
import 'package:shared_module/features/update_restaurant/views/form_screen/restaurant_information.dart';
import 'package:shared_module/features/update_restaurant/views/waiting_approve.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import '../../request_open_restaurant_page/widgets/bottom_action_bar.dart';

class UpdateRestaurantFormScreen extends StatefulWidget {
  const UpdateRestaurantFormScreen({super.key});

  @override
  State<UpdateRestaurantFormScreen> createState() =>
      _UpdateRestaurantFormScreenState();
}

class _UpdateRestaurantFormScreenState
    extends State<UpdateRestaurantFormScreen> {
  final UpdateRestaurantBloc bloc = UpdateRestaurantBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<UpdateRestaurantBloc, UpdateRestaurantState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(
              titleAppbar: SharedLocalizations.of(context)!.restaurantInfo,
            ),
            backgroundColor: ColorPalette.gray100,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const RestaurantInformation(),
                  const SizedBox(
                    height: 12,
                  ),
                  BottomActionBar(
                    controller: bloc.sendRequest(),
                    text: SharedLocalizations.of(context)!.save,
                    onPressed: () {
                      List<String> listCategoryIds = [];
                      for (var i = 0;
                          i < state.selectCategory.indexList.length;
                          i++) {
                        if (state.selectCategory.indexList[i] == true) {
                          listCategoryIds.add(
                              state.selectCategory.categoryList[i].id ?? "");
                        }
                      }
                      List<String> listCategoryTypes = [];
                      for (var i = 0;
                          i < state.selectCategory.indexList.length;
                          i++) {
                        if (state.selectCategory.indexList[i] == true) {
                          listCategoryTypes.add(
                              state.selectCategory.categoryList[i].name ?? "");
                        }
                      }
                      DateTime currentDate = DateTime.now();
                      DateTime openingTime = DateTime(
                        currentDate.year,
                        currentDate.month,
                        currentDate.day,
                        state.openingTime.hour,
                        state.openingTime.minute,
                      );
                      DateTime closeTime = DateTime(
                        currentDate.year,
                        currentDate.month,
                        currentDate.day,
                        state.closedTime.hour,
                        state.closedTime.minute,
                      );
                      BlocProvider.of<UpdateRestaurantBloc>(context).add(
                        UpdateRestaurant(
                            state.restaurantModel.merchantName,
                            state.selectedCountries ?? Countries(),
                            state.selectedProvince ?? Provinces(),
                            state.selectedDistrict ?? District(),
                            state.restaurantModel.addressLineOne,
                            state.restaurantModel.addressLineTwo,
                            listCategoryIds,
                            listCategoryTypes,
                            state.userModel.fullName,
                            state.userModel.email,
                            state.userModel.phoneNumber,
                            state.userModel.idCard,
                            openingTime,
                            closeTime),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return WaitingApproveRestaurant(
                              userModel: state.userModel,
                              restaurantModel: state.restaurantModel,
                              listChooseCategory: listCategoryTypes,
                              dataCountries: state.selectedCountries ?? Countries(),
                              dataProvinces: state.selectedProvince ?? Provinces(),
                              dataDistrict: state.selectedDistrict ?? District(),);
                        },
                      ));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
