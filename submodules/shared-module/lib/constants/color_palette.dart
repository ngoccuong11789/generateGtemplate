import "package:flutter/material.dart";

class ColorPalette {
  static const Color baseWhite = Color(0xFFFFFFFF);
  static const Color baseDark = Color.fromARGB(255, 0, 0, 0);
  static const Color bottomSheetDash = Color(0x4D3C3C43);
  static const Color primary = Color(0xFF1570EF);
  static const Color secondary = Color.fromARGB(255, 208, 213, 221);
  static const Color onPrimary = baseWhite;
  static const Color onSecondary = Color.fromARGB(255, 52, 64, 84);
  static const Color disabled = Color(0xFFD0D5DD);
  static const Color bluePrimary = Color.fromARGB(255, 21, 112, 239);
  static const Color mainTextColor = Color.fromARGB(255, 52, 64, 84);
  static const Color appBarIcon = Color.fromARGB(255, 71, 84, 103);

  static const Color red700 = Color(0xffb42318);
  static const Color grey200 = Color(0xffeaecf0);
  static const Color grey700 = Color(0xff344054);
  static const Color gray800 = Color(0xFF1D2939);
  static const Color gray900 = Color(0xFF101828);
  static const Color gray700 = Color(0xFF344054);
  static const Color gray600 = Color(0xFF475467);
  static const Color gray500 = Color(0xFF667085);
  static const Color gray300 = Color(0xFFD0D5DD);
  static const Color gray200 = Color(0xFFEAECF0);
  static const Color gray100 = Color(0xFFF2F4F7);
  static const Color primary500 = Color(0xFF2E90FA);
  static const Color primary100 = Color(0xFFD1E9FF);
  static const Color primary50 = Color(0xFFEFF8FF);
  static const Color primary200 = Color(0xFFB2DDFF);
  static const Color primary600 = Color(0xFF1570EF);
  static const Color primary700 = Color(0xFF175CD3);
  static const Color primary25 = Color(0xFFF5FAFF);

  static const Color buyButtonBackground = Color.fromARGB(255, 21, 112, 239);
  static const Color greyBorderLine = Color.fromARGB(255, 234, 236, 240);
  static const Color greyBackground = Color.fromARGB(255, 234, 236, 240);

  static const Color redPrice = Color.fromARGB(255, 255, 68, 5);
  static const Color blue600 = Color(0xff1570ef);
  static const Color grey500 = Color(0xff667085);
  static const Color homeBackground = Color(0xfff2f4f7);
  static const Color grey400 = Color(0xff98a2b3);
  static const Color grey800 = Color(0xff1d2939);
  static const Color orange400 = Color(0xffff4405);

  static const Color linearGradientTop = Color(0xFFD1E9FF);
  static const Color linearBubble = Color(0xFF1879FF);
  static const Color linearGradientBottom = Color(0x00D1E9FF);
  static const Color linearOrangeLeft = Color(0xFFFF4405);
  static const Color linearOrangeRight = Color(0xFFFF692E);
  static const Color orangeDark400 = Color(0xFFFF692E);
  static const Color orangeDark500 = Color(0xFFFF4405);
  static const Color travelDark20 = Color(0x33344054);
  static const Color gray25 = Color(0xFFFCFCFD);
  static const Color otherDarkBlue = Color(0x66101828);
  static const Color warning400 = Color(0xFFFDB022);
  static const Color shadowXS = Color(0x0D101828);
  static const Color green50 = Color(0xffecfdf3);
  static const Color blue50 = Color(0xffeff8ff);
  static const Color orange50 = Color(0xfffff4ed);
  static const Color green700 = Color(0xff027a48);
  static const Color orange700 = Color(0xffb93815);
  static const Color shadowCT = Color(0xFFEAF3FF);
  static const Color kFlightIcon = Color(0xFF175CD3);
  static const Color kHotelIcon = Color(0xFFDD2590);
  static const Color kCarRentalIcon = Color(0xFFEF6820);
  static const Color kTourIcon = Color(0xFF6938EF);
  static const Color tertiary = Color(0x4D3C3C43);
  static const Color rose50 = Color(0xFFFFF1F3);
  static const Color rose500 = Color(0xFFF63D68);
  static const Color rose700 = Color(0xFFC01048);
  static const Color white0 = Color(0x00000000);
  static const Color white80 = Color(0xCC000000);
  static const Color orange500 = Color(0xFFEF6820);
  static const Color circleBorder = Color(0xFF97A0A6);
  static const Color success25 = Color(0xfff6fef9);

  static const Color buttonBackground = Colors.white;
  static const Color buttonBorderLine = Color.fromARGB(255, 234, 236, 240);
  static const Color selectedButtonBorderLine =
      Color.fromARGB(255, 21, 112, 239);
  static const Color selectedButtonBackground =
      Color.fromARGB(255, 239, 248, 255);

  static const Color error250 = Color(0xFFFFFBFA);
  static const Color error700 = Color(0xFFB42318);

  static const Color success250 = Color(0xFFF6FEF9);
  static const Color success50 = Color(0xFFECFDF3);
  static const Color success300 = Color(0xFF6CE9A6);
  static const Color success500 = Color(0xFF12B76A);
  static const Color success600 = Color(0xFF039855);
  static const Color success700 = Color(0xFF027A48);

  static const Color error300 = Color(0xFFFDA29B);
  static const Color error600 = Color(0xFFD92D20);
  static const Color error500 = Color(0xFFF04438);
  static const Color warning250 = Color(0xFFFFFCF5);
  static const Color warning50 = Color(0xFFFFFAEB);
  static const Color warning300 = Color(0xFFFEC84B);
  static const Color warning500 =Color(0xFFF79009);
  static const Color warning600 = Color(0xFFDC6803);
  static const Color warning700 =Color(0xFFB54708);
}

class Gradients {
  static const Gradient gradientHotDeal = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorPalette.linearGradientTop,
      ColorPalette.linearGradientBottom,
    ],
  );
  static const Gradient linearOrange = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      ColorPalette.linearOrangeLeft,
      ColorPalette.linearOrangeRight,
    ],
  );
}
