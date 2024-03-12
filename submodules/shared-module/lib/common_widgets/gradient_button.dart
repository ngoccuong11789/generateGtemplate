import 'package:shared_module/constants/color_palette.dart';
import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  const GradientTextButton(
      {super.key,
      required this.gradientColors,
      required this.text,
      this.onPressed,
      this.leading,
      this.trailing,
      required this.textColor});

  final List<Color> gradientColors;
  final String text;
  final Color textColor;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors)),
            )),
            TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.all(0),
                ),
              ),
              onPressed: onPressed,
              child: ListTile(
                  leading: leading,
                  title: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 20 / 14,
                    ),
                  ),
                  trailing: trailing),
            ),
          ],
        ));
  }
}
