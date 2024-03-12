import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';
import '../../../constants/AccessHelper.dart';
import '../model/AddressNewModel.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    super.key,
    required this.selectDefaultAddress,
    required this.editAddress,
    required this.addressNewData,
    required this.isFromCheckout, required this.idAddressSelected,
  });

  final AddressNewModel addressNewData;
  final Function() selectDefaultAddress;
  final Function() editAddress;
  final bool isFromCheckout;
  final String idAddressSelected;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  Widget addressType(
    String content,
    bool check,
    Color color,
    Color textColor,
  ) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        content,
        style: TextStyle(
            color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 24;
    double horizontalPadding = 8;
    double width = (MediaQuery.of(context).size.width);
    bool isHome = widget.addressNewData.addressType == typeHOME;
    String content = widget.addressNewData.addressType ?? typeHOME;
    final tagAddressDefault = widget.addressNewData.isDefault == true
        ? addressType(SharedLocalizations.of(context)!.addressDefault,
            widget.addressNewData.isDefault == true, ColorPalette.blue50, ColorPalette.bluePrimary)
        : Container();
    addressName(String name) {
      double selfPadding = 8;
      double typeAddressWidth = 0;
      if (widget.addressNewData.isDefault ==true) {
        typeAddressWidth = 116;
      } else {
        typeAddressWidth = 50;
      }
      return Container(
        constraints: BoxConstraints(
            maxWidth: width -
                horizontalPadding -
                selfPadding -
                iconSize * 2 -
                typeAddressWidth),
        padding: EdgeInsets.symmetric(horizontal: selfPadding),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorPalette.gray700),
        ),
      );
    }

    Widget isDefaultAddress(
      Function() opTap,
    ) {
      return SizedBox(
        child: GestureDetector(
            onTap: widget.isFromCheckout ? () {
              widget.selectDefaultAddress;
              Navigator.of(context).pop(widget.addressNewData);
            } : opTap,
            child: widget.isFromCheckout ? Icon(
                widget.addressNewData.id == widget.idAddressSelected
                    ? Icons.radio_button_checked_outlined:Icons.radio_button_off_outlined,
                color: widget.addressNewData.id == widget.idAddressSelected
                    ? ColorPalette.bluePrimary
                    : ColorPalette.gray300) : Icon(
                widget.addressNewData.isDefault == true
                    ? Icons.radio_button_checked_outlined:Icons.radio_button_off_outlined,
                color: widget.addressNewData.isDefault == true
                    ? ColorPalette.bluePrimary
                    : ColorPalette.gray300)));
    }

    Widget editIcon() {
      return GestureDetector(
          onTap: widget.editAddress,
          child:package.createSvgFromAsset(AssetHelper.editAddress,width: 24,height: 24)
      );
    }

    Widget infoDetail(String phoneNumber, String address) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            phoneNumber,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorPalette.gray500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            address,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorPalette.gray500),
          )
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: 1, color: ColorPalette.gray900.withOpacity(0.05)))),
      child: GestureDetector(
        onTap: () {
          if (widget.isFromCheckout) {
            widget.selectDefaultAddress;
            Navigator.of(context).pop(widget.addressNewData);
          }
        },
        // onTap:
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isDefaultAddress(widget.selectDefaultAddress),
                    addressName(widget.addressNewData.userFullName!),
                    addressType(
                        content,
                        widget.addressNewData.isDefault == true,
                        isHome ? ColorPalette.orange50 : ColorPalette.green50,
                        isHome
                            ? ColorPalette.orange700
                            : ColorPalette.green700),
                    const SizedBox(
                      width: 8,
                    ),
                    tagAddressDefault,
                  ],
                ),
                editIcon(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: (iconSize + 8)),
                child: infoDetail(widget.addressNewData.userPhoneNumber!,
                    "${widget.addressNewData.address ?? ""} ${widget.addressNewData.ward ?? ""} ${widget.addressNewData.district ?? ""} ${widget.addressNewData.city ?? ""} ${widget.addressNewData.country ?? ""}"))
          ],
        ),
      ),
    );
  }
}
