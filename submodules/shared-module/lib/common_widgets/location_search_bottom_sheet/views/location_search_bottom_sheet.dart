import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/common_widgets/location_search_bottom_sheet/bloc/location_search_bloc.dart';
import 'package:shared_module/common_widgets/location_search_bottom_sheet/controller/province_location_search_controller.dart';
import 'package:shared_module/common_widgets/location_search_bottom_sheet/models/location_details.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/exception/soctrip_exeception.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as soc;

Future<LocationDetails?> showLocationSearchBottomSheet(BuildContext context,
    {LocationDetails? location,
    String? suggestionListTitle,
    String? aroundYouText}) async {
  LocationDetails? result;
  bool error = false;
  await showCommonLargeBottomSheet(
      height: MediaQuery.of(context).size.height - 80,
      useSafeArea: true,
      context: context,
      builder: (context) => BlocProvider(
            create: (context) => LocationSearchBloc(
                ProvinceLocationSearchController(
                    SharedModule.appDelegates!.dio))
              ..add(LoadLocations()),
            child: BlocListener<LocationSearchBloc, LocationSearchState>(
              listener: (context, state) {
                if (state.isLocationSelected) {
                  result = state.selectedLocation;
                  if (result == null) {
                    error = true;
                  }
                  GoRouter.of(context).pop();
                }
              },
              child: BlocSelector<LocationSearchBloc, LocationSearchState,
                      List<LocationDetails>>(
                  selector: (state) => state.locations,
                  builder: (context, locations) {
                    return BlocSelector<LocationSearchBloc, LocationSearchState,
                        String>(
                      selector: (state) => state.searchKey,
                      builder: (context, keyword) {
                        return _buildSearchForm(context, locations,
                            suggestionListTitle, aroundYouText, keyword);
                      },
                    );
                  }),
            ),
          ));
  if (error) {
    throw SoctripException(message: "Can not retrieve your location");
  }
  return result;
}

Widget _buildSearchForm(BuildContext context, List<LocationDetails> locations,
    String? suggestionListTitle, String? aroundYouText, String keyword) {
  final searchFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: ColorPalette.gray200,
    ),
  );

  final searchField = Container(
    key: const Key("searchField"),
    margin: const EdgeInsets.only(top: 8, bottom: 12, left: 16, right: 16),
    height: 40,
    child: TextField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: ColorPalette.gray900,
      autofocus: true,
      onChanged: (value) {
        BlocProvider.of<LocationSearchBloc>(context)
            .add(KeywordChanged(keyword: value));
      },
      decoration: InputDecoration(
        filled: true,
        hintText: " ${SharedLocalizations.of(context)!.searchForProvince}",
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: ColorPalette.gray500
        ),
        fillColor: ColorPalette.gray100,
        focusedBorder: searchFieldBorder,
        enabledBorder: searchFieldBorder,
        border: searchFieldBorder,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        prefixIcon: const SizedBox.square(
          dimension: 20,
          child: Center(
            child: soc.SoctripIcon(
              soc.Icons.searchLg,
              style: TextStyle(color: ColorPalette.appBarIcon, fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );

  final suggestionTitle = Padding(
    key: const Key("suggestionTitle"),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        suggestionListTitle ??
            SharedLocalizations.of(context)!.someFamousLocations,
        style: const TextStyle(
          color: Color(0xFF1D2838),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 1.50,
        ),
      ),
    ),
  );

  Widget noItemFound() => Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ColorPalette.primary50,
                      style: BorderStyle.solid,
                      width: 8),
                  color: ColorPalette.primary100),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 24, bottom: 16),
              child: const soc.SoctripIcon(
                soc.Icons.searchLg,
                style: TextStyle(color: ColorPalette.primary600, fontSize: 22),
              )),
          Text(
            SharedLocalizations.of(context)!.noResultsFound,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorPalette.gray900,
                fontFamily: 'Inter'),
          )
        ],
      );

  int extraItemsCount = 1;
  if (keyword.isEmpty) {
    extraItemsCount = 3;
  } else {
    if (locations.isEmpty) {
      extraItemsCount = 2;
    }
  }
  final itemCount = locations.length + extraItemsCount;
  return ListView.builder(
    itemCount: itemCount,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      Widget defaultCase() {
        final item = locations[index - extraItemsCount];
        return _buildSelection(
            icon: _buildLocationIcon(),
            key: Key(item.name),
            title: item.name,
            subtitle: item.address,
            onTap: () => BlocProvider.of<LocationSearchBloc>(context)
                .add(LocationSelected(locationDetails: item)));
      }

      switch (index) {
        case 0:
          return searchField;
        case 1:
          if (locations.isEmpty && keyword.isNotEmpty) {
            return noItemFound();
          }
          if (extraItemsCount > 1) {
            return suggestionTitle;
          }
          return defaultCase();
        case 2:
          if (extraItemsCount > 2) {
            return _buildSelection(
                key: const Key("myLocation"),
                icon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: package.createSvgFromAsset(AssetHelper.myLocation),
                ),
                title: aroundYouText ??
                    SharedLocalizations.of(context)!.locationsNearYou,
                onTap: () => BlocProvider.of<LocationSearchBloc>(context)
                    .add(MyLocationSelected()));
          }
          return defaultCase();
        default:
          return defaultCase();
      }
    },
  );
}

Widget _buildLocationIcon() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: ColorPalette.primary100,
        borderRadius: BorderRadius.circular(100)),
    child: package.createSvgFromAsset(AssetHelper.locationMarker),
  );
}

Widget _buildSelection(
    {required Widget icon,
    required String title,
    GestureTapCallback? onTap,
    required Key key,
    String? subtitle}) {
  return InkWell(
    key: key,
    onTap: onTap,
    child: ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF0F1728),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 1.43,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF475466),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            )
          : null,
    ),
  );
}
