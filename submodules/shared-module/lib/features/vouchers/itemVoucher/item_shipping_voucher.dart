import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_module/common_widgets/check_box.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/vouchers/bloc/shop_voucher_bloc.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/features/vouchers/view/voucher_screen.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/date_format.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class ItemShippingVouchers extends StatelessWidget {
  final DataItemVoucher dataItemVoucher;
  final num price;
  final String shopId;
  final VoidCallback? onData;
  const ItemShippingVouchers(
      {super.key,
      required this.dataItemVoucher, required this.price,
      this.onData, required this.shopId, });

  @override
  Widget build(BuildContext context) {
    Widget _circle(Matrix4 matrix4) {
      return Container(
        transform: matrix4,
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: const Color(0xFF039754),
              width: 2),
          shape: BoxShape.circle,
        ),
      );
    }

    num calculatorPriceVoucher(DataItemVoucher data,) {
      return ((data.minimumOrderPrice ?? 0) - price) ;
    }

    var leftVoucher = Row(
      children: [
        Expanded(
            flex: 8,
            child: package.createSvgFromAsset("assets/icons/free-ship-voucher.svg",
                width: 40.0, height: 40.0)),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 20,
            child: Column(
              children: [
                _circle(Matrix4.translationValues(0, -10, 0)),
                Expanded(
                  child: Container(
                    height: 74,
                    color: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return CustomPaint(
                          painter: DashedLinePainter(
                              constraints.maxHeight ),
                        );
                      },
                    ),
                  ),
                ),
                _circle(Matrix4.translationValues(0, 10, 0)),
              ],
            ),
          ),
        ),
      ],
    );

    Widget rightVoucher(bool isCheck) {
      return  Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(padding: const EdgeInsets.only(left: 16.0), child: Container(child: contentCoupon(dataItemVoucher, context),),
            ),),
          Expanded(
            flex: 1,
            child: Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: Transform.scale(
                scale: 1,
                child: Checkbox(
                    shape: const CircleBorder(),
                    side: MaterialStateBorderSide.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const BorderSide(
                              width: 1, color: ColorPalette.primary600);
                        }
                        return const BorderSide(
                            width: 1, color: ColorPalette.gray300);
                      },
                    ),
                    activeColor: ColorPalette.primary600,
                    checkColor: Colors.white,
                    value: isCheck,
                    onChanged: (value) => {onData!()}),
              ),
            ),
          ),
        ],
      );
    }

    bool isCheck = false;
    return BlocBuilder<ShopVoucherBloc, ShopVoucherState>(
        builder: (context, state) {
      final check = (state.listItemVoucherShipping ?? []).where((element) {
        return (element.shopId).contains(shopId) &&
            (element.voucherId?.id ?? '').contains(dataItemVoucher.id ?? '');
      }).toList();
      if (check.isNotEmpty) {
        isCheck = true;
      } else {
        isCheck = false;
      }
      return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              Opacity(
                opacity: dataItemVoucher.isVisible ? 1 : 0.5,
                child: Container(
                  height: 88,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF039754), width: 1),
                    borderRadius: BorderRadius.circular(8),
                    color: isCheck ? const Color(0xFFEBFDF2) : Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: leftVoucher),
                      Expanded(flex: 3, child: rightVoucher(isCheck)),
                    ],
                  ),
                ),
              ),
              !dataItemVoucher.isVisible
                  ? Row(
                      children: [
                        const icon.SoctripIcon(
                          icon.Icons.alertCircle,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFE62E05)),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          SharedLocalizations.of(context)!.warningVoucher(
                              calculatorPriceVoucher(dataItemVoucher), "USD"),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color(0xFFE62E05),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          ));
    });
  }
}

int daysBetween(DateTime from, DateTime? to) {
  if (to != null) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
  return 10;
}

bool isExpired(int day) {
  if (day <= 7) {
    return true;
  } else {
    return false;
  }
}

Widget contentCoupon(DataItemVoucher data, BuildContext context) {
  final difference = daysBetween(DateTime.now() ,data.endDate);
  return Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  SharedLocalizations.of(context)!
                      .minSpendVoucher(data.minimumOrderPrice, "USD"),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      color: Colors.grey[700]),
                ),
                const Padding(padding: EdgeInsets.only(right: 4.0)),
              ],
            )),
        // data.isLimitUsage == true ? Padding(padding: const EdgeInsets.only(top: 5.0), child: LinearPercentIndicator(
        //     padding: EdgeInsets.zero,
        //     lineHeight: 8.0,
        //     percent: ((data.usedCount ?? 0) / (data.maxUsageCount ?? 0)),
        //     backgroundColor: const Color(0xffD9D9D9),
        //     animation: false,
        //     barRadius: const Radius.circular(10),
        //     alignment: MainAxisAlignment.center,
        //     animateFromLastPercent: true,
        //     linearGradient: const LinearGradient(
        //       colors: [Color(0xFFDC6803), Color(0xFFDC6803)],
        //     ),)
        // ) : Container(),
        // data.isLimitUsage == false ? Align(
        //   alignment: Alignment.centerLeft,
        //   child: Text(
        //       SharedLocalizations.of(context)!
        //           .expiredDayVoucher(dateFormat(context, data.endDate!)),
        //       style: TextStyle(
        //         color: isExpired(difference) ? const Color(0xFFD92D20) : const Color(0xFF667085),
        //         fontSize: 12,
        //         fontFamily: 'Inter',
        //         fontWeight: FontWeight.w400,
        //       ),)
        // ) : Container(),
        // const SizedBox(height: 8.0,),
        // data.isLimitUsage == true ? Column(
        //   children: [
        //     Align(
        //         alignment: Alignment.centerLeft,
        //         child:  Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "${SharedLocalizations.of(context)!.used} ${((data.usedCount ?? 0) / (data.maxUsageCount ?? 0) * 100).toInt()}%",
        //               textAlign: TextAlign.right,
        //               style: const TextStyle(
        //                 color: Color(0xFF667085),
        //                 fontSize: 10,
        //                 fontFamily: 'Inter',
        //                 fontWeight: FontWeight.w400,
        //                 height: 0.16,
        //               ),
        //             ),
        //             Text(
        //               (data.endDate != null) ? SharedLocalizations.of(context)!
        //                   .expiredDayVoucher(dateFormat(context, data.endDate!)) : SharedLocalizations.of(context)!.unlimited,
        //               style: TextStyle(
        //                 color: isExpired(difference) ? const Color(0xFFD92D20) : const Color(0xFF667085),
        //                 fontSize: 10,
        //                 fontFamily: 'Inter',
        //                 fontWeight: FontWeight.w400,
        //                 height: 0.16,
        //               ),
        //             )
        //           ],)
        //     ),
        //     const SizedBox(height: 8.0,),
        //   ],
        // ) : Container()
      ]));
}

class DashedLinePainter extends CustomPainter {
  final double parentHeight;

  DashedLinePainter(this.parentHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF039754)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    const dashWidth = 2;
    const dashSpace = 2;
    double startY = 0;

    while (startY < parentHeight) {
      canvas.drawLine(Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
