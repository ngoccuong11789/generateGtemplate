

import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    this.title,
    this.titleStyle,
    this.paddingTop = 65,
    this.primaryButtonTitle,
    this.primaryButtonStyle,
    this.primaryButtonOnPressed,
    this.itemBuilder,
    this.secondButtonEnable = true,
    this.secondButtonTitle,
    this.secondButtonStyle,
    this.secondButtonOnPressed,
    // required this.list,
  });
  final Widget? itemBuilder;

  /// Title for bottom sheet
  final String? title;
  // final List list;

  /// Define it if you want to use a different style for title
  final TextStyle? titleStyle;

  /// Define how to bottom sheet margin top
  final double paddingTop;

  final String? primaryButtonTitle;

  /// Define it if you want to use a different style for primary button
  final TextStyle? primaryButtonStyle;

  final String? secondButtonTitle;

  /// Define it if you want to use a different style for second button
  final TextStyle? secondButtonStyle;

  /// Enable [True] it if you want to show the second button
  final bool secondButtonEnable;

  /// Callback for primary button when it clicked
  final Function(BuildContext context)? primaryButtonOnPressed;

  /// Callback for second button when it clicked
  final Function(BuildContext context)? secondButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.transparent,
                      ))),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                       UnconstrainedBox(
                        child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 6,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.grey[300],),
                      )),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              color: Color(0xFF333333),
                            ),
                          ),
                          GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const icon.SoctripIcon(icon.Icons.xClose,
                            style: TextStyle(fontSize: 20,
                            color: Color.fromARGB(255, 16, 24, 40)),
                          ),
                        )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      itemBuilder ?? Container(),
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: _buildButtons(
                          context,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget _buildButtons(BuildContext context) {
    if (!secondButtonEnable)
      return Row(
        children: [
          PrimaryButton(
            primaryButtonTitle ?? SharedLocalizations.of(context)!.save,
            onPressed: () {
              if (primaryButtonOnPressed != null) {
                primaryButtonOnPressed!(context);
              }
              Navigator.pop(context);
            },
          ),
        ],
      );
    return Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SecondaryButton(
                    secondButtonTitle ?? SharedLocalizations.of(context)!.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                      if (secondButtonOnPressed != null) {
                        secondButtonOnPressed!(context);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    primaryButtonTitle ?? SharedLocalizations.of(context)!.save,
                    onPressed: primaryButtonOnPressed == null ? null : () {
                      if (primaryButtonOnPressed != null) {
                        primaryButtonOnPressed!(context);
                      }
                      Navigator.pop(context);
                    },
                  ),
                )
                   
              )
            ],
          );
  }
}
