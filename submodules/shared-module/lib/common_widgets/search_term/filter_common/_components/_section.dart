import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SectionWidget extends StatelessWidget {
  const SectionWidget(
      {super.key,
      required this.content,
      required this.child,
      this.onTap,
      this.status});

  final String content;
  final Widget child;
  final Function()? onTap;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.gray700),
            ),
            onTap != null
                ? GestureDetector(
                    onTap: () {
                      onTap!();
                    },
                    child: Row(
                      children: [
                        Text(
                            status!
                                ? SharedLocalizations.of(context)!.viewLess
                                : SharedLocalizations.of(context)!.viewMore,
                            style: const TextStyle(
                                color: ColorPalette.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                         icon.SoctripIcon(
                           status! ? icon.Icons.chevronUp : icon.Icons.chevronDown,
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorPalette.primary,)
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        child
      ],
    );
  }
}
