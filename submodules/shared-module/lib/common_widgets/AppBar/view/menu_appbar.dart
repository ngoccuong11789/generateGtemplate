import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class MenuAppbar extends AppBar {
  MenuAppbar({super.key, required this.leadingText});

  final String leadingText;

  @override
  State<MenuAppbar> createState() => _MenuAppbarState();
}

class _MenuAppbarState extends State<MenuAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: MediaQuery.of(context).size.width,
      leading: Center(
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Row(
            children: [
              const SizedBox(width: 16),
              const icon.SoctripIcon(
                icon.Icons.chevronLeft,
                style: TextStyle(
                    color: ColorPalette.bluePrimary,
                  fontSize: 20
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.leadingText,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 20 /14,
                    color: ColorPalette.bluePrimary
                ),
              ),
            ],
          )
        ),
      ),
      flexibleSpace: Image.asset(
        AssetHelper.appBarBackground,
        package: packageName,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
