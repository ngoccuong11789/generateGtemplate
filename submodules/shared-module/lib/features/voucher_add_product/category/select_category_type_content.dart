import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectCategoryTypeContent extends StatefulWidget {
  const SelectCategoryTypeContent({
    super.key,
    required this.next,
    required this.list,
    this.selectCategory = false
  });

  final Function(LocalCatalog) next;
  final List<LocalCatalog> list;
  final bool selectCategory;

  @override
  State<SelectCategoryTypeContent> createState() =>
      _SelectCategoryTypeContentState();
}

class _SelectCategoryTypeContentState extends State<SelectCategoryTypeContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherProductBloc, VoucherProductState>(
      builder: (context, state) {
         
        return Container(
          clipBehavior: Clip.hardEdge,
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
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              bool condition = (widget.selectCategory && state.selectedCategory?.id == widget.list[index].id) || state.selectingCatalog.contains(widget.list[index]);
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: condition
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
                          context
                              .read<VoucherProductBloc>()
                              .add(widget.selectCategory
                          ? SelectCategory(widget.list[index])
                          : SelectCatalog(widget.list[index]));
                        },
                        child: Text(
                          widget.list[index].name!,
                          style: condition
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
                        widget.next(widget.list[index]);
                      },
                      child: Visibility(
                        visible: state.shownCatalog
                            .where((element) =>
                                element.parentId == widget.list[index].id)
                            .isNotEmpty,
                        child: Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: condition
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
