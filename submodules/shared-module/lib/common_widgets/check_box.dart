import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _value = !_value;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.gray300),
                shape: BoxShape.circle, color: _value ? ColorPalette.primary600 : Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: _value
                  ? const icon.SoctripIcon(
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
