import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/input_text.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;


class SearchVoucherProduct extends StatefulWidget {
  const SearchVoucherProduct({super.key, required this.filter});

  final Function(String) filter;

  @override
  State<SearchVoucherProduct> createState() => _SearchVoucherProductState();
}

class _SearchVoucherProductState extends State<SearchVoucherProduct> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: null,
      onChanged: (value) {
        widget.filter(value);
      },
      decoration: inputDecorationForInputText(
          hintText: SharedLocalizations.of(context)!.searchProduct,
          prefixIcon: Container(
            alignment: Alignment.center,
            height: 18, width: 18,
            child: const icon.SoctripIcon(
            icon.Icons.searchLg,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF999999),
              ),
            ),
          )),
      style: const TextStyle(
        color: Color(0xFF667084),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 1.43,
      ),
      maxLength: 30,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      autofocus: true,
    );
  }
}
