import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/voucher_preview/views/widgets/dashLinePainter.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';

class CardVoucher extends StatelessWidget {
  num geta;
  num minSpend;
  String expiredDay;
  bool isLimited;
  String typeGeta;

  CardVoucher(
      {super.key,
        this.geta = 0,
        this.minSpend = 0,
        this.expiredDay = "",
        this.isLimited = true,
        this.typeGeta= "\$"});

  @override
  Widget build(BuildContext context) {
    Widget circle(Matrix4 matrix4, bool isTop) {
      return Container(
        transform: matrix4,
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: isTop ? ColorPalette.primary600 : ColorPalette.baseWhite,
          border: Border.all(
              color: const Color(0xFFE04F16),
              width: 2),
          shape: BoxShape.circle,
        ),
      );
    }

    Widget leftVoucher(){
      return Row(
        children: [
          SizedBox(
            width: 90,
            child:package.createSvgFromAsset(
              "assets/icons/shopVoucher.svg",
              width: 75,
              height: 75
            ),
          ),
          Container(
            color: Colors.white,
            width: 16,
            child: Column(
              children: [
                circle(Matrix4.translationValues(0, -10, 0), true),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return CustomPaint(
                          painter: DashedLinePainter(
                              constraints.maxHeight),
                        );
                      },
                    ),
                  ),
                ),
                circle(Matrix4.translationValues(0, 10, 0), false),
              ],
            ),
          ),
        ],
      );
    }
    return Container(
        height: 100,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xFFE04F16),
                width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: Stack(
          children: [
            Row(
              children: [
                leftVoucher(),
                rightVoucher(context, geta, minSpend, expiredDay, typeGeta),
              ],
            ),
            isLimited ?
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                decoration: const ShapeDecoration(
                  color: Color(0xFFE04F16),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
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
                            SharedLocalizations.of(context)!.limitedRedemption,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ) : const SizedBox(),
          ],
        ),
      );
  }
}

Widget rightVoucher(BuildContext context, num geta, num minSpend, String expiredDay, String typeGeta) {
  return
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(SharedLocalizations.of(context)!.getAVoucher(geta, typeGeta),
              style: const TextStyle(
                color: Color(0xFF344054),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              SharedLocalizations.of(context)!.minSpendVoucher(minSpend, "\$ "),
              style: const TextStyle(
                color: Color(0xFF344054),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(SharedLocalizations.of(context)!.expiredDayVoucher(expiredDay)
              , style: const TextStyle(
              color: Color(0xFF667085),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      );
}