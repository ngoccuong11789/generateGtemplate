import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart';
import 'package:shared_module/features/voucher_add_product/category/select_category_type_bottom_drawer.dart';
import 'package:shared_module/features/voucher_add_product/category/shown_catalogs.dart';
import 'package:shared_module/features/voucher_add_product/products/no_data.dart';
import 'package:shared_module/features/voucher_add_product/products/selected_product_list.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/input_text.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class VoucherProduct extends StatefulWidget {
  const VoucherProduct({super.key, required this.buytype});

  final BUYTYPE buytype;

  @override
  State<VoucherProduct> createState() => _VoucherProductState();
}

class _VoucherProductState extends State<VoucherProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoucherProductBloc()
        ..add(SaveBuyTypeEvent(widget.buytype))
        ..add(FetchShopCatalogs()),
      child: BlocBuilder<VoucherProductBloc, VoucherProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(
                titleAppbar: SharedLocalizations.of(context)!.addProduct),
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
                                    Navigator.of(context).pop();
                                  },
                                )),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: PrimaryButton(
                                      SharedLocalizations.of(context)!.save,
                                      onPressed: () {
                                    Navigator.of(context).pop(state.selectedProduct.map((e) => e.id ?? "").toList());
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
            body: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 24),
                          child: InputText(
                            labelText: SharedLocalizations.of(context)!.categories,
                            isRequired: true,
                            child:  GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (_) {
                                    return BlocProvider.value(
                                      value:
                                          BlocProvider.of<VoucherProductBloc>(
                                              context),
                                      child: FractionallySizedBox(
                                          heightFactor: 0.5,
                                          child: SelectCategoryTypeBottomDrawer()),
                                    );
                                  },
                                );
                              },
                              child: Container(
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
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: state.selectedCatalog.isNotEmpty
                                            ? Wrap(
                                                spacing: 4,
                                                children: context
                                                    .watch<VoucherProductBloc>()
                                                    .state
                                                    .selectedCatalog
                                                    .map((e) => ShownCatalogs(
                                                          catalog: e,
                                                        ))
                                                    .toList(),
                                              )
                                            : Text(
                                                SharedLocalizations.of(context)!
                                                    .selectType,
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
                                    const icon.SoctripIcon(icon.Icons.chevronDown)
                                  ],
                                ),
                              ),
                            ),
                          )),                        
                        state.shownProduct.isNotEmpty
                            ? SelectedProductList(
                                list: state.shownProduct)
                            : const NoData(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
