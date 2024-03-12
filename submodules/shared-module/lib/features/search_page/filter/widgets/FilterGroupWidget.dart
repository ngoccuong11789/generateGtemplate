import 'package:shared_module/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/features/search_page/model/FilterModel.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import 'filterElementWidget.dart';

class FilterGroupWidget extends StatefulWidget {
  const FilterGroupWidget(
      {super.key,
      required this.maxAllowed,
      required this.data,
      required this.parentWidth,
      required this.groupName,
      required this.selectedElement,
      this.isMulti,
      this.isOneColumn = false});

  final int maxAllowed;
  final String groupName;
  final List<FilterElementModel> data;
  final double parentWidth;
  final bool? isMulti;
  final List<FilterElementModel> selectedElement;
  final bool isOneColumn;

  @override
  State<FilterGroupWidget> createState() => _FilterGroupWidgetState();
}

class _FilterGroupWidgetState extends State<FilterGroupWidget> {
  bool _showAll = false;
  late List<String> visibleElement;

  @override
  Widget build(BuildContext context) {
    List<FilterElementModel> visibleElement =
        _showAll ? widget.data : widget.data.take(widget.maxAllowed).toList();
    int space = 38;
    final width = widget.isOneColumn
        ? (widget.parentWidth - space)
        : (widget.parentWidth - space) / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.groupName,
          style: const TextStyle(
            color: Color(0xFF0F1728),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.isOneColumn ? 1 : 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6.0,
            childAspectRatio: width / 38,
          ),
          itemCount: visibleElement.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (contextItem, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.isMulti == false) {
                      if (widget.selectedElement.isNotEmpty) {
                        widget.selectedElement[0] = widget.data[index];
                      } else {
                        widget.selectedElement.add(widget.data[index]);
                      }
                    } else {
                      if (widget.selectedElement.contains(widget.data[index])) {
                        widget.selectedElement.remove(widget.data[index]);
                      } else {
                        widget.selectedElement.add(widget.data[index]);
                      }
                    }
                  });
                },
                child: FilterElementWidget(
                    status: widget.selectedElement.contains(widget.data[index]),
                    content: visibleElement[index].name));
          },
        ),
        GestureDetector(
          child: (widget.maxAllowed == widget.data.length ||
                  widget.maxAllowed > widget.data.length)
              ? const SizedBox()
              : _showAll
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _showAll = false;
                        });
                      },
                      child: Text(
                        SharedLocalizations.of(context)!.viewLess,
                        style: const TextStyle(
                            color: ColorPalette.primary600,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _showAll = true;
                        });
                      },
                      child: Text(
                          '${SharedLocalizations.of(context)!.viewMore} (${widget.data.length - widget.maxAllowed})',
                          style: const TextStyle(
                              color: ColorPalette.primary600,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 1,
          color: ColorPalette.greyBorderLine,
        ),
      ],
    );
  }
}
