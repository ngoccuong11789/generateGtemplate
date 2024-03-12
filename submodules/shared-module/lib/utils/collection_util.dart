class CollectionUtil {
  /// Compares two iterables for equality in a sequential manner, considering optional strict comparison.
  ///
  /// This function checks if the elements of both iterables are equal and appear in the same order.
  ///
  /// - `i1`: The first iterable to compare. Can be `null`.
  /// - `i2`: The second iterable to compare. Can be `null`.
  /// - `strict` (optional): If `true`, performs strict comparison where the null iterable is treated differently from the empty one.
  /// If `false` (default), treat the `null` iterable as a empty iterable.
  ///
  /// Returns `true` if the two iterables are equal in sequence, `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// final list1 = [1, 2, 3];
  /// final list2 = [1, 2, 3];
  /// final list3 = [3, 2, 1];
  ///
  /// print(sequentiallyEquals(list1, list2)); // Output: true
  /// print(sequentiallyEquals(list1, list3)); // Output: false
  ///
  /// print(sequentiallyEquals(null, list1)); // Output: true (strict: false)
  /// print(sequentiallyEquals(list1, null)); // Output: true (strict: false)
  /// print(sequentiallyEquals(null, null)); // Output: true (strict: false)
  ///
  /// print(sequentiallyEquals(list1, list2, true)); // Output: true (strict: true)
  /// print(sequentiallyEquals(list1, list3, true)); // Output: false (strict: true)
  /// ```
  ///
  static bool sequentiallyEquals(Iterable? i1, Iterable? i2,
      [bool strict = false]) {
    if (i1 == i2) {
      return true;
    }
    if (i1 == null) {
      if (strict) {
        return false;
      }
      return i2!.isEmpty;
    }
    if (i2 == null) {
      if (strict) {
        return false;
      }
      return i1.isEmpty;
    }
    if (i1.length != i2.length) {
      return false;
    }
    for (int i = 0; i < i1.length; i++) {
      if (i1.elementAt(i) != i2.elementAt(i)) {
        return false;
      }
    }
    return true;
  }
}
