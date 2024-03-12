import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/restaurant_model.dart';
import 'package:shared_module/features/request_open_shop_page/model/input_variables/user_model.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import '../../../common_widgets/AppBar/view/main_appbar.dart';
import '../../../constants/color_palette.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class WaitingApproveRestaurant extends StatelessWidget {

  final UserModel userModel;
  final RestaurantModel restaurantModel;
  final List<String> listChooseCategory;
  final Countries dataCountries;
  final Provinces dataProvinces;
  final District dataDistrict;
  const WaitingApproveRestaurant({super.key,required this.userModel, required this.restaurantModel, required this.listChooseCategory,
    required this.dataCountries, required this.dataProvinces, required this.dataDistrict});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleAppbar: "",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _Image()),
              SizedBox(height: 8),
              Center(
                child: Text(
                  SharedLocalizations.of(context)!.waitingApproveUpdateShop,
                  style: const TextStyle(
                    color: Color(0xFF101828),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  SharedLocalizations.of(context)!.waitingApproveUpdateShopPrompt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF667085),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 8),
              _RestaurantInformation(
                restaurantModel: restaurantModel,
                dataCountries: dataCountries,
                dataProvinces: dataProvinces,
                dataDistrict: dataDistrict,),
              const Divider(
                height: 1,
                color: Color(0xFFEAECF0),
                thickness: 1,
              ),
              _UserInformation(userModel: userModel,),
              const Divider(
                height: 1,
                color: Color(0xFFEAECF0),
                thickness: 1,
              ),
              _CategoryInformation(listChooseCategory: listChooseCategory),
              const Divider(
                height: 1,
                color: Color(0xFFEAECF0),
                thickness: 1,
              ),
              _Status(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BackToHomePage(),
    );
  }
}

class _Status extends StatelessWidget {
  const _Status();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          SharedLocalizations.of(context)!.status.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF98A2B3),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0xFFFEF6EE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999),
            ),
          ),
          child: Text(
            SharedLocalizations.of(context)!.pendingApproval,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFE04F16),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _UserInformation extends StatelessWidget {
  final UserModel userModel;
  const _UserInformation({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          SharedLocalizations.of(context)!.userInformation.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF98A2B3),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          userModel.fullName,
          style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          userModel.email,
          style: const TextStyle(
            color: Color(0xFF667085),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          userModel.phoneNumber.toString(),
          style: const TextStyle(
            color: Color(0xFF667085),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _RestaurantInformation extends StatelessWidget {
  final Countries dataCountries;
  final Provinces dataProvinces;
  final District dataDistrict;
  final RestaurantModel restaurantModel;
  const _RestaurantInformation({required this.restaurantModel, required this.dataCountries, required this.dataProvinces, required this.dataDistrict});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          SharedLocalizations.of(context)!.shopInformation.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF98A2B3),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          restaurantModel.merchantName,
          style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${restaurantModel.addressLineOne ?? ""}, ${dataDistrict.districtName ?? ""}, '
              '${dataProvinces.provinceName ?? ""}, ${dataCountries.countryName ?? ""}',
          style: const TextStyle(
            color: Color(0xFF667085),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100],
            ),
            child: Center(
              child: const icon.SoctripIcon(
                icon.Icons.clock_1_,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _BackToHomePage extends StatelessWidget {
  const _BackToHomePage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorPalette.baseWhite,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xFFEAECF0),
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
      child: PrimaryButton(
        SharedLocalizations.of(context)!.backToHomepage,
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _CategoryInformation extends StatelessWidget {

  final List<String> listChooseCategory;

  const _CategoryInformation({required this.listChooseCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          SharedLocalizations.of(context)!.category.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF98A2B3),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: listChooseCategory.asMap().entries.map((e) {
            var index = e.key;
            var value = e.value;
            return Container(
              padding: const EdgeInsets.only(
                left: 9,
                right: 4,
                top: 2,
                bottom: 2,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Text(
                listChooseCategory[index] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

}

