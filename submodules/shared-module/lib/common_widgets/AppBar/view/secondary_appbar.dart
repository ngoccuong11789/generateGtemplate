import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SecondaryAppBar extends AppBar {
  // String titleText
  SecondaryAppBar({
    super.key,
    super.leading = const CommonBackButton(),
    super.automaticallyImplyLeading = true,
    super.title,
    super.actions,
    super.flexibleSpace,
    super.bottom,
    super.elevation = 3,
    super.scrolledUnderElevation,
    super.notificationPredicate = defaultScrollNotificationPredicate,
    super.shadowColor = const Color(0x19101828),
    super.surfaceTintColor,
    super.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        side: BorderSide(color: Color(0x0F101727))),
    super.backgroundColor = Colors.white,
    super.foregroundColor,
    super.iconTheme,
    super.actionsIconTheme,
    super.primary = true,
    super.centerTitle,
    super.excludeHeaderSemantics = false,
    super.titleSpacing,
    super.toolbarOpacity = 1.0,
    super.bottomOpacity = 1.0,
    super.toolbarHeight,
    super.leadingWidth,
    super.toolbarTextStyle,
    super.titleTextStyle = const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: ColorPalette.gray800),
    super.forceMaterialTransparency = false,
    super.clipBehavior,
  });
}

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: const icon.SoctripIcon(icon.Icons.chevronLeft,
        style: TextStyle(color: ColorPalette.gray600),
      ),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    );
  }
}
