import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/models/global_catalog.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectCategoryTypeContent extends StatefulWidget {
  const SelectCategoryTypeContent({
    super.key,
    required this.next,
    required this.index,
  });

  final VoidCallback next;
  final int index;

  @override
  State<SelectCategoryTypeContent> createState() =>
      _SelectCategoryTypeContentState();
}

class _SelectCategoryTypeContentState extends State<SelectCategoryTypeContent> {
  late int selectedRow = -1;
  late List<GlobalCatalog> currentCatalogs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        switch (widget.index) {
          case 1:
            currentCatalogs =
                BlocProvider.of<CatalogBloc>(context).state.level2;
            break;
          case 2:
            currentCatalogs =
                BlocProvider.of<CatalogBloc>(context).state.level3;
            break;
          default:
            currentCatalogs =
                BlocProvider.of<CatalogBloc>(context).state.level1;
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: Color(0xFFEAECF0)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0C101828),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: currentCatalogs.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: selectedRow == index
                      ? const Color.fromARGB(255, 239, 248, 255)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<CatalogBloc>(context).add(
                              ChooseCatalogEvent(currentCatalogs[index]));
                          setState(() {
                            selectedRow = index;
                          });
                        },
                        child: Text(
                          currentCatalogs[index].name!,
                          style: selectedRow == index
                              ? const TextStyle(
                                  color: Color.fromARGB(255, 23, 92, 211),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                )
                              : const TextStyle(
                                  color: Color(0xFF344053),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        switch (widget.index) {
                          case 0:
                            BlocProvider.of<CatalogBloc>(context).add(
                                ChooseCatalogEvent(currentCatalogs[index]));
                            BlocProvider.of<CatalogBloc>(context).add(
                                FetchLevel2CatalogEvent(
                                    currentCatalogs[index].subCatalogs!));
                            widget.next();
                            break;
                          case 1:
                            BlocProvider.of<CatalogBloc>(context).add(
                                ChooseCatalogEvent(currentCatalogs[index]));
                            BlocProvider.of<CatalogBloc>(context).add(
                                FetchLevel3CatalogEvent(
                                    currentCatalogs[index].subCatalogs!));
                            widget.next();
                            break;
                        }
                      },
                      child: Visibility(
                        visible: currentCatalogs[index].subCatalogs != null &&
                            currentCatalogs[index].subCatalogs!.isNotEmpty,
                        child: Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: selectedRow == index
                              ? const icon.SoctripIcon(icon.Icons.chevronRight,
                                  style: TextStyle(color: Color.fromARGB(255, 23, 92, 211), fontSize: 16),
                                )
                              : const icon.SoctripIcon(icon.Icons.chevronRight, style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
