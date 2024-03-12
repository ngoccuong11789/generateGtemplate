import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final List<bool> indexList;
  final List<String> categoryList;
  const Category({
    this.indexList = const [],
    this.categoryList = const [],
  });

  Category copyWith({
    List<bool>? indexList,
    List<String>? categoryList,
  }) {
    return Category(
      indexList: indexList ?? this.indexList,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [indexList, categoryList];
}
