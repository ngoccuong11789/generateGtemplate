import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart';

class ShownCatalogs extends StatefulWidget {
  const ShownCatalogs({super.key, required this.catalog});

  final LocalCatalog catalog;

  @override
  State<ShownCatalogs> createState() => _ShownCatalogsState();
}

class _ShownCatalogsState extends State<ShownCatalogs> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherProductBloc, VoucherProductState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<VoucherProductBloc>()
                .add(RemoveCatalog(widget.catalog));
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(3),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.catalog.name ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF344054),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.11,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
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
                        child: const Text("X", style: TextStyle(
                        color: Color(0xFF344054),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
