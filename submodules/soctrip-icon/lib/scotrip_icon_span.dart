part of "soctrip_icons.dart";

class SoctripIconSpan extends TextSpan {
  final soctrip.Icon icon;

  SoctripIconSpan(
    this.icon, {
    TextStyle? style,
    super.recognizer,
    super.mouseCursor,
    super.onEnter,
    super.onExit,
    super.semanticsLabel,
    super.locale,
    super.spellOut,
  }) : super(
          children: [
            TextSpan(
                text: icon.code,
                style: const TextStyle(
                    fontFamily: _SoctripIconManager.fontFamily
                )
            ),
          ],
        ) {
    _SoctripIconManager.tellDartRuntimeOptimizationNotToIgnoreFontLoad();
  }
}