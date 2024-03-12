import 'dart:typed_data';

import 'package:bloom_filter/two_hashes.dart';
import 'package:hashlib/hashlib.dart';
import 'package:hashlib_codecs/hashlib_codecs.dart';
import 'hashable_input.dart';

class Hashing {
  static const _defaultSeed = 9;

  /// Get the default seed for the XXH hashing algorithm
  ///
  /// return The default seed
  static int getDefaultSeed() => _defaultSeed;

  List<int> getIndexes(
      HashableInput element, int size, int hashCount, int? seed0) {
    int seed = seed0 ?? _defaultSeed;
    List<int> arr = [];
    TwoHashes hashes = hashTwice(element, seed);
    for (int i = 0; i < hashCount; i++) {
      arr.add(doubleHashing(i, hashes.first, hashes.second, size));
    }
    return arr;
  }

  int doubleHashing(int n, BigInt hashA, BigInt hashB, int size) {
    BigInt nCubed = BigInt.from(n).pow(3);
    BigInt numerator = hashA +
        (hashB * BigInt.from(n)) +
        (nCubed - BigInt.from(n)) ~/ BigInt.from(6);
    BigInt result = numerator % BigInt.from(size);
    return result.toInt();
  }

  TwoHashes hashTwice(HashableInput value, int? seed) {
    int seed0 = seed ?? _defaultSeed;
    return TwoHashes(serialize(value, seed0 + 1), serialize(value, seed0 + 2));
  }

  BigInt serialize(HashableInput element, int seed) {
    XXHash64 xxHash64 = XXHash64(seed);
    int hash = xxHash64.convert(element.byteArrayValue.toList()).number();
    String unsignedString = hash.toUnsigned(32).toRadixString(10);
    BigInt bigIntValue = BigInt.parse(unsignedString);
    return bigIntValue;
  }
}
