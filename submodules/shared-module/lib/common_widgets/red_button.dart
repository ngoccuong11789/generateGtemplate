import 'package:shared_module/constants/common_text_style.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const RedButton(
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
            217,
            45,
            32,
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
