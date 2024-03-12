import 'package:flutter/widgets.dart';

class SoctripUtils {
  static double getMainHorizontalPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 374 ? 16 : 8;
    return padding;
  }
}