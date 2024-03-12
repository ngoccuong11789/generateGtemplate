import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class Currency extends StatelessWidget {
  const Currency({
    super.key,
    required this.name,
    required this.value,
    this.prePromotionPrice = true,
    this.lineThrough = true,
    this.colorText,
    this.textSize,
    this.fontWeight
  });

  final String name;
  final num value;
  final bool? prePromotionPrice;
  final bool lineThrough;
  final Color? colorText;
  final double? textSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    String symbol = SharedLocalizations.of(context)!.currencySymbol(name);
    TextStyle amountSpanStyle() {
      return prePromotionPrice == true
          ? TextStyle(
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: textSize ?? 12,
              fontFamily: "Inter",
              color: colorText ?? Colors.grey[500],
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          :  TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: textSize ?? 16,
              fontFamily: "Inter",
              color: colorText ?? Colors.deepOrange);
    }

    TextStyle currencySpanStyle() {
      return prePromotionPrice == true
          ? TextStyle(
              letterSpacing: 2,
              fontWeight: fontWeight ??FontWeight.w400,
              fontSize: textSize ?? 12,
              fontFamily: "Inter",
              color: colorText ?? Colors.grey[500],)
          :  TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
              fontSize: textSize ?? 16,
              fontFamily: "Inter",
              color: Colors.deepOrange);
    }

    List<TextSpan> spans = SharedLocalizations.of(context)!
        .currencySpan(value, name: name, symbol: symbol, symbolSpan: (text) {
      return TextSpan(text: text, style: currencySpanStyle());
    }, amountSpan: (text) {
      return TextSpan(text: text, style: amountSpanStyle());
    }, spaceSpan: (text) {
      return TextSpan(text: text);
    });
    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
