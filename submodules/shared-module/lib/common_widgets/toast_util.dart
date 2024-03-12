import 'package:flutter/material.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/enum/toast_status.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as soc;

class ToastUtil {
  static show(BuildContext context, String message,
      {ToastStatus status = ToastStatus.success, Duration? duration}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(_createSnackBar(context, message, status, duration));
  }

  static SnackBar _createSnackBar(BuildContext context, String message,
      ToastStatus status, Duration? duration) {
    Color backgroundColor;
    Color borderColor;
    Color titleColor;
    Color closeButtonColor;
    Widget icon;

    switch (status) {
      case ToastStatus.error:
        {
          backgroundColor = ColorPalette.error250;
          borderColor = ColorPalette.error300;
          closeButtonColor = ColorPalette.error500;
          titleColor = ColorPalette.error700;
          icon = package.createSvgFromAsset(AssetHelper.iconError);
          break;
        }
      case ToastStatus.warning:
        {
          backgroundColor = ColorPalette.warning250;
          borderColor = ColorPalette.warning300;
          closeButtonColor = ColorPalette.warning500;
          titleColor = ColorPalette.warning700;
          icon = package.createSvgFromAsset(AssetHelper.iconWarning);
          break;
        }
      default:
        backgroundColor = ColorPalette.success250;
        borderColor = ColorPalette.success300;
        closeButtonColor = ColorPalette.success500;
        titleColor = ColorPalette.success700;
        icon = package.createSvgFromAsset(AssetHelper.iconSuccess);
        break;
    }

    final content = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(message,
                style: TextStyle(
                    color: titleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        SizedBox(
          width: 36,
          height: 36,
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            padding: EdgeInsets.zero,
            icon: soc.SoctripIcon(soc.Icons.xClose,
              style: TextStyle(color: closeButtonColor),
            ),
          ),
        ),
      ],
    );

    return SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.all(8),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(bottom: 45, right: 16, left: 16),
        content: content);
  }
}
