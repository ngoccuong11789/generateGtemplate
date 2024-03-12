import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/image_utils.dart';
import '../../../constants/color_palette.dart';
import '../enum/VoucherStatus.dart';
import '../model/VoucherResponseModel.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class VoucherItemWidget extends StatelessWidget {
  const VoucherItemWidget(
      {super.key,
      required this.voucherDetail,
      required this.onTap,
      required this.changePublic,
      required this.isDeleted,
      required this.onTapViewDetail,});

  final VoucherDetail voucherDetail;
  final Function() onTap;
  final Function() changePublic;
  final bool isDeleted;
  final Function() onTapViewDetail;

  @override
  Widget build(BuildContext context) {
    Widget _status(StatusVoucher statusVoucher) {
      String text = '';
      Color textColor;
      Color backgroundColor;
      switch (statusVoucher) {
        case StatusVoucher.onGoing:
        case StatusVoucher.noExpiredDate:
          {
            text = SharedLocalizations.of(context)!.ongoing;
            textColor = ColorPalette.green700;
            backgroundColor = ColorPalette.green50;
          }
        case StatusVoucher.upcoming:
          {
            text = SharedLocalizations.of(context)!.upcoming;
            textColor = ColorPalette.primary;
            backgroundColor = ColorPalette.primary50;
          }
        case StatusVoucher.expireDate:
          {
            text = SharedLocalizations.of(context)!.expireDate;
            textColor = ColorPalette.gray700;
            backgroundColor = ColorPalette.gray100;
          }
      }

      return FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          color: backgroundColor,
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    StatusVoucher? status =
        statusVoucher(voucherDetail.startDate, voucherDetail.endDate);
    String expireDate = isVoucherNoExpiredDate(voucherDetail.endDate!)
        ? SharedLocalizations.of(context)!.noExpiredDate
        : "${getCustomFormattedDateTime(voucherDetail.startDate!, 'dd/MM/yyyy, HH:mm')} - ${getCustomFormattedDateTime(voucherDetail.endDate!, 'dd/MM/yyyy, HH:mm')} ";
    Widget name() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              voucherDetail.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ColorPalette.gray700),
            )),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                onTap();
              },
              child: const icon.SoctripIcon(icon.Icons.dotsHorizontal,
                 style: TextStyle(color: ColorPalette.gray700),
              ),
            )
          ],
        );
    Widget code() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              voucherDetail.voucherCode ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ColorPalette.gray500),
            )),
            const SizedBox(
              width: 8,
            ),
            if (!isDeleted) _status(status!)
          ],
        );
    return GestureDetector(
      onTap: onTapViewDetail,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: ColorPalette.gray200, width: 1))),
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(expireDate),
                  SizedBox(
                      child: GestureDetector(
                          onTap: () {
                            changePublic();
                          },
                          child: _switch(voucherDetail.isPublic ?? false)))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: getImageUrl(voucherDetail.voucherType?.icon ?? "",type: ImageType.thumbnail),
                        height: 46,
                        width: 46,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            name(),
                            const SizedBox(
                              height: 4,
                            ),
                            code()
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                              text:
                                  '${SharedLocalizations.of(context)!.usedTotal}: ',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorPalette.gray500),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "${voucherDetail.usedCount}/${voucherDetail.maxUsageCount == 0 ? "Unlimited" : voucherDetail.maxUsageCount}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: ColorPalette.gray700)),
                              ],
                            ),
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          flex: 5,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                              text:
                                  '${SharedLocalizations.of(context)!.discountAmount}: ',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorPalette.gray500),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "${voucherDetail.discountType != "PERCENTAGE" ? "\$" : ""}${voucherDetail.discountAmount}${voucherDetail.discountType == "PERCENTAGE" ? "%" : ""}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: ColorPalette.gray700)),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  final DateTime docDateTime = DateTime.parse(givenDateTime).toUtc();
  return DateFormat(dateFormat).format(docDateTime.toLocal());
}

StatusVoucher? statusVoucher(String? start, String? end) { 
 int now = DateTime.now().toUtc().millisecondsSinceEpoch;
  int startDate = DateTime.parse(start!).millisecondsSinceEpoch;
  int endDate = DateTime.parse(end!).millisecondsSinceEpoch;
/*  if (DateTime.parse(end).compareTo(DateTime.utc(1,1,2999)) == 0 || DateTime.parse(end).compareTo(DateTime.utc(1,1,2050)) == 0) {
    return StatusVoucher.noExpiredDate;
  } */
  if (now > endDate) {
    return StatusVoucher.expireDate;
  }
  if (startDate < now && now < endDate) {
    return StatusVoucher.onGoing;
  }
  if (now < startDate) {
    return StatusVoucher.upcoming;
  }  
}

bool isVoucherNoExpiredDate(String end) {
  return (DateTime.parse(end).compareTo(DateTime.utc(1,1,2999)) == 0 || DateTime.parse(end).compareTo(DateTime.utc(1,1,2050)) == 0);
}

Widget _switch(bool value) => AnimatedContainer(
      duration: const Duration(seconds: 300),
      curve: Curves.decelerate,
      width: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: value ? ColorPalette.primary : ColorPalette.grey200),
      child: AnimatedAlign(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(seconds: 300),
          curve: Curves.decelerate,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
            ),
          )),
    );
