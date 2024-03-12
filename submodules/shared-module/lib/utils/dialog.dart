import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

Future<void>? showErrorDialog({
  required BuildContext context,
  String title = "",
  String message = "",
  String btnOkText = "",
  Function? btnOkOnPress,
}) {
  return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.topSlide,
      headerAnimationLoop: false,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(title,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xFF44494D),
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 8.0),
              Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF333333),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0)
            ],
          ),
        ),
      ),
      btnOk: ButtonTheme(
        height: 56,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              )),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(1.0),
              ),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(ColorPalette.red700)),
          child: Container(
            decoration: const BoxDecoration(
              color: ColorPalette.red700,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            // width: (width != null && width > 0) ? width : Get.width - Dimensions.PADDING_LR * 2,
            child: Center(
              child: Text(
                btnOkText,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: false).pop();
            btnOkOnPress?.call();
          },
        ),
      )).show();
}
