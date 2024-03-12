import 'package:equatable/equatable.dart';

class FieldNameFilter extends Equatable{
  final String catalog;
  final String regions;
  final String rating;
  final String? catalogFood;
  final String? price;
  final String searchTerm;
  final String? discountPercent;
  final String? quick;
  const FieldNameFilter({required this.catalog, required this.regions, required this.rating,  this.price, required this.searchTerm, this.discountPercent, this.quick, this.catalogFood,});

  @override
  List<Object?> get props => [catalog,
    regions,
    rating,
    catalogFood,
    price,
    searchTerm,
    discountPercent,
    quick
  ];

}