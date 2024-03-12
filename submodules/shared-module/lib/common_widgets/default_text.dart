import 'package:flutter/material.dart';

import '../constants/color_palette.dart';

class DefaultText extends StatelessWidget {
  final String data;
  final TextStyle style;

  const DefaultText(
    this.data, {
    Key? key,
    this.style = const TextStyle(
      fontSize: 14,
      color: ColorPalette.mainTextColor,
      fontWeight: FontWeight.w400,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
    );
  }
}

class DefaultTitleText extends StatelessWidget {
  final String data;
  final TextStyle style;

  const DefaultTitleText(
    this.data, {
    Key? key,
    this.style = const TextStyle(
      fontSize: 16,
      color: ColorPalette.mainTextColor,
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }
}
