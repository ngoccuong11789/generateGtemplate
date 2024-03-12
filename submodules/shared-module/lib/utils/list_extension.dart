typedef ListItemMapper<T, E> = T Function(E element, int index);

extension ListExtension<E> on List<E> {
  List<T> mapToList<T>(ListItemMapper<T, E> mapper) {
    List<T> result = [];
    final originLength = length;
    for (int i = 0; i < originLength; i++) {
      result.add(mapper(this[i], i));
    }
    return result;
  }
}
