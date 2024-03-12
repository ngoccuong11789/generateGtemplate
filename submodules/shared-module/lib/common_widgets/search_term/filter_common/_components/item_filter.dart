import 'package:flutter/cupertino.dart';
import 'package:shared_module/constants/color_palette.dart';

import '../model/item_filter_content.dart';

class ItemFilter extends StatelessWidget {
  const ItemFilter(
      {super.key,
      required this.itemFilterContent,
      required this.isSelect,
      required this.onTap});

  final ItemFilterContent itemFilterContent;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color:
                    isSelect ? ColorPalette.primary600 : ColorPalette.grey200,
                width: 1)),
        child: Text(
          itemFilterContent.content,
          style: TextStyle(
              color:
                  isSelect ? ColorPalette.primary600 : ColorPalette.gray500,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          maxLines: 1,
        ),
      ),
    );
  }
}
