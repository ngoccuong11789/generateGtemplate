import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/drawer_top_handle_bar.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/features/product_categories/bloc/catalog_bloc.dart';
import 'package:shared_module/features/product_categories/widgets/category/select_category_type_content.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectCategoryTypeBottomDrawer extends StatefulWidget {
  const SelectCategoryTypeBottomDrawer({super.key});

  @override
  State<SelectCategoryTypeBottomDrawer> createState() =>
      _SelectCategoryTypeBottomDrawerState();
}

class _SelectCategoryTypeBottomDrawerState
    extends State<SelectCategoryTypeBottomDrawer> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    BlocProvider.of<CatalogBloc>(context).add(const FetchLevel1CatalogEvent());
    super.initState();
  }

  void nextClickHandler() {
    controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  void chooseClickHandler(BuildContext context) {
    BlocProvider.of<CatalogBloc>(context).add(const ConfirmCatalogEvent());
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
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
                toolbarHeight: 92,
                centerTitle: true,
                leadingWidth: 32,
                automaticallyImplyLeading: true,
                leading: Container(
                  margin: const EdgeInsets.only(left: 8, top: 20),
                  width: 24,
                  height: 24,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const icon.SoctripIcon(icon.Icons.chevronLeft,
                      style: TextStyle(color: Color.fromARGB(255, 16, 24, 40)),
                    ),
                    onPressed: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.linear);
                    },
                  ),
                ),
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
                        color: Color.fromARGB(255, 16, 24, 40),)
                      ),
                    ),
                  )
                ],
                title: Column(
                  children: [
                    const DrawerTopHandleBar(),
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                        height: 68,
                        child: SizedBox(
                          child: Text(
                            SharedLocalizations.of(context)!.selectCategoryType,
                            textAlign: TextAlign.center,
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
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: PrimaryButton(
                  SharedLocalizations.of(context)!.choose,
                  onPressed: () {
                    chooseClickHandler(context);
                  },
                ),
              ),
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  SelectCategoryTypeContent(
                    index: 0,
                    next: nextClickHandler,
                  ),
                  SelectCategoryTypeContent(
                    index: 1,
                    next: nextClickHandler,
                  ),
                  SelectCategoryTypeContent(
                    index: 2,
                    next: nextClickHandler,
                  ),
                ],
              )),
        );
      },
    );
  }
}
