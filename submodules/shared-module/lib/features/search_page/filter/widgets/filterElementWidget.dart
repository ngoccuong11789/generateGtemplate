import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/common_square_check_box.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class FilterElementWidget extends StatefulWidget {
  const FilterElementWidget(
      {super.key, required this.status, required this.content});

  final bool status;
  final String content;

  @override
  State<FilterElementWidget> createState() => _FilterElementWidgetState();
}

class _FilterElementWidgetState extends State<FilterElementWidget> {
  @override
  Widget build(BuildContext context) {
    return ["5", "4", "3", "2", "1"].contains(widget.content)
        ? Row(children: [
            CommonSquareCheckBox(value: widget.status),
            ...List.filled(int.parse(widget.content), 0).map(
              (e) {
                return const icon.SoctripIcon(icon.Icons.solidStar01,
                  style: TextStyle(color: Color.fromARGB(255, 253, 176, 34)),
                );
              },
            ).toList(),
          ])
        : Row(
            children: [
              CommonSquareCheckBox(value: widget.status),
              Text(
                widget.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              )
            ],
          );
  }
}
