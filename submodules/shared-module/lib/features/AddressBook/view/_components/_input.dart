import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/localizations.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    this.hintText,
    this.maxLines = 1,
    required this.initValue,
    this.readOnly = false,
    this.inputFormatters,
    this.onTap,
    required this.showError,
    this.handleValue,

    this.contentStyle,
    this.suffixIcon, this.prefixIcon, this.onChanged,
  });

  final String? hintText;
  final int maxLines;
  final TextStyle? contentStyle;
  final bool readOnly;
  final bool showError;
  final String? initValue;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final Function(String value)? handleValue;
  final Function(String value)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: initValue);
    FocusNode focusNode = FocusNode();
    return SizedBox(
      child: TextFormField(
        validator: (text) {
          if ((text == null || text.isEmpty) && showError) {
            return SharedLocalizations.of(context)!.requiredAddress;
          }
          return null;
        },
        onFieldSubmitted: (value){
          if(handleValue != null){
            handleValue!(controller.text);
          }
        },
        onTapOutside: (e) {
          focusNode.unfocus();
          if(handleValue != null){
            handleValue!(controller.text);
          }
        },
        onChanged: (value){
          if(onChanged != null){
            onChanged!(controller.text);
          }
        },
        focusNode: focusNode,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        maxLines: maxLines,
        onTap: onTap,
        style: contentStyle ??
            const TextStyle(
                color: ColorPalette.gray900,
                fontWeight: FontWeight.w400,
                fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          errorStyle: const TextStyle(color: ColorPalette.error600),
          hintStyle: const TextStyle(
              color: ColorPalette.gray300,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorPalette.gray300, width: 1),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorPalette.gray300, width: 1),
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorPalette.error600, width: 1),
              borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.gray300),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorPalette.primary,
              ),
              borderRadius: BorderRadius.circular(8)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.gray300),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
