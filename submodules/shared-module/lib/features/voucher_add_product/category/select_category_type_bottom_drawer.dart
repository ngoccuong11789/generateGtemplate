import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/drawer_top_handle_bar.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart';
import 'package:shared_module/features/voucher_add_product/category/select_category_type_content.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectCategoryTypeBottomDrawer extends StatefulWidget {
  SelectCategoryTypeBottomDrawer({super.key, this.onSelected});
  void Function(LocalCatalog?)? onSelected;

  @override
  State<SelectCategoryTypeBottomDrawer> createState() =>
      _SelectCategoryTypeBottomDrawerState();
}

class _SelectCategoryTypeBottomDrawerState
    extends State<SelectCategoryTypeBottomDrawer> {
  late PageController controller;
  List<LocalCatalog> selectedCatalogs = [];

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  void nextClickHandler(LocalCatalog catalog) {
    selectedCatalogs.add(catalog);
    controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  void previousClickHandler() {
    selectedCatalogs.removeLast();
    controller.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherProductBloc, VoucherProductState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAlias,
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
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
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                leadingWidth: 0,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    const DrawerTopHandleBar(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              SharedLocalizations.of(context)!.selectCategory,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const icon.SoctripIcon(icon.Icons.xClose,
                            style: TextStyle(fontSize: 20,
                            color: Color.fromARGB(255, 16, 24, 40)),
                          ),
                        )                  
                      ],
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                width: double.infinity,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFEAECF0)),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 24,
                        right: 24,
                        bottom: 24,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: SecondaryButton(
                                    SharedLocalizations.of(context)!.cancel,
                                    onPressed: () {
                                      BlocProvider.of<VoucherProductBloc>(
                                              context)
                                          .add(CancelCatalogs());
                                      Navigator.of(context).pop();
                                    },
                                  )),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: PrimaryButton(
                                        SharedLocalizations.of(context)!.save,
                                        onPressed: () {
                                       (widget.onSelected != null) 
                                       ? widget.onSelected!(state.selectedCategory)
                                       : BlocProvider.of<VoucherProductBloc>(
                                              context).add(ChooseCatalogs());
                                      
                                      Navigator.of(context).pop();
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: PageView.builder(
                itemCount: (((state.shownCatalog
                      ..sort((a, b) => b.depth!.compareTo(a.depth!)))[0]
                    .depth) ?? 0) + 1 ,
                itemBuilder: (context, index) {
                  return SelectCategoryTypeContent(
                    list: index == 0
                        ? state.shownCatalog
                            .where((element) => element.depth == 0)
                            .toList()
                        : state.shownCatalog
                            .where((element) =>
                                element.parentId == selectedCatalogs[index - 1].id)
                            .toList(),
                    next: nextClickHandler,
                    selectCategory: widget.onSelected != null,
                  );
                },
                controller: controller,
              )),
        );
      },
    );
  }
}
