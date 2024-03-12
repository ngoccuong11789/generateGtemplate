import 'package:flutter/cupertino.dart';

class MenuItemModel {
  final String menuItemText;
  final Widget menuItemIcon;
  final Function()? menuItemOnPressed;

  MenuItemModel(
      {required this.menuItemText,
      required this.menuItemIcon,
      this.menuItemOnPressed});
}
