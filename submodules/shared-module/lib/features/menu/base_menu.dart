import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_module/common_widgets/AppBar/view/menu_appbar.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/menu/models/menu_item_model.dart';
import 'package:shared_module/features/menu/widgets/menu_item.dart';

class BaseMenu extends StatelessWidget {
  const BaseMenu(
      {super.key, required this.menuItems, required this.topBarSection, required this.backText});

  final Widget topBarSection;
  final List<MenuItemModel> menuItems;
  final String backText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF),
      appBar: MenuAppbar(leadingText: backText),
      body: SingleChildScrollView(
        child: Column(
          children: [topBarSection, _menuSection()],
        ),
      ),
    );
  }

  Widget _menuSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 24),
      decoration: const BoxDecoration(
          color: ColorPalette.baseWhite,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(children: menuItemWidgets(menuItems)),
    );
  }

  List<Widget> menuItemWidgets(List<MenuItemModel> items) {
    List<Widget> widgets = [];
    int lastItem = items.length - 1;
    for (int i = 0; i < items.length; i++) {
      if (i != lastItem) {
        widgets.add(
          MenuItem(
            menuItemIcon: items[i].menuItemIcon,
            menuItemText: items[i].menuItemText,
            menuItemOnPressed: items[i].menuItemOnPressed,
          ),
        );
      } else {
        widgets.add(
          MenuItem(
            menuItemIcon: items[i].menuItemIcon,
            menuItemText: items[i].menuItemText,
            menuItemOnPressed: items[i].menuItemOnPressed,
            hasBottomBorder: false,
          ),
        );
      }
    }

    return widgets;
  }
}
