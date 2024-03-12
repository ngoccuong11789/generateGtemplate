import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class MainAppBarWithoutSearch extends AppBar {
  MainAppBarWithoutSearch({super.key, required this.title});

  @override
  final Widget title;

  @override
  State<MainAppBarWithoutSearch> createState() =>
      _MainAppBarWithoutSearchState();
}

class _MainAppBarWithoutSearchState extends State<MainAppBarWithoutSearch> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const icon.SoctripIcon(icon.Icons.chevronLeft)),
      titleTextStyle: CommonTextStyle.title,
      centerTitle: true,
      flexibleSpace: Image.asset(
        AssetHelper.appBarBackground,
        package: packageName,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
      title: widget.title,
    );
  }
}
