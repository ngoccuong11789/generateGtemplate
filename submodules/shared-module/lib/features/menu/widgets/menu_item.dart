import 'package:flutter/material.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.menuItemIcon,
      required this.menuItemText,
      this.hasBottomBorder = true,
      this.menuItemOnPressed});

  final Widget menuItemIcon;
  final String menuItemText;
  final bool hasBottomBorder;
  final Function()? menuItemOnPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: menuItemOnPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: menuItemIcon),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                    border: hasBottomBorder
                        ? const Border(
                            bottom: BorderSide(
                            color: Color(0xFFEAECF0),
                            width: 1,
                          ))
                        : const Border()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        menuItemText,
                        style: const TextStyle(fontSize: 14, height: 20 / 14),
                      ),
                    ),
                    const icon.SoctripIcon(
                      icon.Icons.chevronRight,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
