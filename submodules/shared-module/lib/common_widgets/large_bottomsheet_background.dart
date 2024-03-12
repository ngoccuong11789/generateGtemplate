import 'package:flutter/material.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/utils/package_util.dart';

class LargeBottomSheetBackground extends StatelessWidget {
  const LargeBottomSheetBackground({super.key, this.borderRadius = 25});

  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius ?? 0)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorPalette.linearGradientTop,
                  ColorPalette.baseWhite.withAlpha(0),
                ],
              )),
        ),
        Positioned(
            top: -20,
            left: MediaQuery.of(context).size.width * 0.5,
            child: package.createSvgFromAsset(AssetHelper.bubbleBorder,
                width: 100, height: 100, fit: BoxFit.scaleDown)),
        Positioned(
            bottom: -10,
            right: -30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorPalette.linearBubble.withOpacity(0.1),
                      ColorPalette.baseWhite.withAlpha(0),
                    ],
                  )),
            ))
      ],
    );
  }
}
