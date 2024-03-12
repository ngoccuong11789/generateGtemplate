part of 'voucher_product_bloc.dart';

abstract class VoucherProductEvent {}

class SelectedCatalog extends VoucherProductEvent {
  final LocalCatalog selectedCatalog;

  SelectedCatalog({required this.selectedCatalog});
}

class GetProductsFromCatalog extends VoucherProductEvent {
  GetProductsFromCatalog();
}

class SaveBuyTypeEvent extends VoucherProductEvent {
  final BUYTYPE buyType;

  SaveBuyTypeEvent(this.buyType);
}

class SelectCatalog extends VoucherProductEvent {
  final LocalCatalog catalog;

  SelectCatalog(this.catalog);
}

class RemoveCatalog extends VoucherProductEvent {
  final LocalCatalog catalog;

  RemoveCatalog(this.catalog);
}

class ChooseCatalogs extends VoucherProductEvent {
  ChooseCatalogs();
}

class CancelCatalogs extends VoucherProductEvent {
  CancelCatalogs();
}

class FetchShopCatalogs extends VoucherProductEvent {
  FetchShopCatalogs();
}

class SelectAll extends VoucherProductEvent {
  SelectAll();
}

class UnSelectAll extends VoucherProductEvent {
  UnSelectAll();
}

class SelectProduct extends VoucherProductEvent {
  final Data product;

  SelectProduct(this.product);
}

class UnSelectProduct extends VoucherProductEvent {
  final Data product;
  UnSelectProduct(this.product);
}

class SelectCategory extends VoucherProductEvent {
  final LocalCatalog catalog;

  SelectCategory(this.catalog);
}
