import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/data_not_found_alert.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/api/category_controller.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/product_categories/widgets/products/each_product_component.dart';
import 'package:shared_module/features/product_categories/widgets/products/product_bottom_bar.dart';
import 'package:shared_module/shared_module.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class AddProductBottomDrawer extends StatefulWidget {
  const AddProductBottomDrawer({super.key, required this.catalog});

  final LocalCatalog catalog;

  @override
  State<AddProductBottomDrawer> createState() => _AddProductBottomDrawerState();
}

class _AddProductBottomDrawerState extends State<AddProductBottomDrawer> {
  List<Data> selectedList = [];
  List<Data> productList = [];
  late Future<void> loadingStatus;

  @override
  void initState() {
    loadingStatus = fetchShopAllProducts();
    super.initState();
  }

  Future<void> fetchShopAllProducts() async {
    final controller = CategoryController(SharedModule.appDelegates!.dio);
    if (BlocProvider.of<CatalogBloc>(context).state.buyType ==
        BUYTYPE.ecommerce) {
      final pagingModel = await controller.getMyShopProducts(0, 99);
      productList.addAll(pagingModel.data);
    } else {
      final pagingModel = await controller.getMyRestaurantMeals(0, 99);
      productList.addAll(pagingModel.data);
    }
  }

  void selected(Data p) {
    selectedList.add(p);
  }

  void unselected(Data p) {
    selectedList.remove(p);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadingStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(color: Color(0xFFEAECF0)),
                  top: BorderSide(width: 0.50, color: Color(0xFFEAECF0)),
                  right: BorderSide(color: Color(0xFFEAECF0)),
                  bottom: BorderSide(width: 0.50, color: Color(0xFFEAECF0)),
                ),
              ),
              child: Scaffold(
                  bottomNavigationBar: ProductBottomBar(
                      list: selectedList, catalog: widget.catalog),
                  persistentFooterAlignment: AlignmentDirectional.center,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    // toolbarHeight: 92,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    actions: [
                      Container(
                        margin: const EdgeInsets.only(right: 8, top: 20),
                        width: 32,
                        height: 24,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const icon.SoctripIcon(icon.Icons.xClose,
                            style: TextStyle(fontSize: 20,
                            color: Color.fromARGB(255, 16, 24, 40)),
                          ),
                        ),
                      )
                    ],
                    title: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 20, 8, 20),
                      child: SizedBox(
                        child: Text(
                          SharedLocalizations.of(context)!.addProduct,
                          style: const TextStyle(
                            color: Color(0xFF0F1728),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.56,
                          ),
                        ),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ...productList.map((e) {
                            return Row(
                              children: [
                                Expanded(
                                  child: EachProductComponent(
                                    product: e,
                                  ),
                                ),
                                ProductCheckBox(
                                  product: e,
                                  selected: selected,
                                  unselected: unselected,
                                )
                              ],
                            );
                          })
                        ],
                      ),
                    ),
                  )));
        } else {
          return const DataNotFoundAlert();
        }
      },
    );
  }
}

class ProductCheckBox extends StatefulWidget {
  const ProductCheckBox(
      {super.key,
      required this.product,
      required this.selected,
      required this.unselected});

  final Function selected;
  final Function unselected;
  final Data product;

  @override
  State<ProductCheckBox> createState() => _ProductCheckBoxState();
}

class _ProductCheckBoxState extends State<ProductCheckBox> {
  late bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Theme(
        data: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: ColorPalette.grey200, // <-- your color
        ),
        child: Checkbox(
          checkColor: const Color.fromARGB(255, 21, 112, 239),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                  color: _isChecked
                      ? const Color.fromARGB(255, 21, 112, 239)
                      : ColorPalette.grey200)),
          fillColor: const MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 239, 248, 255)),
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
            if (value!) {
              widget.selected(widget.product);
            } else {
              widget.unselected(widget.product);
            }
          },
        ),
      ),
    );
  }
}
