library bloom_filter;

import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'bitset.dart';
import 'formulas.dart';
import 'hashable_input.dart';
import 'hasing.dart';

class BloomFilter {
  late Hashing _hashing;
  late int seed;
  late final int _size;
  late final int _nbHashes;
  late BitSet _filter;

  BloomFilter(int size, int nbHashes) {
    if (nbHashes < 1) {
      throw ArgumentError(
          "A BloomFilter cannot use less than one hash function");
    }
    _hashing = Hashing();
    _size = size;
    _nbHashes = nbHashes;
    _filter = BitSet(size);
    seed = Hashing.getDefaultSeed();
  }

  static BloomFilter create(int nbItems, double errorRate) {
    int size = Formulas.optimalFilterSize(nbItems, errorRate);
    int hashes = Formulas.optimalHashes(size, nbItems);
    return BloomFilter(size, hashes);
  }

  static BloomFilter load(String filterString) {
    List<String> arrData = filterString.split("-");
    int size = int.parse(arrData[0]);
    int hashes = int.parse(arrData[1]);
    int seedInit = int.parse(arrData[2]);
    String filter = filterString.substring(
        arrData[0].length + arrData[1].length + arrData[2].length + 3);
    BloomFilter bloomFilter = BloomFilter(size, hashes);
    bloomFilter.seed = seedInit;
    bloomFilter.setFilter(filter);
    return bloomFilter;
  }

  void setFilter(String filterString) {
    Uint8List binaryData = base64.decode(filterString);
    _filter = BitSet.valueOf(binaryData);
  }

  String get filterString => bitSetToUTF8String(_filter);

  String bitSetToUTF8String(BitSet bitSet) {
    Uint8List byteArray = Uint8List.fromList(bitSet.toByteArray());
    String base64String = base64Encode(byteArray);
    base64String = '$_size-$_nbHashes-$seed-$base64String';
    return base64String;
  }

  void add(String element) {
    HashableInput hashableInput = HashableInput(element);
    List<int> indexes =
        _hashing.getIndexes(hashableInput, _size, _nbHashes, seed);
    for (int index in indexes) {
      _filter.set(index);
    }
  }

  static BloomFilter from(Iterable<String> items, double errorRate, int? seed) {
    List<HashableInput> array = [];
    for (String item in items) {
      array.add(HashableInput(item));
    }
    BloomFilter filter = create(array.length, errorRate);
    if (seed != null) {
      filter.seed = seed;
    }
    for (String element in items) {
      filter.add(element);
    }
    return filter;
  }

  bool has(String element) {
    HashableInput hashableInput = HashableInput(element);
    List<int> indexes =
        _hashing.getIndexes(hashableInput, _size, _nbHashes, seed);
    for (int index in indexes) {
      if (!_filter.get(index)) {
        return false;
      }
    }
    return true;
  }

  int getLength() => _filter.cardinality();

  double rate() => math
      .pow(1 - math.exp((-getLength() / _size)), _nbHashes.toDouble())
      .toDouble();

  bool equals(BloomFilter other) {
    if (_size != other.getSize() || _nbHashes != other._nbHashes) {
      return false;
    }
    return _filter == other._filter;
  }

  int getSize() {
    return _size;
  }
}

void main() {
  BloomFilter filter = BloomFilter.load(
      "4793-7-9-AAAAAAAAAAAACAAAAAAAABAAAAAACAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAABAQAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAACAAAIAAAAAAAAAgAAAAAQAAgAAAAAAAAAAACAAAAAAEAAAAAAAAAAABAAAAIAAAAIAAAAAAAAAABAAAAAAACACAAAAAAAIAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAggAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAABAAAAAAABAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAIAAAABAAAAAAAAAAAAAAAAAAACAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAgBAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAEAAAAAABA=");
  print(filter.has("3d267bf2-5c1e-45c7-bc47-6f50f2e134f7"));
  print(filter.has("b36d1da0-5081-11ee-b768-e9097374cf87"));
}
