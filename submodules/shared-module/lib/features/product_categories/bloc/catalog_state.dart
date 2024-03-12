part of 'catalog_bloc.dart';

class CatalogState extends Equatable {
  final List<GlobalCatalog> level1;
  final List<GlobalCatalog> level2;
  final List<GlobalCatalog> level3;
  final GlobalCatalog chosenCatalog;
  final GlobalCatalog confirmCatalog;
  final String shopCategoryName;
  final BUYTYPE buyType;
  final List<LocalCatalog> shopCatalogs;
  final List<Data> shopProducts;
  final Dio? dio;
  final CatalogStatus status;

  CatalogState({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.chosenCatalog,
    required this.confirmCatalog,
    required this.shopCategoryName,
    required this.buyType,
    required this.shopCatalogs,
    required this.shopProducts,
    this.status = CatalogStatus.init,
    this.dio,
  });

  CatalogState copyWith({
    List<GlobalCatalog>? level1,
    List<GlobalCatalog>? level2,
    List<GlobalCatalog>? level3,
    GlobalCatalog? chosenCatalog,
    GlobalCatalog? confirmCatalog,
    String? shopCategoryName,
    BUYTYPE? buyType,
    List<LocalCatalog>? shopCatalogs,
    List<Data>? shopProducts,
    Exception? error,
    Dio? dio,
    CatalogStatus? status
  }) {
    return CatalogState(
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      chosenCatalog: chosenCatalog ?? this.chosenCatalog,
      confirmCatalog: confirmCatalog ?? this.confirmCatalog,
      shopCategoryName: shopCategoryName ?? this.shopCategoryName,
      buyType: buyType ?? this.buyType,
      shopCatalogs: shopCatalogs ?? this.shopCatalogs,
      shopProducts: shopProducts ?? this.shopProducts,
      dio: dio ?? this.dio,
      status: status ?? this.status
    );
  }

  @override
  List<Object> get props => [
        level1,
        level2,
        level3,
        chosenCatalog,
        confirmCatalog,
        shopCategoryName,
        buyType,
        shopCatalogs,
        shopProducts,
        status
      ];
}
