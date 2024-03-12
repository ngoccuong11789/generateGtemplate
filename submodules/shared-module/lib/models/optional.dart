class Optional<T> {
  final T? value;
  Optional.of(this.value);
  Optional.empty(): value = null;
}


extension NullableOptionalExt<T> on Optional<T>? {
  T? get({T? defaultValue}) {
    if (this == null) {
      return defaultValue;
    }
    return this!.value;
  }
}