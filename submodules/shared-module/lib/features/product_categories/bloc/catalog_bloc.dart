import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/api/category_controller.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/global_catalog.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/shared_module.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

enum CatalogStatus { init, success, fail, waiting }

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  List<GlobalCatalog> result = [];
  Dio dio = SharedModule.appDelegates!.dio;
  CategoryController controller =
      CategoryController(SharedModule.appDelegates!.dio);

  Future<LocalCatalogResponse> updateShopCatalogData() async {
    if (state.buyType == BUYTYPE.ecommerce) {
      return await controller.getAllShopCatalogs();
    } else {
      return await controller.getAllRestaurantCatalogs();
    }
  }

  Future<CatalogProduct> updateShopProductData(String catalogId) async {
    if (state.buyType == BUYTYPE.ecommerce) {
      return await controller.getEcommerceProductInCatalog(catalogId);
    } else {
      return await controller.getFoodProductInCatalog(catalogId);
    }
  }

  CatalogBloc()
      : super(CatalogState(
          buyType: BUYTYPE.ecommerce,
          level1: const [],
          level2: const [],
          level3: const [],
          shopCatalogs: const [],
          shopProducts: const [],
          shopCategoryName: "",
          chosenCatalog: GlobalCatalog(),
          confirmCatalog: GlobalCatalog(),
        )) {
    on<FetchLevel1CatalogEvent>((event, emit) async {
      if (state.buyType == BUYTYPE.ecommerce) {
        emit(state.copyWith(
            level1: await controller.getAllEcommerceGlobalCatalogs()));
      } else {
        emit(state.copyWith(
            level1: await controller.getAllFoodGlobalCatalogs()));
      }
    });
    on<FetchLevel2CatalogEvent>((event, emit) async {
      emit(state.copyWith(level2: event.level2));
    });
    on<FetchLevel3CatalogEvent>((event, emit) async {
      emit(state.copyWith(level3: event.level3));
    });

    on<ChooseCatalogEvent>(
      (event, emit) {
        emit(state.copyWith(chosenCatalog: event.current));
      },
    );

    on<ConfirmCatalogEvent>(
      (event, emit) {
        emit(state.copyWith(confirmCatalog: state.chosenCatalog));
      },
    );

    on<InputCategoryNameEvent>(
      (event, emit) {
        emit(state.copyWith(shopCategoryName: event.name));
      },
    );

    on<SaveBuyTypeEvent>((event, emit) {
      emit(state.copyWith(buyType: event.buyType));
    });

    on<FetchShopProductEvent>(
      (event, emit) async {
        emit(state.copyWith(
            shopProducts:
                (await updateShopProductData(event.catalog.id!)).data));
      },
    );
    on<DeleteShopProductEvent>(
      (event, emit) async {
        await controller.removeShopProduct(
            state.buyType, event.catalog.id!, event.shopProductId);
        emit(state.copyWith(
            shopProducts:
                (await updateShopProductData(event.catalog.id!)).data));
      },
    );
    on<DeleteCatalogEvent>(
      (event, emit) async {
        if (event.buyType == BUYTYPE.ecommerce) {
          await controller.deleteShopCatalog(event.id);
        } else {
          await controller.deleteRestaurantCatalog(event.id);
        }

        add(const FetchShopCatalogEvent());
      },
    );
    on<AddShopProductEvent>(
      (event, emit) async {
        await controller.addShopProduct(
            state.buyType, event.catalog.id!, event.shopProductId);

        emit(state.copyWith(
            shopProducts:
                (await updateShopProductData(event.catalog.id!)).data));
      },
    );
    on<FetchShopCatalogEvent>(
      (event, emit) async {
        emit(state.copyWith(status: CatalogStatus.waiting));
        try {
          final data = await updateShopCatalogData();
          emit(state.copyWith(shopCatalogs: data.data, status: CatalogStatus.success));
        } on DioException catch (e) {
          emit(state.copyWith(status: CatalogStatus.fail));
        }
      },
    );
    on<AddShopCatalogEvent>(
      (event, emit) async {
        if (state.buyType == BUYTYPE.ecommerce) {
          await controller.addShopCatalog({
            "name": event.name,
            "parent_id": event.parentId,
            "global_id": event.globalId
          });
        } else {
          await controller.addRestaurantCatalog({
            "name": event.name,
            "parent_id": event.parentId,
            "global_id": event.globalId
          });
        }

        emit(
            state.copyWith(shopCatalogs: (await updateShopCatalogData()).data));
      },
    );
    on<EditShopCatalogEvent>(
      (event, emit) async {
        if (state.buyType == BUYTYPE.ecommerce) {
          await controller.editShopCatalog(event.id, {
            "name": event.name,
            "global_id": event.globalId,
          });
        } else {
          await controller.editRestaurantCatalog(event.id, {
            "name": event.name,
            "global_id": event.globalId,
          });
        }
        emit(
            state.copyWith(shopCatalogs: (await updateShopCatalogData()).data));
      },
    );

    on<ToggleShopCatalogEvent>(
      (event, emit) async {
        if (state.buyType == BUYTYPE.ecommerce) {
          await controller.editShopCatalog(event.id, {
            "name": event.name,
            "global_id": event.globalId,
            "is_used": event.isUsed
          });
        } else {
          await controller.editRestaurantCatalog(event.id, {
            "name": event.name,
            "global_id": event.globalId,
            "is_used": event.isUsed
          });
        }
        emit(
            state.copyWith(shopCatalogs: (await updateShopCatalogData()).data));
      },
    );
  }
}
