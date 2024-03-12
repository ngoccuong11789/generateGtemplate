import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';

class ThickLine extends StatelessWidget {
  const ThickLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ));
  }
}

class ThinLine extends StatelessWidget {
  const ThinLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 1,
      color: ColorPalette.grey200,
    );
  }
}
