import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class CardTitleContent extends StatelessWidget {
  final String textTitle;
  final String content;
  final bool isPrice;
  final num minPrice;

  const CardTitleContent({super.key,
    this.content="",
    this.textTitle="",
    this.isPrice=false,
    this.minPrice = 0});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textTitle,textAlign: TextAlign.start, style: const TextStyle(
            color: Color(0xFF98A2B3),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          )), const SizedBox(height: 4),
          Text(content, style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),),
          isPrice ? Text(SharedLocalizations.of(context)!.minimumOrderPrices(minPrice, "\$ "), style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),) : const SizedBox()
        ],
      ),
    );;
  }
}
