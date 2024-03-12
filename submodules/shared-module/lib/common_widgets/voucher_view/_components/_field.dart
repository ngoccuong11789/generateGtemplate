import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorPalette.gray500),
        ),
        const SizedBox(
          height: 4,
        ),
        DefaultTextStyle(style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorPalette.gray700),
        child: child)
      ],
    );
  }
}
