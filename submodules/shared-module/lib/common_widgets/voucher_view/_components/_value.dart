import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class ValueWidget extends StatelessWidget {
  const ValueWidget( {super.key, this.value});

  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return value != null
        ? Text(value.toString())
        : const icon.SoctripIcon(icon.Icons.minus,
           style: TextStyle(color: ColorPalette.gray300,)
          );
  }
}
