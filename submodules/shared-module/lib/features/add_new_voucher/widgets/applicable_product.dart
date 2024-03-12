import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart' as product;
import 'package:shared_module/features/voucher_add_product/category/select_category_type_bottom_drawer.dart';
import 'package:shared_module/features/voucher_add_product/voucher_product.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import '../../product_categories/models/local_catalog.dart';

class ApplicableProduct extends StatefulWidget {
  const ApplicableProduct({super.key});

  @override
  State<ApplicableProduct> createState() => _ApplicableProductState();
}

enum Applicable { allProducts, category, specificProducts }

class _ApplicableProductState extends State<ApplicableProduct> {
  Applicable selectedApplicable = Applicable.allProducts;
  List<String> selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    BUYTYPE buytype = BlocProvider.of<AddVoucherBloc>(context).state.buytype;
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          SharedLocalizations.of(context)!.applicableProduct,
                          style: const TextStyle(
                            color: Color(0xFF344054),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (selectedApplicable != Applicable.allProducts)
                BlocProvider(
                create: (context) => product.VoucherProductBloc()
                  ..add(product.SaveBuyTypeEvent(buytype))
                  ..add(product.FetchShopCatalogs()),
                child: BlocBuilder<product.VoucherProductBloc, product.VoucherProductState>(
                  builder: (context, state) {
                  return TextButton(
                  onPressed: selectedApplicable == Applicable.category ? () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<product.VoucherProductBloc>(),
                            child: FractionallySizedBox(
                                    heightFactor: 0.5,
                                    child: SelectCategoryTypeBottomDrawer(onSelected: (LocalCatalog? value){
                                      BlocProvider.of<AddVoucherBloc>(context).add(SelectCategory(value));setState(() {});
                                    },),
                              )
                          
                          );
                        },
                      );
                  }
                  : () async {
                      selectedProducts =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return VoucherProduct(buytype: buytype);
                        },
                      ));
                      setState(() {
                         BlocProvider.of<AddVoucherBloc>(context)
                          .add(SeetApplicableProducts(selectedProducts));
                        });
                                         
                  },
                  child: Text(
                  selectedApplicable == Applicable.category ? SharedLocalizations.of(context)!.addCategory :  SharedLocalizations.of(context)!.addProduct,
                    style: selectedApplicable == Applicable.specificProducts || selectedApplicable == Applicable.category
                        ? const TextStyle(
                            color: Color(0xFF1570EF),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          )
                        : const TextStyle(
                            color: Color(0xFFB2DDFF),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                );})),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildItemRadio(Applicable.allProducts, selectedApplicable, SharedLocalizations.of(context)!.allProducts,
              (value) {
                setState(() {
                  selectedApplicable = value!;
                   selectedProducts = [];
                  BlocProvider.of<AddVoucherBloc>(context)
                      .add(ChangeApplicableType(selectedApplicable));
                  BlocProvider.of<AddVoucherBloc>(context).add(SelectCategory(LocalCatalog()));
                  BlocProvider.of<AddVoucherBloc>(context)
                    .add(SeetApplicableProducts(selectedProducts));
                });
              },),
              buildItemRadio(Applicable.specificProducts, selectedApplicable, "${SharedLocalizations.of(context)!.specificProducts} ${selectedProducts.isNotEmpty ? "(${selectedProducts.length})" : ""}",
              (value) {
                  setState(() {
                    selectedApplicable = value!;
                    BlocProvider.of<AddVoucherBloc>(context)
                        .add(ChangeApplicableType(selectedApplicable));
                    BlocProvider.of<AddVoucherBloc>(context).add(SelectCategory(LocalCatalog()));
                  });
                },),
              buildItemRadio(Applicable.category, selectedApplicable, "${SharedLocalizations.of(context)!.category} ${BlocProvider.of<AddVoucherBloc>(context).state.category.name != null ? "(${BlocProvider.of<AddVoucherBloc>(context).state.category.name})" : ""}",
              (value) {
                  setState(() {
                    selectedApplicable = value!;
                     selectedProducts = [];
                    BlocProvider.of<AddVoucherBloc>(context)
                        .add(ChangeApplicableType(selectedApplicable));
                    BlocProvider.of<AddVoucherBloc>(context)
                    .add(SeetApplicableProducts(selectedProducts));
                        
                  });
                },),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItemRadio(Applicable value, Applicable selectValue, String text, void Function(Applicable?)? onChanged, ) {
    return Row(
        children: [
          Radio(
            value: value,
            groupValue: selectValue,
            onChanged: onChanged,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF344054),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      );
  }
}
