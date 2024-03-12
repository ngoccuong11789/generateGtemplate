import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_module/common_widgets/main_appbar_without_search.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/product_categories/widgets/products/add_product_bottom_drawer.dart';
import 'package:shared_module/features/product_categories/widgets/products/each_product_component.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class InnerProductCategory extends StatefulWidget {
  const InnerProductCategory({super.key, required this.catalog});

  final LocalCatalog catalog;

  @override
  State<InnerProductCategory> createState() => _InnerProductCategoryState();
}

class _InnerProductCategoryState extends State<InnerProductCategory> {
  List<Data> shopProducts = [];

  @override
  void initState() {
    BlocProvider.of<CatalogBloc>(context)
        .add(FetchShopProductEvent(widget.catalog));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: MainAppBarWithoutSearch(
            title: Text(widget.catalog.name ?? ""),
          ),
          body: state.shopProducts.isEmpty
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/empty_category.png',
                        package: packageName,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          SharedLocalizations.of(context)!.noProductFound,
                          textAlign: TextAlign.center,
                          style: CommonTextStyle.hintTitle,
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(SharedLocalizations.of(context)!.addProduct,
                          onPressed: () {
                        showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                  value: BlocProvider.of<CatalogBloc>(context),
                                  child: AddProductBottomDrawer(
                                    catalog: widget.catalog,
                                  ));
                            });
                      }),
                    ],
                  ),
                )
              : ListView(children: [
                  ...state.shopProducts.map((e) {
                    return Row(children: [
                      Expanded(
                        child: EachProductComponent(
                          product: e,
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/trash.svg",
                          package: packageName,
                        ),
                        onPressed: () {
                          BlocProvider.of<CatalogBloc>(context).add(
                              DeleteShopProductEvent(e.id!, widget.catalog));
                        },
                      ),
                    ]);
                  }).toList(),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return BlocProvider.value(
                                value: BlocProvider.of<CatalogBloc>(context),
                                child: AddProductBottomDrawer(
                                  catalog: widget.catalog,
                                ));
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 65),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        SharedLocalizations.of(context)!.addProduct,
                        style: const TextStyle(
                          color: Color(0xFF175CD3),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.43,
                        ),
                      ),
                    ),
                  )
                ]),
        );
      },
    );
  }
}
