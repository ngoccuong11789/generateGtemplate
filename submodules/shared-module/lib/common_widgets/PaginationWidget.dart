import 'package:shared_module/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget(
      {super.key,
      required this.currentPage,
      required this.numberPages,
      required this.handlingPagination});

  final int currentPage;
  final int numberPages;
  final Function(int index) handlingPagination;

  @override
  Widget build(BuildContext context) {
    NumberPaginatorController controller = NumberPaginatorController();
    controller.currentPage = currentPage;
    return NumberPaginator(
      numberPages: numberPages,
      onPageChange: (int index) {
        handlingPagination(index);
      },
      // initially selected index
      controller: controller,
      config: NumberPaginatorUIConfig(
        // default height is 48
        height: 40,
        buttonShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonSelectedForegroundColor: ColorPalette.gray700,
        buttonUnselectedForegroundColor: ColorPalette.gray500,
        buttonUnselectedBackgroundColor: ColorPalette.gray200,
        buttonSelectedBackgroundColor: Colors.white,
      ),
    );
  }
}
