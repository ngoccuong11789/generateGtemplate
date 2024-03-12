import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_module/common_widgets/common_info_popup.dart';
import 'package:shared_module/common_widgets/red_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/api/category_controller.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/product_categories/product_categories.dart';
import 'package:shared_module/features/product_categories/widgets/modify_category.dart';
import 'package:shared_module/shared_module.dart';

class EditDeletePopup extends StatelessWidget {
  const EditDeletePopup({super.key, required this.catalog, required this.bloc});

  final LocalCatalog catalog;
  final CatalogBloc bloc;

  @override
  Widget build(BuildContext context) {

    Widget createSubCategory = GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) {
            return BlocProvider<CatalogBloc>(
                create: (context) => CatalogBloc(),
                child: ModifyCategory(
                  action: ShopCatalogActions.sub,
                  parentId: catalog.id!,
                ));
          },
        ));
      },
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                package: packageName,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              child: Text(
                SharedLocalizations.of(context)!.addSubCategory,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Widget editCategory = GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) {
            return BlocProvider<CatalogBloc>(
                create: (context) => CatalogBloc(),
                child: ModifyCategory(
                  action: ShopCatalogActions.edit,
                  id: catalog.id!,
                  name: catalog.name,
                  reference: catalog.globalReference,
                ));
          },
        ));
      },
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                package: packageName,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              child: Text(
                SharedLocalizations.of(context)!.edit,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Widget deleteCategory = GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        showModalBottomSheet(
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (_) {
            return ConfirmDeleteCategory(id: catalog.id!, bloc: bloc,);
          },
        );
      },
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(
                'assets/icons/delete.svg',
                package: packageName,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              child: Text(
                SharedLocalizations.of(context)!.delete,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 34),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createSubCategory,
              editCategory,
              deleteCategory,
            ],
          ),
        ),
      ],
    );
  }
}

class ConfirmDeleteCategory extends StatefulWidget {
  const ConfirmDeleteCategory({super.key, required this.id, required this.bloc});
  final CatalogBloc bloc;

  final String id;

  @override
  State<ConfirmDeleteCategory> createState() => _ConfirmDeleteCategoryState();
}

class _ConfirmDeleteCategoryState extends State<ConfirmDeleteCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          width: double.infinity,
          height: 68,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              SharedLocalizations.of(context)!.deleteCategory,
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
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              SharedLocalizations.of(context)!.deleteCategoryHint,
              style: const TextStyle(
                color: Color(0xFF0F1728),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.43,
              ),
            ),
          ),
        ),
        Container(
          height: 98,
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 34, top: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                    height: 44,
                    child: SecondaryButton(
                      SharedLocalizations.of(context)!.cancel,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                    height: 44,
                    child: RedButton(onPressed: () async {
                      Navigator.of(context).pop();
                      widget.bloc.add(DeleteCatalogEvent(widget.bloc.state.buyType, widget.id));
                    }, SharedLocalizations.of(context)!.delete)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
