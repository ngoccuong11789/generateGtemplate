import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/default_text.dart';
import 'package:shared_module/common_widgets/main_appbar_without_search.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/widgets/category/each_category_component.dart';
import 'package:shared_module/features/product_categories/widgets/modify_category.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import 'bloc/catalog_bloc.dart';

enum ShopCatalogActions {
  add,
  sub,
  edit,
}

class ProductCategories extends StatefulWidget {
  const ProductCategories({
    super.key,
    required this.buyType,
  });

  final BUYTYPE buyType;

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  final CatalogBloc bloc = CatalogBloc();

  @override
  Widget build(BuildContext context) {
    Widget emptyCategoryLayout(context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    SharedLocalizations.of(context)!.noCategoryFound,
                    textAlign: TextAlign.center,
                    style: CommonTextStyle.hintTitle,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    SharedLocalizations.of(context)!.noCategoryFoundHint,
                    textAlign: TextAlign.center,
                    style: CommonTextStyle.hintBody,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            PrimaryButton(SharedLocalizations.of(context)!.addCategory,
                onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return BlocProvider.value(
                      value: BlocProvider.of<CatalogBloc>(context),
                      child: const ModifyCategory(
                        action: ShopCatalogActions.add,
                      ));
                },
              ));
            }),
          ],
        ),
      );
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => bloc
              ..add(SaveBuyTypeEvent(widget.buyType))
              ..add(const FetchShopCatalogEvent()),
          ),
        ],
        child: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            var shownList = state.shopCatalogs.where(
              (element) {
                return element.depth == 0;
              },
            ).toList()
              ..sort(
                (a, b) {
                  return (a.name ?? "").compareTo(b.name ?? "");
                },
              );
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: MainAppBarWithoutSearch(
                  title:
                      DefaultTitleText(SharedLocalizations.of(context)!.menu)),
              body: Container(
                child: switch(state.status) {
                  CatalogStatus.init => Container(),
                  CatalogStatus.fail => Container(),
                  CatalogStatus.success => state.shopCatalogs.isEmpty
                      ? emptyCategoryLayout(context)
                      : ListView(shrinkWrap: true, children: [
                    ...shownList.map((e) {
                      return EachCategoryComponent(
                        catalog: e, shopCatalogs: state.shopCatalogs, bloc: bloc,);
                    }),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<CatalogBloc>(context),
                              child: const ModifyCategory(
                                action: ShopCatalogActions.add,
                              ),
                            );
                          },
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 65),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          SharedLocalizations.of(context)!.addCategories,
                          style: const TextStyle(
                            color: Color(0xFF175CD3),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  CatalogStatus.waiting => Container(
                    color: Colors.white,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                }
              ),
            );
          },
        ));
  }
}
