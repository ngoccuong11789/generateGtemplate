part of "soctrip_icons.dart";

class SoctripIcon extends StatelessWidget {

  final soctrip.Icon icon;
  final TextStyle? style;
  static const TextStyle defaultStyle = TextStyle(
      fontSize: 24,
      fontFamily: _SoctripIconManager.fontFamily
  );

  const SoctripIcon(this.icon, { super.key, this.style});

  @override
  Widget build(BuildContext context) {
    _SoctripIconManager.tellDartRuntimeOptimizationNotToIgnoreFontLoad();
    TextStyle mergedStyle;
    if(style == null) {
      mergedStyle = defaultStyle.copyWith(
        color: icon.color
      );
    } else {
      mergedStyle = style!.copyWith(
        color: style!.color ?? icon.color,
        fontSize: style!.fontSize ?? defaultStyle.fontSize,
        fontFamily: defaultStyle.fontFamily
      );
    }

    return Text(icon.code, style: mergedStyle,);
  }

}