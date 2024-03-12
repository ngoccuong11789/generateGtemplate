import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/menu/base_menu.dart';
import 'package:shared_module/features/menu/models/menu_item_model.dart';
import 'package:shared_module/localization/localizations.dart';

class SoctripCenter extends StatelessWidget {
  const SoctripCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      menuItems: _getMenuItems(context),
      topBarSection: _topBarSection(context),
      backText: SharedLocalizations.of(context)!.megaMenu,
    );
  }

  Widget _topBarSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetHelper.soctripLogoWithText,
            package: packageName,
            height: 32,
          ),
          const SizedBox(width: 8),
          Text(
            SharedLocalizations.of(context)!.center,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 32 / 24,
                color: ColorPalette.bluePrimary),
          )
        ],
      ),
    );
  }

  MenuItemModel _getMenuItem(BuildContext context, SoctripCenterMenuItem type) {
    switch (type) {
      case SoctripCenterMenuItem.social:
        return MenuItemModel(
          menuItemText: SharedLocalizations.of(context)!.social,
          menuItemIcon: _getMenuItemIcon(AssetHelper.menuSocialIcon)
        );
      case SoctripCenterMenuItem.shop:
        return MenuItemModel(
          menuItemText: SharedLocalizations.of(context)!.shop,
          menuItemIcon: _getMenuItemIcon(AssetHelper.menuShopIcon),
          menuItemOnPressed: () {
            GoRouter.of(context).pushNamed("shopMenu");
          }
        );
      case SoctripCenterMenuItem.restaurant:
        return MenuItemModel(
          menuItemText: SharedLocalizations.of(context)!.restaurant,
          menuItemIcon: _getMenuItemIcon(AssetHelper.menuRestaurantIcon)
        );
      case SoctripCenterMenuItem.hotel:
        return MenuItemModel(
          menuItemText: SharedLocalizations.of(context)!.hotel,
          menuItemIcon: _getMenuItemIcon(AssetHelper.menuHotelIcon)
        );
      case SoctripCenterMenuItem.travelTour:
        return MenuItemModel(
          menuItemText: SharedLocalizations.of(context)!.travelTour,
          menuItemIcon: _getMenuItemIcon(AssetHelper.menuTravelTourIcon)
        );
      case SoctripCenterMenuItem.car:
        return MenuItemModel(
          menuItemText: SharedLocalizations.of(context)!.car,
          menuItemIcon: _getMenuItemIcon(AssetHelper.menuCarIcon)
        );
    }
  }
  
  Widget _getMenuItemIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      package: packageName,
    );
  }
  List<MenuItemModel> _getMenuItems(BuildContext context) {
    List<MenuItemModel> menuItemList = [];
    for (int i = 0; i < SoctripCenterMenuItem.values.length; i++) {
      menuItemList.add(_getMenuItem(context, SoctripCenterMenuItem.values[i]));
    }
    return menuItemList;
  }
}

enum SoctripCenterMenuItem { social, shop, restaurant, hotel, travelTour, car }
