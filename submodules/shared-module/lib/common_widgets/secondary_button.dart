import 'package:shared_module/utils/package_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/common_text_style.dart';

import '../constants/color_palette.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      this.text, {
        super.key,
        this.onPressed, this.colorBg, this.colorText
      });

  final String text;
  final Color? colorBg;
  final Color? colorText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(40),
        ),
        backgroundColor:
        MaterialStateProperty.all<Color>(colorBg ?? ColorPalette.baseWhite),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: colorBg ?? ColorPalette.secondary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: colorText ?? ColorPalette.onSecondary,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SecondaryButtonWithIcon extends StatelessWidget {
  const SecondaryButtonWithIcon(
      this.icon,
      this.text, {
        super.key,
        this.onPressed, this.colorText, this.colorBg
      });

  final String icon;
  final String text;
  final Color? colorBg;
  final Color? colorText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(40),
        ),
        backgroundColor:
        MaterialStateProperty.all<Color>(colorBg ?? ColorPalette.baseWhite),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: colorBg ?? ColorPalette.secondary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          package.createSvgFromAsset(icon, height: 14.0, width: 14.0),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: colorText ?? ColorPalette.onSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
