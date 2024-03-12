import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class PriceRange extends StatefulWidget {
  PriceRange(
      {super.key,
      required this.minPrice,
      required this.maxPrice,
      required this.change});

  double minPrice;
  double maxPrice;
  final Function(RangeValues values) change;

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SharedLocalizations.of(context)!.priceRange,
          style: CommonTextStyle.title,
        ),
        SizedBox(
          width: double.infinity,
          child: SliderTheme(
            data: const SliderThemeData(
              thumbColor: Colors.white,
              inactiveTickMarkColor: ColorPalette.grey200,
              inactiveTrackColor: ColorPalette.grey200,
              activeTickMarkColor: ColorPalette.primary600,
              activeTrackColor: ColorPalette.primary600,
            ),
            child: RangeSlider(
              values: RangeValues(widget.minPrice, widget.maxPrice),
              min: widget.minPrice,
              max: widget.maxPrice,
              divisions: 10,
              onChanged: (RangeValues values) {
                setState(() {
                  widget.minPrice = values.start;
                  widget.maxPrice = values.end;
                  widget.change(values);
                });
              },
            ),
          ),
        ),
        Text(
          "${SharedLocalizations.of(context)!.simpleCurrency(widget.minPrice)} - ${SharedLocalizations.of(context)!.simpleCurrency(widget.maxPrice)}",
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
