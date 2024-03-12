import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart';
import 'package:shared_module/features/voucher_add_product/products/each_product_component.dart';
import 'package:shared_module/features/voucher_add_product/widgets/checkall_reset.dart';
import 'package:shared_module/features/voucher_add_product/widgets/search_voucher_product.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class SelectedProductList extends StatefulWidget {
  const SelectedProductList({super.key, required this.list});

  final List<Data> list;

  @override
  State<SelectedProductList> createState() => _SelectedProductListState();
}

class _SelectedProductListState extends State<SelectedProductList> {
  List<Data> filteredList = [];
  String currentQuery = "";

  void filter(String query) {
    currentQuery = query;
    setState(() {
      if (currentQuery.isEmpty) {
        filteredList =
            BlocProvider.of<VoucherProductBloc>(context).state.shownProduct;
      } else {
        filteredList = BlocProvider.of<VoucherProductBloc>(context)
            .state
            .shownProduct
            .where((product) {
          return (product.name ?? "")
              .toLowerCase()
              .contains(currentQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void initState() {
    filteredList =
        BlocProvider.of<VoucherProductBloc>(context).state.shownProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VoucherProductBloc, VoucherProductState>(
        listener: (BuildContext context, VoucherProductState state) {
      filter(currentQuery);
    }, builder: (context, state) {
      return Expanded(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      SharedLocalizations.of(context)!.productList,
                      style: const TextStyle(
                        color: Color(0xFF101828),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: double.infinity,
                      padding: const EdgeInsets.all(2),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEFF8FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${state.selectedProduct.length}/${state.shownProduct.length}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF156FEE),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SearchVoucherProduct(
                      filter: filter,
                    ),
                    const CheckAllReset(),
                     Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                       child: Container(
                         height: double.infinity,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: const BorderSide(
                                 width: 1, color: Color(0xFFEAECF0)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Container(
                             clipBehavior: Clip.antiAlias,
                             decoration: ShapeDecoration(
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(8)),
                             ),
                             child: ListView(
                               children: filteredList
                                   .map((e) =>
                                       EachProductComponent(product: e))
                                   .toList(),
                             )),
                       ),
                      ),
                    ), 
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
