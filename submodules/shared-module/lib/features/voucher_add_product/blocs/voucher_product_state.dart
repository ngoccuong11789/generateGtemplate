part of 'voucher_product_bloc.dart';

class VoucherProductState extends Equatable {
  final BUYTYPE? buytype;
  final List<LocalCatalog> selectedCatalog;
  final List<LocalCatalog> selectingCatalog;
  final List<LocalCatalog> shownCatalog;
  final List<Data> selectedProduct;
  final List<Data> shownProduct;
  final LocalCatalog? selectedCategory;

  const VoucherProductState(
      {this.buytype,        
      required this.selectedCatalog,
      required this.selectingCatalog,
      required this.shownCatalog,
      required this.selectedProduct,
      required this.shownProduct,
      this.selectedCategory});

  @override
  List<Object?> get props => [selectingCatalog, selectedCatalog, selectedProduct, shownProduct, shownCatalog, selectedCategory];

  VoucherProductState copyWith({
    List<LocalCatalog>? selectedCatalog,
    List<LocalCatalog>? selectingCatalog,
    List<LocalCatalog>? shownCatalog,
    List<Data>? selectedProduct,
    List<Data>? shownProduct,
    BUYTYPE? buytype,
    LocalCatalog? selectedCategory
  }) {
    return VoucherProductState(
      selectedCatalog: selectedCatalog ?? this.selectedCatalog,
      selectingCatalog: selectingCatalog ?? this.selectingCatalog,
      shownCatalog: shownCatalog ?? this.shownCatalog,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      shownProduct: shownProduct ?? this.shownProduct,
      buytype: buytype ?? this.buytype,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
