import 'dart:convert';
import 'dart:typed_data';

class HashableInput {
  late Uint8List byteArrayValue;
  late String originalValue;

  HashableInput(String value) {
    originalValue = value;
    byteArrayValue = Uint8List.fromList(utf8.encode(value));
  }
}
