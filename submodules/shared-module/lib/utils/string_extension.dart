extension StringExtension on String {
  bool containsIgnoreCase(String pattern) {
    return toLowerCase().contains(pattern.toLowerCase());
  }

  bool equalsIgnoreCase(String pattern) {
    return toLowerCase() == pattern.toLowerCase();
  }
}
