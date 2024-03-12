

import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';

InputDecoration inputDecorationForInputText(
    {String? hintText, Widget? prefixIcon, Widget? suffixIcon, enabled = true, Color? activeColor}) {
  return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabled: enabled,
      fillColor: Colors.grey.withOpacity(0.2),
      filled: !enabled,
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD0D5DD))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: activeColor ?? ColorPalette.baseDark)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFC4202C))),
      hintText: hintText,
      counterText: "",
      errorStyle: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFF98A2B3),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      errorMaxLines: 10
  );
}

InputDecoration inputDecorationForDisabledInputText(
    {String? hintText, Widget? prefixIcon, Widget? suffixIcon, String? code}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFB5B4B4))),
    hintText: hintText,
    hintStyle: const TextStyle(
      color:  Color(0xFF999999),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    filled: true,
    fillColor: const Color(0xFFF6F6F6),
    prefixIcon: code != null ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                code ?? "",
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ]),
        ),
      ],
    ) : prefixIcon,
  );
}

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.labelText,
    this.isRequired = false,
    this.child,
    this.activeColor,
    this.widgetRightTitle
  }) : super(key: key);

  final String? labelText;
  final bool isRequired;
  final Widget? child;
  final Widget? widgetRightTitle;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              color: ColorPalette.baseWhite,
              child: RichText(
                text: TextSpan(
                  text: labelText,
                  style: const TextStyle(
                    color: Color(0xFF44494D),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: !isRequired ? "" : " *",
                      style: const TextStyle(color: Color(0xFFEC1E37)),
                    ),
                  ],
                ),
              ),
            ),
            widgetRightTitle ?? Container()
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: child,
        )
      ],
    );
  }
}
