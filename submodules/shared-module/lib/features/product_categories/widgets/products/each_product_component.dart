import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/product_categories/models/catalog_product.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/image_utils.dart';

class EachProductComponent extends StatefulWidget {
  const EachProductComponent({
    super.key,
    required this.product,
  });

  final Data product;

  @override
  State<EachProductComponent> createState() => _EachProductComponentState();
}

class _EachProductComponentState extends State<EachProductComponent> {
  @override
  Widget build(BuildContext context) {
    Widget productImage = Container(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: widget.product.avatar != null
              ? CachedNetworkImageProvider(getImageUrl(widget.product.avatar!.id! ,type: ImageType.thumbnail) ) as ImageProvider<Object>
              : const AssetImage('assets/fallback.jpg', package: packageName),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFEAECF0)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
    Widget productName = SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        widget.product.name ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0xFF344053),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 1.50,
        ),
      ),
    );
    Widget productStockAndPrice = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 16,
          height: 16,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: SvgPicture.asset(
            'assets/icons/coins-stacked.svg',
            package: packageName,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          SharedLocalizations.of(context)!.inStockWithColon,
          style: const TextStyle(
            color: Color(0xFF667084),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          widget.product.quantity != null
              ? SharedLocalizations.of(context)!.compact(widget.product.quantity!)
              : "0",
          style: const TextStyle(
            color: Color(0xFF344053),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.50,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 16,
          height: 16,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: SvgPicture.asset(
            'assets/icons/bank-note.svg',
            package: packageName,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          SharedLocalizations.of(context)!.priceWithColon,
          style: const TextStyle(
            color: Color(0xFF667084),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
        ),
        const SizedBox(width: 4),
        Opacity(
            opacity: 0.90,
            child: Currency(
              value: widget.product.price ?? 0,
              name: 'USD',
              lineThrough: false,
            )),
      ],
    );

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          productImage,
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productName,
              // const SizedBox(height: 4),
              productStockAndPrice
            ],
          ),
        ],
      ),
    );
  }
}
