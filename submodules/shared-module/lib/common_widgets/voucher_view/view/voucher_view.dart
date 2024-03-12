
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/VoucherManagement/model/VoucherResponseModel.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/package_util.dart';
import '../_components/_card.dart';
import '../_components/_value.dart';
import '../_components/_voucherTypeDisplay.dart';
import '../model/VoucherDetail.dart';
import '../_components/_field.dart';

class VoucherViewScreen extends StatelessWidget {
  const VoucherViewScreen({super.key, required this.data});

  final VoucherDetail data;

  @override
  Widget build(BuildContext context) {
    var setting1 = CardWidget(
        title: SharedLocalizations.of(context)!.voucherSettings,
        child: Column(
          children: [
            FieldWidget(
              title: SharedLocalizations.of(context)!.discountType,
              child: Row(
                children: [ValueWidget(value: data.discountType)],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.maximumDiscountPrice,
              child: Row(
                children: [ValueWidget(value: data.maxDiscountPrice == 0 ? "No limit" : data.maxDiscountPrice)],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.minimumOrderPrice,
              child: Row(
                children: [ValueWidget(value: data.minimumOrderPrice)], // check
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.quantity,
              child: Row(children: [
                ValueWidget(
                    value: (data.usedCount == null &&
                            data.maxUsageCount == null)
                        ?null : "${data.usedCount ?? ""} / ${data.maxUsageCount ?? ""}"
                       )
              ]),
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.maxDistributionPerBuyer,
              child: Row(
                children: [
                  ValueWidget(value: data.maximumUsagePerUserCount)
                ], // check
              ),
            ),
          ],
        ));
    var basicInfo = CardWidget(
      title: SharedLocalizations.of(context)!.basicInformation,
      child: Column(
        children: [
          FieldWidget(
            title: SharedLocalizations.of(context)!.voucherType,
            child: Row(
              children: [
                VoucherTypeDisplay(
                  content: data.voucherType?.name!,
                  image:  data.voucherType?.icon,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FieldWidget(
            title: SharedLocalizations.of(context)!.voucherCode,
            child: Row(
              children: [
                ValueWidget(value: data.voucherCode),
                data.voucherCode != null
                    ? GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: data.voucherCode!));
                          // copied successfully
                        },
                        child: package.createSvgFromAsset(AssetHelper.copyIco),
                      )
                    : Container()
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FieldWidget(
            title: SharedLocalizations.of(context)!.voucherName,
            child: Row(
              children: [ValueWidget(value: data.name)],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FieldWidget(
            title: SharedLocalizations.of(context)!.validPeriod,
            child: Row(
              children: [
                ValueWidget(
                    value: (data.startDate == null || data.endDate == null)
                        ? null
                        : "${getCustomFormattedDateTime(data.startDate!, 'dd/MM/yyyy, HH:mm')} - ${getCustomFormattedDateTime(data.endDate!, 'dd/MM/yyyy, HH:mm')}")
              ],
            ),
          ),
        ],
      ),
    );
    var setting2 = CardWidget(
        title: SharedLocalizations.of(context)!.voucherSettings,
        child: Column(
          children: [
            FieldWidget(
              title: SharedLocalizations.of(context)!.paymentMethod,
              child: Row(
                children: [ValueWidget(value: data.paymentTypeId == null ? SharedLocalizations.of(context)!.allPaymentMethod : data.paymentType?.name ?? '')],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.platform,
              child: Row(
                children: [ValueWidget(value: data.platform)],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.description,
              child: Html(
                data:
                "<div class= 'description'>${data.description ?? ''}</div>",
                style: {
                  "body": Style(margin: Margins.all(0), padding: HtmlPaddings.zero),
                  ".description": Style(
                    fontSize: FontSize(14),
                    color: const Color(0xFF344054),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    textOverflow: TextOverflow.ellipsis,
                  )
                },
              ),
            ),
          ],
        ));
    var setting3 = CardWidget(
        title: SharedLocalizations.of(context)!.voucherSettings,
        child: Column(
          children: [
            FieldWidget(
              title: SharedLocalizations.of(context)!.voucherDisplaySettings,
              child: Row(
                children: [
                  ValueWidget(value: data.displaySetting ?? "All page")
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            FieldWidget(
              title: SharedLocalizations.of(context)!.applicableProduct,
              child: Row(
                children: [
                  ValueWidget(
                      value: (data.isApplicableAll != null &&
                              data.isApplicableAll!)
                          ? SharedLocalizations.of(context)!.allProducts
                          : SharedLocalizations.of(context)!.special)
                ],
              ),
            ),
          ],
        ));
    return Scaffold(
      backgroundColor: ColorPalette.gray200,
      appBar: MainAppBar(
          titleAppbar: SharedLocalizations.of(context)!.voucherDetail),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 36),
          child: Column(
            children: [
              basicInfo,
              const SizedBox(
                height: 8,
              ),
              setting1,
              const SizedBox(
                height: 8,
              ),
              setting2,
              const SizedBox(
                height: 8,
              ),
              setting3
            ],
          ),
        ),
      ),
    );
  }
}
getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  final DateTime docDateTime = DateTime.parse(givenDateTime);
  return DateFormat(dateFormat).format(docDateTime.toLocal());
}