import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../../../constants/color_palette.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.controller});

  final String text;
  final VoidCallback? onPressed;
  final bool controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.baseWhite,
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SecondaryButton(
                SharedLocalizations.of(context)!.cancel,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: controller
                  ? PrimaryButton(
                      text,
                      onPressed: onPressed,
                    )
                  : GreyedOutPrimaryButton(
                      text,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
