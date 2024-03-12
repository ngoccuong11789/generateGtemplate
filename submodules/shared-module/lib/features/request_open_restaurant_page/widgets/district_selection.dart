import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_bloc.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/package_util.dart';

class DistrictSelectionWidget extends StatefulWidget {
  final List<District> districtList;

  const DistrictSelectionWidget({Key? key, required this.districtList}) : super(key: key);

  @override
  _DistrictSelectionWidgetState createState() => _DistrictSelectionWidgetState();
}

class _DistrictSelectionWidgetState extends State<DistrictSelectionWidget> {
  District? _selectedDistrict;
  late TextEditingController searchController;
  late RequestToOpenRestaurantBloc bloc;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    bloc = BlocProvider.of<RequestToOpenRestaurantBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestToOpenRestaurantBloc, RequestToOpenRestaurantState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _showModalDistrict(context);
          },
          child: Container(
            width: double.infinity,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
              borderRadius: BorderRadius.circular(8),
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
                            (_selectedDistrict?.districtName != null)
                                ? _selectedDistrict!.districtName!
                                : SharedLocalizations.of(context)!.selectDistrict,
                            style: const TextStyle(
                              color: Colors.black54,
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
                            child: package.createSvgFromAsset(AssetHelper.downChevron),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModalDistrict(BuildContext context) {
    List<District> result = widget.districtList.toList();
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
                            result = widget.districtList.where((element) =>
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
                        scrollPhysics: NeverScrollableScrollPhysics(),
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
                                        fontWeight: FontWeight.w500,
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
              ),
            );
          },
        );
      },
    );
  }
}
