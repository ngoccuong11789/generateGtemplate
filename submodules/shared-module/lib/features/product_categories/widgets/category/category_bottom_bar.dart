import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/common_info_popup.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/models/global_catalog.dart';
import 'package:shared_module/features/product_categories/product_categories.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class CategoryBottomBar extends StatefulWidget {
  const CategoryBottomBar({
    super.key,
    required this.shopCatalogName,
    required this.globalId,
    required this.parentId,
    required this.id,
    required this.action,
  });

  final String shopCatalogName;
  final GlobalCatalog? globalId;
  final String? parentId;
  final String? id;
  final ShopCatalogActions action;

  @override
  State<CategoryBottomBar> createState() => _CategoryBottomBarState();
}

class _CategoryBottomBarState extends State<CategoryBottomBar> {
  void processSaving() {
    if (widget.action == ShopCatalogActions.edit) {
      BlocProvider.of<CatalogBloc>(context).add(EditShopCatalogEvent(
          widget.id!, widget.shopCatalogName, widget.globalId!.id!));
      ScaffoldMessenger.of(context).showSnackBar(
        CommonInfoPopup(
          info: SharedLocalizations.of(context)!.categoryEdited,
        ),
      );
    } else {
      BlocProvider.of<CatalogBloc>(context).add(AddShopCatalogEvent(
          widget.shopCatalogName, widget.parentId, widget.globalId!.id));
      ScaffoldMessenger.of(context).showSnackBar(
        CommonInfoPopup(
          info: SharedLocalizations.of(context)!.categoryAdded,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) => Container(
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
              child: state.shopCategoryName.trim().isNotEmpty &&
                      state.confirmCatalog.name != null
                  ? PrimaryButton(SharedLocalizations.of(context)!.save,
                      onPressed: () {
                      processSaving();
                      Navigator.of(context).pop();
                    })
                  : GreyedOutPrimaryButton(
                      SharedLocalizations.of(context)!.save,
                      onPressed: null,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
