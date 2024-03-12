part of 'soctrip_icons.dart';

class IconUtil {
  static soctrip.Icon? getIconByName(String name) {
    return _IconByName.map[name];
  }

  static soctrip.Icon? getIconByOriginalName(String name) {
    return _IconByOriginalName.map[name];
  }
}