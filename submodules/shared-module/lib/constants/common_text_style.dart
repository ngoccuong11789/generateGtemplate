import "package:flutter/material.dart";
import "package:shared_module/constants/color_palette.dart";

class CommonTextStyle {
  static const TextStyle defaultStyle = TextStyle(
    fontSize: 14,
    color: ColorPalette.mainTextColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle sideMenuTextStyle = TextStyle(
    color: Color(0xFF344053),
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 1.50,
  );

  static const TextStyle title = TextStyle(
    color: ColorPalette.gray900,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const smallTitle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: ColorPalette.gray900);
  static const smallSubTitle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorPalette.gray600,
      height: 1.5);

  static const hintTitle = TextStyle(
    color: Color(0xFF0F1728),
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 1.50,
  );

  static const hintBody = TextStyle(
    color: Color(0xFF475466),
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 1.43,
  );

  static const primaryButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 1.43,
  );

  static const secondaryButtonTextStyle = TextStyle(
      color: ColorPalette.onSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w600);

      static const TextStyle textTitle12gray700 = TextStyle(
    fontSize: 12, 
    color: ColorPalette.gray700,
    fontWeight: FontWeight.w400
  );
  static const TextStyle textTitle12 = TextStyle(
    fontSize: 12, 
    color: ColorPalette.gray700,
    fontWeight: FontWeight.w600
  );

  static const TextStyle textTitle12gray500 = TextStyle(
    fontSize: 12, 
    color: ColorPalette.gray500,
    fontWeight: FontWeight.w400
  );

  static const TextStyle textTitle12Primary = TextStyle(
    fontSize: 12, 
    color: ColorPalette.primary700,
    fontWeight: FontWeight.w600
  );

 static const TextStyle textTitle14Orange = TextStyle(
    fontSize: 14, 
    color: ColorPalette.orangeDark400,
    fontWeight: FontWeight.w600
  );

  static const TextStyle textSm600 = TextStyle(
    fontSize: 14,
    color: ColorPalette.gray500,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textSm400 = TextStyle(
    fontSize: 14,
    color: ColorPalette.gray700,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textSmSemibold = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    color: ColorPalette.gray700,
    fontWeight: FontWeight.w600,
  );

  static const textXsMedium = TextStyle(
    fontSize: 12,
    color: ColorPalette.gray500,
    fontWeight: FontWeight.w500,
  );
  static const textXlBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const textSmBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const textMdSemibold = TextStyle(
    fontSize: 16,
    color: ColorPalette.gray800,
    fontWeight: FontWeight.bold,
  );
  static const textMmRegular = TextStyle(
    fontSize: 14,
    color: ColorPalette.gray500,
    fontWeight: FontWeight.w400,
  );

  static const textMm500 = TextStyle(
    fontSize: 14,
    color: ColorPalette.gray500,
    fontWeight: FontWeight.w500,
  );

  static const smallNumberValue = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: ColorPalette.gray600);

  static const textSmMedium = TextStyle(
    fontSize: 14,
    color: ColorPalette.gray700,
    fontWeight: FontWeight.w500,
  );
  static const textXsRegular = TextStyle(
    fontSize: 12,
    color: ColorPalette.gray600,
    fontWeight: FontWeight.w400,
  );
  static const textSmMediumRose700 = TextStyle(
    fontSize: 14,
    color: ColorPalette.rose700,
    fontWeight: FontWeight.w500,
  );

  static const textSmMediumPrimary700 = TextStyle(
    fontSize: 14,
    color: ColorPalette.primary700,
    fontWeight: FontWeight.w500,
  );

  static const textSmSemiBold = TextStyle(
    fontSize: 14,
    color: ColorPalette.gray700,
    fontWeight: FontWeight.w600,
  );
  static const textSmMediumOrange500 = TextStyle(
    fontSize: 14,
    color: ColorPalette.orange500,
    fontWeight: FontWeight.w500,
  );

  static const titleText16 = TextStyle(
    color: ColorPalette.gray700,
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  static const titleText16700 = TextStyle(
    color: ColorPalette.gray700,
    fontSize: 16,
    fontWeight: FontWeight.w700
  );

  static const textTitlePage = TextStyle(
    fontSize: 18,
    color: ColorPalette.gray800,
    fontWeight: FontWeight.w600
  );

  static const TextStyle filterFontContent = TextStyle(
    color: Color.fromARGB(255, 102, 112, 133),
  );
  static const TextStyle selectedFilterFontContent = TextStyle(
    color: ColorPalette.selectedButtonBorderLine,
  );
}

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get fontHeader {
    return copyWith(
      fontSize: 22,
      height: 22 / 20,
    );
  }

  TextStyle get fontCaption {
    return copyWith(
      fontSize: 12,
      height: 12 / 10,
    );
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get lgSemibold {
    return semibold.copyWith(fontSize: 18);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle get primaryTextColor {
    return copyWith(color: ColorPalette.gray25);
  }

  TextStyle get whiteTextColor {
    return copyWith(color: Colors.white);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }

  TextStyle setTextHeight(double height) {
    return copyWith(height: height);
  }

  TextStyle setTextDecoration(TextDecoration decoration) {
    return copyWith(decoration: decoration);
  }
}
