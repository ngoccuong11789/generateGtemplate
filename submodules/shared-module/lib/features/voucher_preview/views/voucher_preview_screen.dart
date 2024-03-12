import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/features/add_new_voucher/models/add_voucher_request.dart';
import 'package:shared_module/features/voucher_preview/views/widgets/cardTitleContent.dart';
import 'package:shared_module/features/voucher_preview/views/widgets/cardVoucher.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class VoucherPreview extends StatelessWidget {
  const VoucherPreview({super.key, required this.addVoucherRequest});

  final AddVoucherRequest addVoucherRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleAppbar: SharedLocalizations.of(context)!.voucherPreview,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(addVoucherRequest, context),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Text(addVoucherRequest.name ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardTitleContent(
                      textTitle: SharedLocalizations.of(context)!.voucherCode,
                      content: addVoucherRequest.voucherCode ?? "",
                    ),
                    CardTitleContent(
                        textTitle: SharedLocalizations.of(context)!.validPeriod,
                        content:
                            ("${addVoucherRequest.startDate ?? "..."} - ${addVoucherRequest.endDate ?? SharedLocalizations.of(context)!.noEndDate}")),
                    CardTitleContent(
                      textTitle: SharedLocalizations.of(context)!.reward,
                      content:  SharedLocalizations.of(context)!.getAVoucher(addVoucherRequest.discountAmount ?? 0, addVoucherRequest.discountType == "PERCENTAGE"  ? "%" :"\$ "),
                      isPrice: true,
                      minPrice: addVoucherRequest.minimumOrderPrice ?? 0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CardTitleContent(
                              textTitle: SharedLocalizations.of(context)!
                                  .paymentMethod,
                              content: addVoucherRequest.paymentTypeId ?? ""),
                        ),
                        Expanded(
                          flex: 1,
                          child: CardTitleContent(
                              textTitle:
                                  SharedLocalizations.of(context)!.platform,
                              content: addVoucherRequest.platform == "ALL" ? SharedLocalizations.of(context)!.allPlatforms : addVoucherRequest.platform == "WEB" ? SharedLocalizations.of(context)!.web : SharedLocalizations.of(context)!.app,),
                        )
                      ],
                    ),
                    CardTitleContent(
                        textTitle: SharedLocalizations.of(context)!.description,
                        content: addVoucherRequest.description ?? ""),
                    CardTitleContent(
                        textTitle: SharedLocalizations.of(context)!.targetBuyer,
                        content: addVoucherRequest.displaySetting == "ALL_PAGE"
                            ? SharedLocalizations.of(context)!.allBuyers
                            : SharedLocalizations.of(context)!.onlyViaShare),
                    CardTitleContent(
                        textTitle:
                            SharedLocalizations.of(context)!.applicableProduct,
                        content: addVoucherRequest.isApplicableAll ?? true
                            ? SharedLocalizations.of(context)!
                                .thisVoucherForAllProducts
                            : SharedLocalizations.of(context)!
                                .thisVoucherForSomeProducts)
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget headerWidget(AddVoucherRequest dataVoucher, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 96,
          color: ColorPalette.primary600,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: CardVoucher(
              geta: dataVoucher.discountAmount ?? 0,
              minSpend: dataVoucher.minimumOrderPrice ?? 0,
              expiredDay: dataVoucher.endDate ??
                  SharedLocalizations.of(context)!.noEndDate,
              isLimited: dataVoucher.isLimitUsage ?? true,
              typeGeta: dataVoucher.discountType == "PERCENTAGE" ? "%" : "\$ "),
        )
      ],
    );
  }
}
