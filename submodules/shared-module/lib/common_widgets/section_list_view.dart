import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_module/utils/collection_util.dart';

part 'section_list_view/item_count.dart';

part 'section_list_view/flat_index_map.dart';

part 'section_list_view/scroll_controller.dart';

part 'section_list_view/item_index.dart';

part 'section_list_view/item_builder.dart';

class SectionListView extends StatelessWidget {
  final SectionItemWidgetBuilder itemBuilder;
  final SectionItemCount sectionItemCount;
  final SectionListScrollController? scrollController;

  const SectionListView(
      {super.key,
      required this.itemBuilder,
      required this.sectionItemCount,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    FlatIndexMap indexMap = FlatIndexMap(sectionItemCount);
    scrollController?._indexMap = indexMap;
    return ScrollablePositionedList.builder(
      itemCount: indexMap.flatCount,
      itemBuilder: (context, index) => _buildFlatItem(context, index, indexMap),
      itemScrollController: scrollController?._itemScrollController,
      itemPositionsListener: scrollController?._itemPositionsListener,
    );
  }

  Widget _buildFlatItem(
      BuildContext context, int flatIndex, FlatIndexMap indexMap) {
    final indexes = indexMap.getSectionItemIndex(flatIndex);
    return _buildItem(context, indexes.sectionIndex, indexes.itemIndex);
  }

  Widget _buildItem(BuildContext context, int sectionIndex, int itemIndex) {
    return itemBuilder(context, sectionIndex, itemIndex);
  }
}
