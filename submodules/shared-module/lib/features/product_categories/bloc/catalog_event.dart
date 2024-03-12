part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class FetchLevel1CatalogEvent extends CatalogEvent {
  const FetchLevel1CatalogEvent();

  @override
  List<Object?> get props => [];
}

class FetchLevel2CatalogEvent extends CatalogEvent {
  final List<GlobalCatalog> level2;

  const FetchLevel2CatalogEvent(this.level2);

  @override
  List<Object?> get props => [level2];
}

class FetchLevel3CatalogEvent extends CatalogEvent {
  final List<GlobalCatalog> level3;

  const FetchLevel3CatalogEvent(this.level3);

  @override
  List<Object?> get props => [level3];
}

class ChooseCatalogEvent extends CatalogEvent {
  final GlobalCatalog current;

  const ChooseCatalogEvent(this.current);

  @override
  List<Object?> get props => [current];
}

class ConfirmCatalogEvent extends CatalogEvent {
  const ConfirmCatalogEvent();

  @override
  List<Object?> get props => [];
}

class InputCategoryNameEvent extends CatalogEvent {
  final String name;

  const InputCategoryNameEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class SaveBuyTypeEvent extends CatalogEvent {
  final BUYTYPE buyType;

  const SaveBuyTypeEvent(this.buyType);

  @override
  List<Object?> get props => [buyType];
}

class FetchShopCatalogEvent extends CatalogEvent {
  const FetchShopCatalogEvent();

  @override
  List<Object?> get props => [];
}

class FetchShopProductEvent extends CatalogEvent {
  final LocalCatalog catalog;

  const FetchShopProductEvent(this.catalog);

  @override
  List<Object?> get props => [catalog];
}

class DeleteShopProductEvent extends CatalogEvent {
  final String shopProductId;
  final LocalCatalog catalog;

  const DeleteShopProductEvent(this.shopProductId, this.catalog);

  @override
  List<Object?> get props => [shopProductId, catalog];
}

class DeleteCatalogEvent extends CatalogEvent {
  final BUYTYPE buyType;
  final String id;

  const DeleteCatalogEvent(this.buyType, this.id);

  @override
  List<Object?> get props => [buyType, id];
}

class AddShopProductEvent extends CatalogEvent {
  final String shopProductId;
  final LocalCatalog catalog;

  const AddShopProductEvent(this.shopProductId, this.catalog);

  @override
  List<Object?> get props => [shopProductId, catalog];
}

class AddShopCatalogEvent extends CatalogEvent {
  final String? name;
  final String? parentId;
  final String? globalId;

  const AddShopCatalogEvent(this.name, this.parentId, this.globalId);

  @override
  List<Object?> get props => [name, parentId, globalId];
}

class EditShopCatalogEvent extends CatalogEvent {
  final String id;
  final String name;
  final String globalId;

  const EditShopCatalogEvent(this.id, this.name, this.globalId);

  @override
  List<Object?> get props => [id, name, globalId];
}

class ToggleShopCatalogEvent extends CatalogEvent {
  final String id;
  final String name;
  final String globalId;
  final bool isUsed;

  const ToggleShopCatalogEvent(this.id, this.name, this.globalId, this.isUsed);

  @override
  List<Object?> get props => [id, name, globalId, isUsed];
}

class DeleteShopCatalogEvent extends CatalogEvent {
  final String id;

  const DeleteShopCatalogEvent(this.id);

  @override
  List<Object?> get props => [id];
}
