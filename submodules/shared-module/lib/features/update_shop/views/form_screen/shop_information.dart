import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/features/update_shop/model/shop_model_update.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

import '../../../../common_widgets/bottom_sheet.dart';
import '../../../../constants/color_palette.dart';
import '../../bloc/update_shop_bloc.dart';

class ShopInformation extends StatefulWidget {
  const ShopInformation({super.key});

  @override
  State<ShopInformation> createState() => _ShopInformationState();
}

class _ShopInformationState extends State<ShopInformation> {

  TextEditingController merchantNameController = TextEditingController();
  TextEditingController addressLineOne = TextEditingController();
  TextEditingController addressLineTwo =TextEditingController();

  Countries _selectedCountries = Countries();
  Provinces _selectedProvince = Provinces();
  District _selectedDistrict = District();

  void _sendDataShopToParent() {
    final shop = ShopModelUpdate(
      merchantName: merchantNameController.text,
      addressLineOne: addressLineOne.text,
      addressLineTwo: addressLineTwo.text
    );
    BlocProvider.of<UpdateShopBloc>(context).add(ChangeInputFieldShop(shop));
  }
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<UpdateShopBloc>(context).add(const HandleGetShopInformation());
    BlocProvider.of<UpdateShopBloc>(context).add(const HandleGetListCountries());
    BlocProvider.of<UpdateShopBloc>(context).stream.listen((state) {
      ShopModelUpdate shopModelUpdate = state.shopModelUpdate;
      merchantNameController.text = shopModelUpdate.merchantName;
      addressLineOne.text = shopModelUpdate.addressLineOne;
      addressLineTwo.text = shopModelUpdate.addressLineTwo;

      _selectedCountries = state.selectedCountries ?? Countries();
      _selectedProvince = state.selectedProvince ?? Provinces();
      _selectedDistrict = state.selectedDistrict ?? District();

      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  void showModalCountries(context, List<Countries> list, UpdateShopBloc bloc) {
    List<Countries> result = list.map((e) => e).toList();
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
                              element.countryName!.toLowerCase().contains(value.toLowerCase())
                          ).toList();
                        });
                      },
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8,top:3),
                          child: const icon.SoctripIcon(
                            icon.Icons.searchSm),
                        ),
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
                          bloc.add(HandleSelectedCountries(countries: value));
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

  void showModalProvince(context, List<Provinces> list, UpdateShopBloc bloc) {
    List<Provinces> result = list.map((e) => e).toList();
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
                          result = list.where((element) {
                            return element.provinceName!.toLowerCase().contains(value.toLowerCase());
                          }).toList();
                        });
                      },
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8,top:3),
                          child: const icon.SoctripIcon(
                              icon.Icons.searchSm),
                        ),
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
                            bloc.add(HandleSelectedProvinces(provinces: value));
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
            );
          },
        );
      },
    );
  }

  void showModalDistrict(context, List<District> list, UpdateShopBloc bloc) {
    List<District> result = list.map((e) => e).toList();
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
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 8,top:3),
                          child: icon.SoctripIcon(
                              icon.Icons.searchSm),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                        hintText: SharedLocalizations.of(context)!.search,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                        ),
                        focusedBorder: const OutlineInputBorder(
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

    Widget chooseCountries(List<Countries> list) {
      return BlocBuilder<UpdateShopBloc, UpdateShopState>(
          builder: (context, state)
      {
        return GestureDetector(
          onTap: () {
            showModalCountries(context, list, BlocProvider.of<UpdateShopBloc>(context));
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
                              color: Color(0xFF344053),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
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

    Widget chooseProvince(List<Provinces> list) {
      return BlocBuilder<UpdateShopBloc, UpdateShopState>(
          builder: (context, state)
          {
            return GestureDetector(
              onTap: () {
                if(state.selectedCountries != null){
                  showModalProvince(context, list,BlocProvider.of<UpdateShopBloc>(context));
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
                                _selectedProvince.countryId != state.selectedProvince?.countryId
                                    ? SharedLocalizations.of(context)!.selectProvince
                                    : _selectedProvince.provinceName! : SharedLocalizations.of(context)!.selectProvince,
                                style: const TextStyle(
                                  color: Color(0xFF344053),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
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

    Widget chooseDistrict(List<District> list) {
      return BlocBuilder<UpdateShopBloc, UpdateShopState>(
          builder: (context, state)
          {
            return GestureDetector(
              onTap: () {
                if(state.selectedProvince != null){
                  showModalDistrict(context, list,BlocProvider.of<UpdateShopBloc>(context));
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
                                  color: Color(0xFF344053),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
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

    return BlocBuilder<UpdateShopBloc, UpdateShopState>(
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
                  SharedLocalizations.of(context)!.shopInfoPrompt,
                  style: const TextStyle(
                    color: Color(0xFF344053),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                const SizedBox(height: 4.0,),
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
                    controller: addressLineOne,
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
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                chooseCountries(state.listCountries ?? []),
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
                chooseProvince(state.listProvinces ?? []),
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
                chooseDistrict(state.listDistrict ?? []),
                SizedBox(height: 10),
                const _HaveExportElectronicInvoices(),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HaveExportElectronicInvoices extends StatelessWidget {
  const _HaveExportElectronicInvoices();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateShopBloc, UpdateShopState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () => BlocProvider.of<UpdateShopBloc>(context)
                .add(const HandleChangeExportElectronicInvoicesOption()),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 9,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: state.isInvoiceExact,
                      activeColor: ColorPalette.primary,
                      onChanged: (bool value) =>
                          BlocProvider.of<UpdateShopBloc>(context)
                              .add(const HandleChangeExportElectronicInvoicesOption()),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  SharedLocalizations.of(context)!.enableExportElectronicInvoices,
                  style: const TextStyle(
                    color: ColorPalette.grey700,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




