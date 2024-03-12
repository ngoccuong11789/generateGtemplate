class FilterModel {
  FilterModel({
    required this.searchTerm,
    required this.restaurantType,
    required this.district,
    required this.rating,
    required this.isFilter,
  });

  String searchTerm;
  List<FilterElementModel> restaurantType;
  List<FilterElementModel> district;
  List<FilterElementModel> rating;
  bool isFilter;

  FilterModel copyWith({
    String? searchTerm,
    List<FilterElementModel>? restaurantType,
    List<FilterElementModel>? district,
    List<FilterElementModel>? rating,
    bool? isFilter,
  }) {
    return FilterModel(
      searchTerm: searchTerm ?? this.searchTerm,
      restaurantType: restaurantType ?? this.restaurantType,
      district: district ?? this.district,
      rating: rating ?? this.rating,
      isFilter: isFilter ?? this.isFilter,
    );
  }
}

class FilterElementModel {
  FilterElementModel({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  FilterElementModel copyWith({
    String? name,
    String? id,
    int? quantity,
  }) {
    return FilterElementModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
