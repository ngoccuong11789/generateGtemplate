import 'package:shared_module/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class CommonRoundCheckBoxWidget extends StatefulWidget {
  const CommonRoundCheckBoxWidget(
      {super.key, required this.value, this.callBack});

  final bool value;
  final Function()? callBack;

  @override
  State<CommonRoundCheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CommonRoundCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: widget.callBack,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorPalette.gray300),
            shape: BoxShape.circle,
            color: widget.value ? ColorPalette.primary600 : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: widget.value
              ?  const icon.SoctripIcon(
                  icon.Icons.check,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,)
                )
              : const icon.SoctripIcon(
                  icon.Icons.check,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white),)
        ),
      ),
    ));
  }
}
