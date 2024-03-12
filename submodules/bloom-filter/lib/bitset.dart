import 'dart:typed_data';

class BitSet {
  late List<int> _words;
  late int _wordsInUse = 0;
  late bool _sizeIsSticky = false;
  static const int addressBitsPerWord = 6;

  BitSet(int nBits) {
    if (nBits < 0) {
      throw ArgumentError('nbits < 0: $nBits');
    }
    _initWords(nBits);
    _sizeIsSticky = true;
  }

  void _initWords(int nBits) {
    _words = List<int>.filled(_wordIndex(nBits - 1) + 1, 0);
  }

  static int _wordIndex(int bitIndex) {
    return bitIndex >> addressBitsPerWord;
  }

  BitSet.fromWords(List<int> words) {
    _words = words;
    _wordsInUse = words.length;
    _checkInvariants();
  }

  void _checkInvariants() {
    assert(_wordsInUse == 0 || _words[_wordsInUse - 1] != 0);
    assert(_wordsInUse >= 0 && _wordsInUse <= _words.length);
    assert(_wordsInUse == _words.length || _words[_wordsInUse] == 0);
  }

  Uint8List toByteArray() {
    int n = _wordsInUse;
    if (n == 0) {
      return Uint8List(0);
    }
    int len = 8 * (n - 1);
    for (int x = _words[n - 1]; x != 0; x >>= 8) {
      len++;
    }
    Uint8List bytes = Uint8List(len);
    int byteIndex = 0;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < 8; j++) {
        bytes[byteIndex++] = (_words[i] >> (j * 8)) & 0xFF;
      }
    }
    for (int x = _words[n - 1]; x != 0; x >>= 8) {
      bytes[byteIndex++] = x & 0xFF;
    }
    return bytes;
  }

  static BitSet valueOf(Uint8List bytes) {
    return BitSet.fromByteArray(bytes);
  }

  static BitSet fromByteArray(Uint8List bytes) {
    int n = bytes.length;
    List<int> words = List<int>.filled((n + 7) ~/ 8, 0);
    int byteIndex = 0;
    for (int i = 0; i < n; i++) {
      words[i ~/ 8] |= (bytes[i] & 0xFF) << ((i % 8) * 8);
    }
    return BitSet.fromWords(words);
  }

  int cardinality() {
    int sum = 0;
    for (int i = 0; i < _wordsInUse; i++) {
      sum += _bitCount(_words[i]);
    }
    return sum;
  }

  int _bitCount(int n) {
    n = (n & 0x55555555) + ((n >> 1) & 0x55555555);
    n = (n & 0x33333333) + ((n >> 2) & 0x33333333);
    n = (n & 0x0F0F0F0F) + ((n >> 4) & 0x0F0F0F0F);
    n = (n & 0x00FF00FF) + ((n >> 8) & 0x00FF00FF);
    n = (n & 0x0000FFFF) + ((n >> 16) & 0x0000FFFF);
    return n;
  }

  void set(int bitIndex) {
    if (bitIndex < 0) {
      throw ArgumentError('bitIndex < 0: $bitIndex');
    }
    int wordIndex = _wordIndex(bitIndex);
    _expandTo(wordIndex);
    _words[wordIndex] |= (1 << bitIndex); // Restores invariants
    _checkInvariants();
  }

  void _expandTo(int wordIndex) {
    int wordsRequired = wordIndex + 1;
    if (_wordsInUse < wordsRequired) {
      _ensureCapacity(wordsRequired);
      _wordsInUse = wordsRequired;
    }
  }

  void _ensureCapacity(int wordsRequired) {
    if (_words.length < wordsRequired) {
      // Allocate larger of doubled size or required size
      int request =
          _words.length * 2 > wordsRequired ? _words.length * 2 : wordsRequired;
      _words = List<int>.from(_words, growable: true)..length = request;
      _sizeIsSticky = false;
    }
  }

  bool get(int bitIndex) {
    if (bitIndex < 0) {
      throw ArgumentError('bitIndex < 0: $bitIndex');
    }
    _checkInvariants();
    int wordIndex = _wordIndex(bitIndex);
    return (wordIndex < _wordsInUse) &&
        ((_words[wordIndex] & (1 << (bitIndex % 64))) != 0);
  }

  @override
  bool operator ==(Object other) {
    if (other is! BitSet) {
      return false;
    }
    if (identical(this, other)) {
      return true;
    }
    _checkInvariants();
    other._checkInvariants();
    if (_wordsInUse != other._wordsInUse) {
      return false;
    }
    for (int i = 0; i < _wordsInUse; i++) {
      if (_words[i] != other._words[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode => super.hashCode;
}
