import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/features/request_open_shop_page/model/countries.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;
import 'package:shared_module/features/request_open_shop_page/model/district.dart';
import 'package:shared_module/features/request_open_shop_page/model/input_variables/shop_model.dart';
import 'package:shared_module/features/request_open_shop_page/model/provinces.dart';

import '../../../../common_widgets/bottom_sheet.dart';
import '../../../../constants/color_palette.dart';
import '../../bloc/request_to_open_shop_bloc.dart';

class ShopInformation extends StatefulWidget {
  const ShopInformation({super.key});

  @override
  State<ShopInformation> createState() => _ShopInformationState();
}

class _ShopInformationState extends State<ShopInformation> {
  TextEditingController merchantNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLineTwo =TextEditingController();
  DataCountries _selectedCountries = DataCountries();
  DataProvinces _selectedProvince = DataProvinces();
  DataDistrict _selectedDistrict = DataDistrict();

  void _sendDataShopToParent() {
    final shop = ShopModel(
      merchantName: merchantNameController.text,
      addressShop: addressController.text,
      subStreet: addressLineTwo.text
    );
    BlocProvider.of<RequestToOpenShopBloc>(context).add(ChangeInputFieldShop(shop));
  }
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<RequestToOpenShopBloc>(context).add(const GetListCountries());
    super.initState();
  }

  void showModalCountries(context, List<DataCountries> list, RequestToOpenShopBloc bloc) {
    List<DataCountries> result = list.map((e) => e).toList();
    TextEditingController searchController = TextEditingController();

    showCommonBottomSheet(
      shrinkHeight: true,
      useSafeArea: true,
      adjustSoftKeyboard: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          result = list.where((element) =>
                              element.countryName!.toLowerCase().contains(value.toLowerCase())
                          ).toList();
                        });
                      },
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.all(12),
                        hintText: SharedLocalizations.of(context)!.search,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                        ),
                      ),
                      scrollPhysics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: result.asMap().entries.map((e) {
                      var index = e.key;
                      var value = e.value;
                      return GestureDetector(
                        onTap: () {
                          bloc.add(HandleSelectedCountries(dataCountries: value));
                          setState(() {
                            _selectedCountries = value;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value.countryName ?? '',
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1,
                              color: ColorPalette.gray200,
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showModalProvince(context, List<DataProvinces> list, RequestToOpenShopBloc bloc) {
    List<DataProvinces> result = list.map((e) => e).toList();
    TextEditingController searchController = TextEditingController();
    showCommonBottomSheet(
      shrinkHeight: true,
      useSafeArea: true,
      adjustSoftKeyboard: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
                    child: Container(
                      width: double.infinity,
                      height: 44,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            result = list.where((element) {
                              return element.provinceName!.toLowerCase().contains(value.toLowerCase());
                            }).toList();
                          });
                        },
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.all(12),
                          hintText: SharedLocalizations.of(context)!.search,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: result.map((value) {
                          return GestureDetector(
                            onTap: () {
                              bloc.add(HandleSelectedProvince(city: value));
                              setState(() {
                                _selectedProvince = value;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value.provinceName ?? '',
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  color: ColorPalette.gray200,
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showModalDistrict(context, List<DataDistrict> list, RequestToOpenShopBloc bloc) {

    List<DataDistrict> result = list.map((e) => e).toList();
    TextEditingController searchController = TextEditingController();

    showCommonBottomSheet(
      shrinkHeight: true,
      useSafeArea: true,
      adjustSoftKeyboard: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          result = list.where((element) =>
                              element.districtName!.toLowerCase().contains(value.toLowerCase())
                          ).toList();
                        });
                      },
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.all(12),
                        hintText: SharedLocalizations.of(context)!.search,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: result.asMap().entries.map((e) {
                        var index = e.key;
                        var value = e.value;
                        return GestureDetector(
                          onTap: () {
                            bloc.add(HandleSelectedDistrict(district: value));
                            setState(() {
                              _selectedDistrict = value;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    value.districtName ?? '',
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: ColorPalette.gray200,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget chooseCountries(List<DataCountries> list) {
      return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
          builder: (context, state)
      {
        return GestureDetector(
          onTap: () {
            showModalCountries(context, list, BlocProvider.of<RequestToOpenShopBloc>(context));
          },
          child:  Container(
            width: double.infinity,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            (_selectedCountries.countryName != null)
                                ? _selectedCountries.countryName!
                                : SharedLocalizations.of(context)!.selectCountries,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child:
                            package.createSvgFromAsset(AssetHelper.downChevron)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }

    Widget chooseProvince(List<DataProvinces> list) {
      return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
          builder: (context, state)
          {
            return GestureDetector(
              onTap: () {
                if(state.selectedCountries != null){
                  showModalProvince(context, list,BlocProvider.of<RequestToOpenShopBloc>(context));
                }
              },
              child:  Container(
                width: double.infinity,
                height: 44,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                (_selectedProvince.provinceName != null) ?
                                _selectedProvince.countryId != state.selectedProvinces?.countryId
                                    ? SharedLocalizations.of(context)!.selectProvince
                                    : _selectedProvince.provinceName! : SharedLocalizations.of(context)!.selectProvince,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child:
                                  package.createSvgFromAsset(AssetHelper.downChevron)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    Widget chooseDistrict(List<DataDistrict> list) {
      return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
          builder: (context, state)
          {
            return GestureDetector(
              onTap: () {
                if(state.selectedProvinces != null){
                  showModalDistrict(context, list,BlocProvider.of<RequestToOpenShopBloc>(context));
                }
              },
              child:  Container(
                width: double.infinity,
                height: 44,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                (_selectedDistrict.districtName != null) ?
                                _selectedDistrict.provinceId != state.selectedDistrict?.provinceId
                                    ? SharedLocalizations.of(context)!.selectDistrict
                                    : _selectedDistrict.districtName! : SharedLocalizations.of(context)!.selectDistrict,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child:
                                  package.createSvgFromAsset(AssetHelper.downChevron)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: ColorPalette.baseWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SharedLocalizations.of(context)!.shopInformation,
                style: const TextStyle(
                  color: ColorPalette.gray900,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              Text(
                SharedLocalizations.of(context)!.shopInfoPrompt,
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
                        color: Color(0xFFD92C20),
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
                    onChanged: (_) => _sendDataShopToParent(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: SharedLocalizations.of(context)!.enterMerchantName,
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
                        color: Color(0xFFD92C20),
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
                  onChanged: (_) => _sendDataShopToParent(),
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
                  onChanged: (_) => _sendDataShopToParent(),
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
                        color: Color(0xFFD92C20),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              chooseCountries(state.listCountries?.data ?? []),
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
                        color: Color(0xFFD92C20),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              chooseProvince(state.provinces?.data ?? []),
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
                        color: Color(0xFFD92C20),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              chooseDistrict(state.district?.data ?? []),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}



