import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget({super.key, this.label, required this.child});

  final String? label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(
                        label!,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.gray700),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "*",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.redPrice),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              )
            : Container(),
        child
      ],
    );
  }
}
