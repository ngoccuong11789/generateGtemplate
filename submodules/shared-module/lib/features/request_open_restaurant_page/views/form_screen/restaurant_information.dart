import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_bloc.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/restaurant_model.dart';
import 'package:shared_module/features/request_open_restaurant_page/widgets/category_input.dart';
import 'package:shared_module/features/request_open_restaurant_page/widgets/district_selection.dart';
import 'package:shared_module/features/request_open_restaurant_page/widgets/time.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import '../../../../constants/color_palette.dart';
import '../../widgets/countries_selection.dart';
import '../../widgets/province_selection.dart';

class RestaurantInformation extends StatefulWidget {
  const RestaurantInformation({super.key});

  @override
  State<RestaurantInformation> createState() => _RestaurantInformationState();
}

class _RestaurantInformationState extends State<RestaurantInformation> {
  TextEditingController merchantNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLineTwo =TextEditingController();

  void _handleChangeInputField() {
    final restaurant = RestaurantModel(
      merchantName: merchantNameController.text,
      addressLineOne: addressController.text,
      addressLineTwo: addressLineTwo.text
    );
    BlocProvider.of<RequestToOpenRestaurantBloc>(context).add(ChangeInputFieldRestaurant(restaurant));
  }

  bool containsTrue(List<bool> list) {
    for (var element in list) {
      if (element == true) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestToOpenRestaurantBloc, RequestToOpenRestaurantState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: ColorPalette.baseWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SharedLocalizations.of(context)!.restaurantInfo,
                  style: const TextStyle(
                    color: ColorPalette.gray900,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  SharedLocalizations.of(context)!.restaurantInfoPrompt,
                  style: const TextStyle(
                    color: ColorPalette.gray900,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0,bottom: 4.0),
                  child: Row(
                    children: [
                      Text(
                        SharedLocalizations.of(context)!.merchantName,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 3,),
                      const Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 44,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                    child: TextField(
                      controller: merchantNameController,
                      onChanged: (_) => _handleChangeInputField(),
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: SharedLocalizations.of(context)!.enterAddress,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                        ),
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 4.0),
                  child: Row(
                    children: [
                      Text(SharedLocalizations.of(context)!.addressLine1,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 3,),
                      const Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 44,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: addressController,
                    onChanged: (_) => _handleChangeInputField(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: SharedLocalizations.of(context)!.enterAddress,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 4.0),
                  child: Text(SharedLocalizations.of(context)!.addressLine2,
                    style: const TextStyle(
                      color: Color(0xFF344053),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 44,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: addressLineTwo,
                    onChanged: (_) => _handleChangeInputField(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: SharedLocalizations.of(context)!.enterAddress,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                  child: Row(
                    children: [
                      Text(SharedLocalizations.of(context)!.country,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 3,),
                      const Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                CountrySelectionWidget(countryList: state.listCountries ?? []),
                Padding(
                  padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                  child: Row(
                    children: [
                      Text(SharedLocalizations.of(context)!.stateProvince,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 3,),
                      const Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ProvinceSelectionWidget(provinceList: state.listProvinces ?? [],),
                Padding(
                  padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                  child: Row(
                    children: [
                      Text(SharedLocalizations.of(context)!.district,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 3,),
                      const Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                DistrictSelectionWidget(districtList: state.listDistrict ?? []),
                const SizedBox(height: 8.0,),
                const CategoryInput(),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TimeRestaurant(
                        opening: true,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: TimeRestaurant(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



