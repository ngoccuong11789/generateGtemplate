
import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/search_term/model/sampleList.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({super.key, required this.callback, required this.textEditingController});

  final Function(String text) callback;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        contentAppbar: SizedBox(
            height: 40,
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              controller: textEditingController,
              autofocus: true,
              onSubmitted: (value) {
                callback(value);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: ColorPalette.redPrice,
                  ),
                ),
                prefixIcon: const icon.SoctripIcon(icon.Icons.searchLg,
                  style: TextStyle(color: ColorPalette.appBarIcon),
                ),
              ),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SharedLocalizations.of(context)!.searchSuggestion,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ...productSearchList
              .take(5)
              .map((e) => Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: ColorPalette.greyBorderLine))),
                    child: TextButton(
                      onPressed: () {
                        callback(e);
                      },
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
