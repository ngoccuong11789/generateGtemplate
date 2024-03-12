import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/voucher_add_product/api/voucher_product_controller.dart';
import 'package:shared_module/shared_module.dart';

part 'voucher_product_event.dart';
part 'voucher_product_state.dart';

class VoucherProductBloc
    extends Bloc<VoucherProductEvent, VoucherProductState> {
  final VoucherProductController controller =
      VoucherProductController(SharedModule.appDelegates!.dio);

  Future<List<Data>> getProductList(List<LocalCatalog> catalogs) async {
    List<Data> products = [];
    for (var cat in catalogs) {
      if (state.buytype == BUYTYPE.ecommerce) {
        products.addAll(
            (await controller.getEcommerceProductInCatalog(cat.id!)).data ??
                []);
      } else {
        products.addAll(
            (await controller.getFoodProductInCatalog(cat.id!)).data ?? []);
      }
    }
    return products;
  }

  VoucherProductBloc()
      : super(const VoucherProductState(
            selectedCatalog: [],
            selectedProduct: [],
            shownProduct: [],
            shownCatalog: [],
            selectingCatalog: [])) {
    on<SaveBuyTypeEvent>((event, emit) {
      emit(state.copyWith(buytype: event.buyType));
    });

    on<FetchShopCatalogs>(
      (event, emit) async {
        if (state.buytype == BUYTYPE.ecommerce) {
          var res = await controller.getAllShopCatalogs();
          emit(state.copyWith(shownCatalog: res.data));
        } else {
          var res = await controller.getAllRestaurantCatalogs();
          emit(state.copyWith(shownCatalog: res.data));
        }
      },
    );

    on<SelectCatalog>(
      (event, emit) {
        List<LocalCatalog> list = List.of(state.selectingCatalog);
        if (list.contains(event.catalog)) {
          list.remove(event.catalog);
        } else {
          list.add(event.catalog);
        }
        emit(state.copyWith(selectingCatalog: list));
      },
    );
    on<RemoveCatalog>(
      (event, emit) async {
        List<LocalCatalog> catalogs = List.of(state.selectedCatalog);
        catalogs.remove(event.catalog);
        emit(state.copyWith(
            selectedCatalog: catalogs,
            selectingCatalog: catalogs,
            shownProduct: await getProductList(catalogs)));
      },
    );
    on<ChooseCatalogs>(
      (event, emit) async {
        List<Data> productList = await getProductList(state.selectingCatalog);
        emit(state.copyWith(
            selectedCatalog: state.selectingCatalog,
            shownProduct: productList));
      },
    );
    on<CancelCatalogs>(
      (event, emit) {
        emit(state.copyWith(selectingCatalog: state.selectedCatalog));
      },
    );

    on<SelectAll>(
      (event, emit) {
        emit(state.copyWith(selectedProduct: state.shownProduct));
      },
    );
    on<UnSelectAll>(
      (event, emit) {
        emit(state.copyWith(selectedProduct: []));
      },
    );
    on<SelectProduct>(
      (event, emit) {
        List<Data> list = List.of(state.selectedProduct);
        list.add(event.product);
        print(list);
        emit(state.copyWith(selectedProduct: list));
      },
    );
    on<UnSelectProduct>(
      (event, emit) {
        List<Data> list = List.of(state.selectedProduct);
        list.remove(event.product);
        print(list);
        emit(state.copyWith(selectedProduct: list));
      },
    );
    on<SelectCategory> ((event, emit) {
      emit(state.copyWith(selectedCategory: event.catalog));
    },);
  }
}
