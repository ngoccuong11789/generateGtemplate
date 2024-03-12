import 'package:equatable/equatable.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';

class SelectCategory extends Equatable {
  final List<bool> indexList;
  final List<Category> categoryList;

  const SelectCategory({
    this.indexList = const [],
    this.categoryList = const [],
  });

  SelectCategory copyWith({
    List<bool>? indexList,
    List<Category>? categoryList,
  }) {
    return SelectCategory(
      indexList: indexList ?? this.indexList,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [indexList, categoryList];
}
