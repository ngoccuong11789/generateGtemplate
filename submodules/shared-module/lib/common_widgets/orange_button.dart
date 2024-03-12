import 'package:shared_module/constants/common_text_style.dart';
import 'package:flutter/material.dart';

import '../constants/color_palette.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const OrangeButton(
    this.text, {
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFEAD34), // Start color: #FEAD34
            Color(0xFFFF7041), // End color: #FF7041
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
            const Size.fromHeight(20),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
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
      ),
    );
  }
}
