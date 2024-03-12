import 'dart:ui';


// I copied it from https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
class Colors {
  Colors._();

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
