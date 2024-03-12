import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_bloc.dart';
import 'package:shared_module/features/request_open_restaurant_page/views/form_screen/restaurant_information.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../widgets/bottom_action_bar.dart';
import 'form_screen/user_information.dart';
import 'sucess.dart';

class FormScreen extends StatefulWidget {
  FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final RequestToOpenRestaurantBloc bloc = RequestToOpenRestaurantBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<RequestToOpenRestaurantBloc,
          RequestToOpenRestaurantState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(
              titleAppbar:
                  SharedLocalizations.of(context)!.requestOpenRestaurant,
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
                  const UserInformation(),
                  const SizedBox(height: 12),
                  BottomActionBar(
                    controller: bloc.sendRequest(),
                    text: SharedLocalizations.of(context)!.sendRequest,
                    onPressed: () {
                      List<String> listCategoryIds = [];
                      for (var i = 0; i < state.selectCategory.indexList.length; i++) {
                        if (state.selectCategory.indexList[i] == true) {
                          listCategoryIds.add(
                              state.selectCategory.categoryList[i].id ?? "");
                        }
                      }
                      List<String> listCategoryTypes = [];
                      for (var i = 0; i < state.selectCategory.indexList.length; i++) {
                        if (state.selectCategory.indexList[i] == true) {
                          listCategoryTypes.add(
                              state.selectCategory.categoryList[i].name ?? "");
                        }
                      }
                      // POST REQUEST HERE
                      BlocProvider.of<RequestToOpenRestaurantBloc>(context).add(
                          SendRequest(
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
                              state.openingTime,
                              state.closedTime));
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SuccessOpenRestaurant(
                            userModel: state.userModel,
                            restaurantModel: state.restaurantModel,
                            listChooseCategory: listCategoryTypes,
                            dataCountries: state.selectedCountries ?? Countries(),
                            dataProvinces: state.selectedProvince ?? Provinces(),
                            dataDistrict: state.selectedDistrict ?? District(),
                          );
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
