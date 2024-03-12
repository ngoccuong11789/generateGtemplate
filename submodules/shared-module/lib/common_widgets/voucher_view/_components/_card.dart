import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorPalette.gray900),
          ),
          const SizedBox(
            height: 12,
          ),
          child
        ],
      ),
    );
  }
}
