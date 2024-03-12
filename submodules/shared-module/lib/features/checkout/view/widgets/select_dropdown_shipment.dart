import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/line.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/checkout/blocs/checkout_bloc.dart';
import 'package:shared_module/features/checkout/model/city_model.dart';
import 'package:shared_module/features/checkout/model/countries.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectDropDownShipments extends StatefulWidget {
  final Function(ItemShipment) onGetShipment;
  final List<ItemShipment> shipments;
  final CheckoutBloc bloc;
  const SelectDropDownShipments({super.key, required this.shipments, required this.onGetShipment, required this.bloc});

  @override
  State<SelectDropDownShipments> createState() => _SelectDropDownShipmentsState();
}

class _SelectDropDownShipmentsState extends State<SelectDropDownShipments> {
  ItemShipment _selected = ItemShipment();

  void showModal(context, List<ItemShipment> list) {
    var lineTop = Container(
      width: 36,
      height: 5,
      decoration: ShapeDecoration(
        color: const Color(0x4C3C3C43),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.50),
        ),
      ),
    );
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Column(
                children: [
                  const SizedBox(height: 10.0,),
                  lineTop,
                  const SizedBox(height: 16.0,),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            SharedLocalizations.of(context)!.chooseShipment,
                            style: const TextStyle(
                              color: Color(0xFF101828),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const icon.SoctripIcon(icon.Icons.xClose, style: TextStyle(fontSize: 20))
                          )
                        ],
                      )
                  ),
                  const ThinLine(),
                  const SizedBox(height: 16.0,),
                  ...list.asMap().entries.map((e) {
                    var index = e.key;
                    var value = e.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = list[index];
                        });
                        widget.onGetShipment(_selected);
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 16.0,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(getImageById(value.carrierLogo??'', ImageType.mobile)),
                                      fit: BoxFit.contain,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(width: 0.50, color: Color(0xFFEAECF0)),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value.carrierName ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ((list.length - 1) != index) ? const Divider(
                              height: 1,
                              color: ColorPalette.gray200,
                            ) : Container()
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  )
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            widget.shipments.isNotEmpty ? showModal(context, widget.shipments) : ();
          },
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFCFD4DC)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          (_selected.carrierName != null) ? (_selected.carrierName ?? '') : SharedLocalizations.of(context)!.pleaseSelectShipment,
                          style: const TextStyle(
                            color: Color(0xFF667084),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                    width: 20,
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child:
                    package.createSvgFromAsset(AssetHelper.downChevron)),
              ],
            ),
          ),
        ));
  }
}
