// ignore_for_file: constant_identifier_names

abstract class BookmarkType {
  static const SHOP_BOOKMARK = _BookmarkType.SHOP_BOOKMARK;
  static const PRODUCT_BOOKMARK = _BookmarkType.PRODUCT_BOOKMARK;
  static const RESTAURANT_BOOKMARK = _BookmarkType.RESTAURANT_BOOKMARK;
  static const FOOD_BOOKMARK = _BookmarkType.FOOD_BOOKMARK;
  static const HOTEL_BOOKMARK = _BookmarkType.HOTEL_BOOKMARK;
  static const TOUR_BOOKMARK = _BookmarkType.TOUR_BOOKMARK;


  String get codeName;

  static BookmarkType fromCodeName(String codeName) => _BookmarkType.values
      .cast<BookmarkType>()
      .firstWhere((element) => element.codeName == codeName,
      orElse: () => BookmarkType.simple(codeName));

  const BookmarkType();

  const factory BookmarkType.simple(String codeName) = _SimpleBookmarkType;
}

class _SimpleBookmarkType extends BookmarkType {
  @override
  final String codeName;

  const _SimpleBookmarkType(this.codeName);
}

enum _BookmarkType implements BookmarkType {
  SHOP_BOOKMARK,
  PRODUCT_BOOKMARK,
  RESTAURANT_BOOKMARK,
  HOTEL_BOOKMARK,
  FOOD_BOOKMARK,
  TOUR_BOOKMARK;

  @override
  String get codeName => name;
}
