import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/buy_now/bloc/variants_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/image_utils.dart';

import '../../../utils/image_error_builder.dart';

class VariantGroup<T> extends StatefulWidget {
  const VariantGroup({super.key, required this.product, required this.index, this.stockIdSelected, this.isMyCart});
  final T product;
  final int index;
  final bool? isMyCart;
  final String? stockIdSelected;

  @override
  State<VariantGroup> createState() => _VariantGroupState();
}

class _VariantGroupState extends State<VariantGroup> {
  int currentIndex = 0;
  bool isFirst = true;

  @override
  void initState() {
    (widget.stockIdSelected == '') ? checkStock(0) : checkDefault();
    super.initState();
  }

  bool isCheckSelected(int index) {
    return (widget.product.prices![widget.index].variations![index].id == widget.stockIdSelected);
  }

  void checkStock(int index) {
    widget.index == 0
        ? context.read<VariantsBloc>().add(SetVariant1stEvent(
        widget.product.prices![widget.index].variations![index].id!))
        : context.read<VariantsBloc>().add(SetVariant2ndEvent(
        widget.product.prices![widget.index].variations![index].id!));
    context.read<VariantsBloc>().add(const CalculateVariantEvent());
  }

  void checkDefault() {
    widget.index == 0
        ? context.read<VariantsBloc>().add(SetVariant1stEvent(widget.stockIdSelected ?? ''))
        : context.read<VariantsBloc>().add(SetVariant2ndEvent(widget.stockIdSelected ?? ''));
    context.read<VariantsBloc>().add(const CalculateVariantEvent());
  }

  void selectVariant(int index) {
    if (isFirst) {
      setState(() {
        isFirst = false;
      });
    }
    setState(() {
      currentIndex = index;
    });
    checkStock(index);
  }

  Color colorText(int index) {
    return isFirst
        ? ((widget.isMyCart == true)
            ? (isCheckSelected(index)
                ? ColorPalette.primary
                : Color(0xFF344053))
            : currentIndex == index
                ? ColorPalette.primary
                : Color(0xFF344053))
        : (currentIndex == index ? ColorPalette.primary : Color(0xFF344053));
  }

  Color colorBorder(int index) {
    return isFirst
        ? ((widget.isMyCart == true)
            ? (isCheckSelected(index)
                ? ColorPalette.primary
                : ColorPalette.gray200)
            : currentIndex == index
                ? ColorPalette.primary
                : ColorPalette.gray200)
        : (currentIndex == index ? ColorPalette.primary : ColorPalette.gray200);
  }

  @override
  Widget build(BuildContext context) {
    Widget variantName = Text(
      widget.product.prices![widget.index].name,
      style: const TextStyle(
        color: Color(0xFF344053),
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 1.43,
      ),
    );
    Widget variantWithImage = GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.product.prices![widget.index].variations!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 4,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            selectVariant(index);
          },
          child: Container(
            decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: colorBorder(index))),
              height: 44,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: CachedNetworkImage(
                      height: 24,
                      width: 24,
                      imageUrl: getImageUrl(widget.product.prices != null ?
                      widget.product.prices![widget.index].variations != null ?
                      widget.product.prices![widget.index].variations![index].image != null ?
                      widget.product.prices![widget.index].variations![index].image!.id ?? ""
                          : ""
                          : ""
                          :"",
                          type: ImageType.thumbnail),
                      fit: BoxFit.fitWidth,
                      errorWidget: imageErrorBuilder,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.product.prices![widget.index].variations![index]
                        .name ??
                        "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                          color: colorText(index),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        )),
                )
              ],
            )
          ),
        );
      },
    );
    Widget variantWithoutImage = GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.product.prices![widget.index].variations!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2,
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectVariant(index);
          },
          child: Container(
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                        color: colorBorder(index))),
            width: double.infinity,
            child: Center(
              child: Text(
                widget.product.prices != null ?
                widget.product.prices![widget.index].variations != null ?
                widget.product.prices![widget.index].variations![index].name ?? ""
                    : ""
                    : "",
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: colorText(index),
                    fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                )
              ),
            ),
          ),
        );
      },
    );

    return BlocBuilder<VariantsBloc, VariantsState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          variantName,
          const SizedBox(
            height: 12,
          ),
          widget.product.prices![widget.index].isContainsImage!
              ? variantWithImage
              : variantWithoutImage,
          const SizedBox(
            height: 16,
          ),
        ],
      );
    });
  }
}
