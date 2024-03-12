import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/common_info_popup.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/inner_product_categories.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/product_categories/widgets/category/edit_delete_popup.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class EachCategoryComponent extends StatefulWidget {
  const EachCategoryComponent(
      {super.key, required this.catalog, required this.shopCatalogs, required this.bloc});

  final LocalCatalog catalog;
  final CatalogBloc bloc;
  final List<LocalCatalog> shopCatalogs;

  @override
  State<EachCategoryComponent> createState() => _EachCategoryComponentState();
}

class _EachCategoryComponentState extends State<EachCategoryComponent> {
  bool _customTileExpanded = false;
  late bool _isActive;

  @override
  void initState() {
    _isActive = widget.catalog.isUsed ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<LocalCatalog> children = widget.shopCatalogs.where(
      (element) {
        return widget.catalog.id == element.parentId;
      },
    ).toList()
      ..sort(
        (a, b) {
          return (a.name ?? "").compareTo(b.name ?? "");
        },
      );

    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        dense: true,
        horizontalTitleGap: 5.0,
        minLeadingWidth: 5,
        contentPadding: const EdgeInsets.only(left: 5),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.only(left: 5),
          leading: children.isEmpty
              ? const SizedBox(
                  width: 20,
                  height: 20,
                )
              : _customTileExpanded
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: icon.SoctripIcon(icon.Icons.chevronDown, style: TextStyle(fontSize: 18.0,)),
                    )
                  : const SizedBox(
                      width: 20,
                      height: 20,
                      child: icon.SoctripIcon(icon.Icons.chevronRight, style: TextStyle(fontSize: 18.0,)),
                    ),
          onExpansionChanged: (value) {
            setState(() {
              _customTileExpanded = value;
            });
          },
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return BlocProvider.value(
                      value: context.read<CatalogBloc>(),
                      child: InnerProductCategory(catalog: widget.catalog));
                },
              ));
            },
            child: Text(
              widget.catalog.name ?? "",
              style: widget.catalog.depth == 0
                  ? const TextStyle(
                      color: Color(0xFF0F1728),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                    )
                  : const TextStyle(
                      color: Color(0xFF344053),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                    ),
            ),
          ),
          trailing: SizedBox(
            width: 80,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 30,
                    height: 15,
                    child: Switch(
                      value: _isActive,
                      onChanged: (bool value) {
                        setState(() {
                          _isActive = value;
                        });
                        context.read<CatalogBloc>().add(ToggleShopCatalogEvent(
                            widget.catalog.id ?? "",
                            widget.catalog.name ?? "",
                            widget.catalog.globalId ?? "",
                            _isActive));
                        _isActive
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                CommonInfoPopup(
                                    info: SharedLocalizations.of(context)!
                                        .categoryPublished))
                            : ScaffoldMessenger.of(context).showSnackBar(
                                CommonInfoPopup(
                                    info: SharedLocalizations.of(context)!
                                        .categoryUnpublished));
                      },
                      activeTrackColor: const Color(0xFF156FEE),
                      activeColor: const Color(0xFFF2F3F6),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                    height: 20,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        onPressed: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (_) {
                              return EditDeletePopup(catalog: widget.catalog, bloc: widget.bloc,);
                            },
                          );
                        },
                        icon: const icon.SoctripIcon(icon.Icons.dotsVertical, style: TextStyle(fontSize: 18.0,))),
                  ),
                ]),
          ),
          children: [
            ...children.map((e) {
              return Padding(
                padding: const EdgeInsets.only(left: 5),
                child: EachCategoryComponent(
                    catalog: e, shopCatalogs: widget.shopCatalogs, bloc: widget.bloc,),
              );
            }),
          ],
        ),
      ),
    );
  }
}
