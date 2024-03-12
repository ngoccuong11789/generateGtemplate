import 'package:flutter/material.dart';

import '../model/item_filter_content.dart';
import 'item_filter.dart';

class WrapContentWidget extends StatefulWidget {
  const WrapContentWidget(
      {super.key,
      required this.data,
      required this.dataSelect,
      required this.onTapItem,});

  final List<ItemFilterContent> data;
  final List<ItemFilterContent> dataSelect;
  final Function(ItemFilterContent itemFilterContent) onTapItem;

  @override
  State<WrapContentWidget> createState() => _WrapContentWidgetState();
}

class _WrapContentWidgetState extends State<WrapContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 4,
        spacing: 4,
        alignment: WrapAlignment.start,
        children: widget.data
            .map((e) => ItemFilter(
                itemFilterContent: e,
                isSelect: widget.dataSelect.contains(e),
                onTap: () {
                  widget.onTapItem(e);
                  // setState(() {
                  //   if(widget.dataSelect.contains(e)){
                  //     widget.dataSelect.remove(e);
                  //   }else{
                  //     widget.dataSelect.add(e);
                  //   }
                  // });
                }))
            .toList());
  }
}
