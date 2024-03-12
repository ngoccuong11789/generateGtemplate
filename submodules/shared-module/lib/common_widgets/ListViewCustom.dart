import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'search_term/model/ConfigListViewModel.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({
    super.key,
    required this.length,
    required this.builder,
    required this.configListView,
    this.loading = false,
    this.direction = Axis.vertical
  });

  final int length;
  final bool loading;
  final Widget Function(BuildContext, int) builder;
  final ConfigListView configListView;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          MasonryGridView.builder(
            scrollDirection: direction,
              padding: const EdgeInsets.all(0),
              itemCount: length,
              crossAxisSpacing: configListView.crossAxisSpacing,
              mainAxisSpacing: configListView.mainAxisSpacing,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: configListView.maxCrossAxisExtent,
              ),
              itemBuilder: builder),
          loading
              ? Container(
            padding: const EdgeInsets.only(bottom: 16),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          )
              : const SizedBox()
        ],
      );
  }
}