part of "soctrip_icons.dart";

class _SoctripIconManager {

  static const fontFamily = "Soctrip Icon";
  static const _fontFile = "packages/soctrip_icons/assets/fonts/soctrip-icon.ttf";
  static Future<void> fontLoad = _loadFont();
  static bool _isFontLoadStarted = false;
  static _loadFont() async {
    _isFontLoadStarted = true;
    final loader = FontLoader(fontFamily);
    loader.addFont(rootBundle.load(_fontFile));
    await loader.load();
    debugPrint("Soctrip Icon font was loaded");
  }
  static tellDartRuntimeOptimizationNotToIgnoreFontLoad(){
    if(!_isFontLoadStarted){
      // ignore: avoid_print
      print("fontLoad Future: $fontLoad");
    }
  }
}