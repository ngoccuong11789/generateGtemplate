/// Wrap an item by a list.
/// If the item is null, an empty list will be returned.
/// If the item is not null, a single child list of this item will be returned.
List<T> wrapByList<T>(T? item) {
  if (item == null) {
    return [];
  } else {
    return [item];
  }
}
