import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class ProductBottomBar extends StatefulWidget {
  const ProductBottomBar(
      {super.key, required this.list, required this.catalog});

  final List<Data> list;
  final LocalCatalog catalog;

  @override
  State<ProductBottomBar> createState() => _ProductBottomBarState();
}

class _ProductBottomBarState extends State<ProductBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 88,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Color(0xFFF2F3F6)),
          top: BorderSide(width: 0.50, color: Color(0xFFF2F3F6)),
          right: BorderSide(color: Color(0xFFF2F3F6)),
          bottom: BorderSide(color: Color(0xFFF2F3F6)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SecondaryButton(
              SharedLocalizations.of(context)!.cancel,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: PrimaryButton(
            SharedLocalizations.of(context)!.save,
            onPressed: () {
              for (var element in widget.list) {
                BlocProvider.of<CatalogBloc>(context)
                    .add(AddShopProductEvent(element.id!, widget.catalog));
              }
              Navigator.of(context).pop();
            },
          )),
        ],
      ),
    );
  }
}
