import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_module/common_widgets/main_appbar_without_search.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/product_categories.dart';
import 'package:shared_module/features/product_categories/widgets/category/category_bottom_bar.dart';
import 'package:shared_module/features/product_categories/widgets/category/select_category_type_bottom_drawer.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class ModifyCategory extends StatefulWidget {
  const ModifyCategory(
      {super.key, required this.action, this.parentId, this.id,this.name, this.reference});

  final ShopCatalogActions action;
  final String? parentId;
  final String? id;
  final String? name;
  final String? reference;

  @override
  State<ModifyCategory> createState() => _ModifyCategoryState();
}

class _ModifyCategoryState extends State<ModifyCategory> {
  @override
  Widget build(BuildContext context) {
    Widget chooseCatalogHint = Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFEFF8FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            child: Container(
              width: 16,
              height: 16,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(
                'assets/icons/info.svg',
                package: packageName,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                SharedLocalizations.of(context)!.modifyCategoryHint,
                style: const TextStyle(
                  color: Color(0xFF175CD3),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Widget enterCategoryName = Column(
      children: [
        Text(
          SharedLocalizations.of(context)!.categoryName,
          style: const TextStyle(
            color: Color(0xFF344053),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.43,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 66,
          width: double.infinity,
          clipBehavior: Clip.none,
          child: TextField(
            controller: TextEditingController(text: widget.name),
            focusNode: null,
            onChanged: (value) {
              context.read<CatalogBloc>().add(InputCategoryNameEvent(value));
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                hintText: SharedLocalizations.of(context)!.enterCategoryName,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 0.50, color: Color(0xFFCFD4DC)))),
            buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) {
              return SizedBox(
                width: double.infinity,
                child: Text(
                  SharedLocalizations.of(context)!
                      .characters(currentLength, maxLength!),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF475466),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              );
            },
            style: const TextStyle(
              color: Color(0xFF667084),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.43,
            ),
            maxLength: 30,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            autofocus: true,
          ),
        )
      ],
    );

    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MainAppBarWithoutSearch(
          title: Text(
            widget.action == ShopCatalogActions.add
                ? SharedLocalizations.of(context)!.addCategories
                : widget.action == ShopCatalogActions.sub
                    ? SharedLocalizations.of(context)!.addSubCategories
                    : SharedLocalizations.of(context)!.editCategories,
          ),
        ),
        bottomNavigationBar: CategoryBottomBar(
          shopCatalogName: state.shopCategoryName,
          globalId: state.confirmCatalog,
          parentId: widget.parentId,
          id: widget.id,
          action: widget.action,
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        body: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              enterCategoryName,
              // Enter Category Type
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 12),
                    child: SizedBox(
                      child: Text(
                        SharedLocalizations.of(context)!.categoryType,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1.43,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (_) {
                          return BlocProvider.value(
                            value: BlocProvider.of<CatalogBloc>(context),
                            child: FractionallySizedBox(
                                heightFactor: 0.5,
                                child: SelectCategoryTypeBottomDrawer()),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFCFD4DC)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                BlocProvider.of<CatalogBloc>(context)
                                            .state
                                            .confirmCatalog.reference !=
                                        null
                                    ? BlocProvider.of<CatalogBloc>(context)
                                        .state
                                        .confirmCatalog
                                        .reference!
                                    : widget.reference != null
                                    ? widget.reference!
                                    : SharedLocalizations.of(context)!.selectType,
                                style: const TextStyle(
                                  color: Color(0xFF667084),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              ),
                            ),
                          ),
                          const icon.SoctripIcon(icon.Icons.chevronDown, style: TextStyle(fontSize: 18.0,))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              chooseCatalogHint,
            ],
          ),
        ),
      ),
    );
  }
}
