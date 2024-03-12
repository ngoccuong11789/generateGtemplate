import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  const PrimaryButton(
      this.text, {
        super.key,
        this.onPressed, this.color
      });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(40),
        ),
        backgroundColor: onPressed == null ? MaterialStateProperty.all<Color>(
          const Color.fromARGB(
            255,
            178,
            221,
            255,
          ),
        ) : MaterialStateProperty.all<Color>(color != null ? color! : ColorPalette.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        text,
        style: CommonTextStyle.primaryButtonTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class GreyedOutPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const GreyedOutPrimaryButton(
    this.text, {
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(40),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(
            255,
            178,
            221,
            255,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        text,
        style: CommonTextStyle.primaryButtonTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
