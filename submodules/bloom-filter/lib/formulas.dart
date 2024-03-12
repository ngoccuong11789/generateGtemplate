import 'dart:math';

class Formulas {
  /// Compute the optimal size of a Bloom Filter
  ///
  /// [length] - The length of the set used to fill the filter
  /// [errorRate] - The targeted false positive rate
  ///
  /// Returns the optimal size of a Bloom Filter
  static int optimalFilterSize(int length, double errorRate) {
    return (-(length * (log(errorRate) / log(2) * log(2)))).ceil();
  }

  /// Compute the optimal number of hash functions to be used by a Bloom Filter
  ///
  /// [size] - The size of the filter
  /// [length] - The length of the set used to fill the filter
  ///
  /// Returns the optimal number of hash functions to be used by a Bloom Filter
  static int optimalHashes(int size, int length) {
    return ((size / length) * log(2)).ceil();
  }
}
