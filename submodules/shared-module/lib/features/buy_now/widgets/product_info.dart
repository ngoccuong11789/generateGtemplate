import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/buy_now/bloc/variants_bloc.dart';
import 'package:shared_module/utils/image_utils.dart';

class ProductInfo<T> extends StatefulWidget {
  const ProductInfo({super.key, required this.product});

  final T product;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VariantsBloc, VariantsState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: widget.product.avatar != null
                        ? CachedNetworkImageProvider(
                           getImageUrl(widget.product.avatar!.id!,type: ImageType.thumbnail),
                          )
                        : Image.asset(
                            AssetHelper.fallbackImage,
                            package: packageName,
                          ).image,
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFEAECF0)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0C101828),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name ?? "",
                      softWrap: true,
                      style: const TextStyle(
                        color: Color(0xFF344053),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 1.43,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Currency(
                          name: "USD",
                          value: state.stocks?.originalPrice ?? widget.product.originalPrice ?? 0,
                          prePromotionPrice: true,
                          lineThrough: true,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Currency(
                          name: "USD",
                          value: state.stocks?.price ?? widget.product.price ?? 0,
                          prePromotionPrice: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
