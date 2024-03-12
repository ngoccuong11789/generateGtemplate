import 'package:flutter/material.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/checkout/model/method_payment.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectPayment extends StatefulWidget {
  const SelectPayment({
    super.key,
    required this.callback,
    required this.paymentList,
  });

  final Function(int) callback;
  final MethodPayment paymentList;

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  Widget genIcon(DataMethodPayment item) {
    switch(item.code) {
      case "1":
        return package.createSvgFromAsset(AssetHelper.codIcons, width: 24.0, height: 24.0);
      case "2":
        return package.createSvgFromAsset(AssetHelper.onlineBanking, width: 24.0, height: 24.0);
      case "3":
        return package.createSvgFromAsset(AssetHelper.creditCard, width: 24.0, height: 24.0);
      case "4":
        return const icon.SoctripIcon(
          icon.Icons.currencyBitcoinCircle,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget methodPayment(DataMethodPayment item, int index) {
      var infoPayment =
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            genIcon(item),
            const Padding(padding: EdgeInsets.only(left: 8.0)),
            Text(
              item.name ?? '',
              style: const TextStyle(
                color: Color(0xFF344053),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.43,
              ),
            ),
          ],
        ),
        Row(
          children: [
            item.name == SharedLocalizations.of(context)!.creditCard
                ? package.createSvgFromAsset(AssetHelper.creditCardDetailIcons)
                : Container(),
            Theme(
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
                    value: item.isSelect,
                    onChanged: (value) => widget.callback(index)),
              ),
            ),
          ],
        )
      ]);
      var checkboxItem = Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(children: [
            Container(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 8.0),
                decoration: ShapeDecoration(
                  color: item.isSelect ? ColorPalette.primary50 : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 2,
                        color: item.isSelect
                            ? ColorPalette.primary600
                            : const Color(0xFFEAECF0)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: infoPayment)
          ]));
      return GestureDetector(
          onTap: () {
            widget.callback(index);
          },
          child: checkboxItem);
    }

    if (widget.paymentList.data.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                SharedLocalizations.of(context)!.paymentMethod,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                ),
              ),
            ),
            Column(children: [
              ...widget.paymentList.data
                  .asMap()
                  .entries
                  .map(
                    (e) => methodPayment(e.value, e.key),
              )
                  .toList()
            ])
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
