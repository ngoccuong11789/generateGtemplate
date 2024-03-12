import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/utils/package_util.dart';

class RoundedAppBar extends AppBar {
  RoundedAppBar({super.key, required this.barTitle});

  final String barTitle;

  @override
  State<RoundedAppBar> createState() => _RoundedAppBarState();
}

class _RoundedAppBarState extends State<RoundedAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: package.createSvgFromAsset(AssetHelper.btnBack,
              package: packageName)),
      backgroundColor: Colors.white,
      elevation: 2,
      foregroundColor: ColorPalette.gray800,
      shadowColor: Colors.black,
      automaticallyImplyLeading: true,
      title: Text(
        widget.barTitle,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: package.createSvgFromAsset(AssetHelper.btnDorVetical,
              package: packageName),
        ),
      ],
    );
  }
}
