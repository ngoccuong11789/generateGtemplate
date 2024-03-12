import 'dart:async';

import 'package:shared_module/common_widgets/large_bottomsheet_background.dart';
import 'package:flutter/material.dart';

class CommonBottomSheetShape extends RoundedRectangleBorder {
  const CommonBottomSheetShape({
    super.side,
    super.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    ),
  });
}

class CommonBottomSheet extends StatelessWidget {
  final Widget child;
  final VoidCallback? onConfirm;
  final double? height;
  final double? width;
  final bool shrinkHeight;

  const CommonBottomSheet(
      {super.key,
      required this.child,
      this.onConfirm,
      this.height,
      this.shrinkHeight = false,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    final theDash = Container(
      width: 36,
      height: 6,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return SizedBox(
        height: height,
        width: width,
        child: Column(
            mainAxisSize: shrinkHeight ? MainAxisSize.min : MainAxisSize.max,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: theDash),
              shrinkHeight ? child : Expanded(child: child),
            ]));
  }
}

Future<void> showCommonBottomSheet(
    {required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    VoidCallback? onConfirm,
    bool shrinkHeight = false,
    bool adjustSoftKeyboard = false,
    double? height}) async {
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final softKeyboardAdjusted = adjustSoftKeyboard
            ? Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: builder(context))
            : builder(context);

        final safeAreaAdjusted = useSafeArea
            ? SafeArea(child: softKeyboardAdjusted)
            : softKeyboardAdjusted;

        return CommonBottomSheet(
          onConfirm: onConfirm,
          height: height,
          shrinkHeight: shrinkHeight,
          child: safeAreaAdjusted,
        );
      },
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape = const CommonBottomSheetShape(),
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      // showModalBottomSheet useSafeArea doesn't work. I implement it myself.
      // useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint);
}



Future<void> showCommonLargeBottomSheet(
    {required BuildContext context,
      required WidgetBuilder builder,
      Color? backgroundColor,
      double? elevation,
      ShapeBorder? shape,
      Clip? clipBehavior,
      BoxConstraints? constraints,
      Color? barrierColor,
      bool useRootNavigator = false,
      bool isDismissible = true,
      bool enableDrag = true,
      bool? showDragHandle,
      bool useSafeArea = false,
      RouteSettings? routeSettings,
      AnimationController? transitionAnimationController,
      Offset? anchorPoint,
      VoidCallback? onConfirm,
      double? height,
      double? width = double.infinity}) async {
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            const LargeBottomSheetBackground(),
            SizedBox(
              width: double.infinity,
              child: CommonBottomSheet(
                  onConfirm: onConfirm,
                  height: height,
                  width: width,
                  child: builder(context)),
            ),
          ],
        );
      },
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape = const CommonBottomSheetShape(),
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: true,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint);
}