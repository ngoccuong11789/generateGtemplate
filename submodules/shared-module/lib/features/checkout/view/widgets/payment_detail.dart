import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({
    super.key,
    this.price,
    this.discount,
    this.deliveryFee,
    this.deliveryDiscount
  });

  final num? price;
  final num? discount;
  final num? deliveryFee;
  final num? deliveryDiscount;

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    var title = Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        child: Text(
          SharedLocalizations.of(context)!.paymentDetails,
          style: const TextStyle(
            color: Color(0xFF344053),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 1.43,
          ),
        ),
      ),
    );
    var subtotalLayout = Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.subtotal,
              style: const TextStyle(
                color: Color(0xFF667084),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.43,
              ),
            ),
          ),
          Currency(
            name: "USD",
            value: widget.price ?? 0,
            lineThrough: false,
            prePromotionPrice: true,
            colorText: Colors.black,
            textSize: 14,
          )
        ],
      ),
    );
    var discountLayout = Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.discounts,
              style: const TextStyle(
                color: Color(0xFF667084),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.43,
              ),
            ),
          ),
         Row(
           children: [
             const Text(
               '-',
               style: TextStyle(
                 color: Color(0xFF344053),
                 fontSize: 12,
                 fontFamily: 'Inter',
                 fontWeight: FontWeight.w500,
                 height: 0.12,
               ),
             ),
             Currency(
               name: "USD",
               value: widget.discount ?? 0,
               lineThrough: false,
               prePromotionPrice: true,
               colorText: const Color(0xFF344053),
               textSize: 14,
             )
           ],
         )
        ],
      ),
    );
    var deliveryFeeLayout = Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.deliveryFee,
              style: const TextStyle(
                color: Color(0xFF667084),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.43,
              ),
            ),
          ),
          Currency(
            name: "USD",
            value: widget.deliveryFee ?? 0,
            lineThrough: false,
            prePromotionPrice: true,
            colorText: Colors.black,
            textSize: 14,
          )
        ],
      ),
    );
    var deliveryDiscountLayout = Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.deliveryDiscount,
              style: const TextStyle(
                color: Color(0xFF667084),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.43,
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                '-',
                style: TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),
              ),
              Currency(
                name: "USD",
                value: widget.deliveryDiscount ?? 0,
                lineThrough: false,
                prePromotionPrice: true,
                colorText: Colors.black,
                textSize: 14,
              )
            ],
          )
        ],
      ),
    );
    var total = Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.total,
              style: const TextStyle(
                color: ColorPalette.gray700,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.43,
              ),
            ),
          ),
          Currency(
            name: "USD",
            value: (widget.price ?? 0) -
                (widget.discount ?? 0) + (widget.deliveryFee ?? 0) - (widget.deliveryDiscount ?? 0) ,
            lineThrough: false,
            prePromotionPrice: true,
            colorText: Colors.black,
            textSize: 16,
          )
        ],
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          title,
          const SizedBox(height: 8),
          subtotalLayout,
          const SizedBox(height: 8),
          discountLayout,
          const SizedBox(height: 8),
          deliveryFeeLayout,
          const SizedBox(height: 8),
          deliveryDiscountLayout,
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.center,
            width: 450,
            height: 1,
            color: ColorPalette.grey200,
          ),
          total,
        ],
      ),
    );
  }
}
