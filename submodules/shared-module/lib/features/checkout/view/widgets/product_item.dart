import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/line.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/checkout/blocs/checkout_bloc.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';
import 'package:shared_module/features/checkout/view/widgets/checkbox_invoices.dart';
import 'package:shared_module/features/checkout/view/widgets/shipment.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart'
    as cart_response;
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/my_cart/view/note_input.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class ProductItem extends StatefulWidget {
  final EntityDtos data;
  final Function(String) onGetNote;
  final Function(bool) onGetElectronic;
  final Function(ItemShipment) shippingCode;
  final num price;
  final AddressNewModel? address;
  final CheckoutBloc bloc;
  final List<ItemVoucherShipping>? listSelectVoucherShipping;
  final List<ItemVoucherShop>? listSelectVoucher;

  const ProductItem(
      {super.key,
      required this.data,
      required this.price,
      required this.onGetNote, required this.onGetElectronic,
      required this.bloc,
      this.address,
      required this.shippingCode, this.listSelectVoucherShipping, this.listSelectVoucher});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final TextEditingController noteOther = TextEditingController();
  late String nameVoucherShop = '';
  late String nameVoucherShipping = '';

  void genNameVoucher(List<ItemVoucherShop> listVoucherShop, List<ItemVoucherShipping> listVoucherShipping ) {
    final voucherShop = listVoucherShop.where((element) => element.shopId == widget.data.id).toList();
    if (voucherShop.isNotEmpty) {
      nameVoucherShop = voucherShop[0].voucherId?.name?? '';
    }
    final voucherShipping = listVoucherShipping.where((element) => element.shopId == widget.data.id).toList();
    if (voucherShipping.isNotEmpty) {
      nameVoucherShipping = voucherShipping[0].voucherId?.name?? '';
    }
  }

  @override
  void initState() {
    genNameVoucher(widget.listSelectVoucher ?? [], widget.listSelectVoucherShipping ?? []);
    startGetShipments();
    super.initState();
  }
  @override
  void didUpdateWidget(covariant ProductItem oldWidget) {
    if(widget.address?.id != oldWidget.address?.id) {
      startGetShipments();
    }
    super.didUpdateWidget(oldWidget);
  }

  void startGetShipments() {
    if (widget.address?.id != null) {
      widget.bloc.add(GetShipment(
          address: widget.address ?? AddressNewModel(), shop: widget.data));
    }
  }

  void getOnShipment(ItemShipment item) {
    widget.shippingCode(item);
  }

  void getOnNote(String text) {
    widget.onGetNote(text);
  }

  void getOnElectronic(bool isElectronic) {
    widget.onGetElectronic(isElectronic);
  }

  @override
  Widget build(BuildContext context) {
    Widget imageProduct(cart_response.ObjectDtOs item) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    getImageById(item.avatar?.id ?? '', ImageType.mobile)),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFEAECF0)),
                borderRadius: BorderRadius.circular(6),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0C101828),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget infoProduct(cart_response.ObjectDtOs item) {
      return Flexible(
          child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(item.name ?? SharedLocalizations.of(context)!.noData,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                )),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Text(
                SharedLocalizations.of(context)!.variationProduct,
                style: const TextStyle(
                  color: Color(0xFF667084),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.60,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                item.stockDetail?.variationFirstName ?? '',
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.60,
                ),
              ),
              Text(
                item.stockDetail?.variationSecondName ?? '',
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.60,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'x${SharedLocalizations.of(context)!.compact(item.quantity ?? 0)}',
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
              Currency(
                name: "USD",
                value: item.stockDetail?.price ?? 0,
                lineThrough: false,
                prePromotionPrice: true,
                colorText: Colors.black,
              )
            ],
          )
        ],
      ));
    }

    Widget product(List<cart_response.ObjectDtOs> item) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ...item
                .map((e) => Column(children: [
                      const Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        children: [
                          imageProduct(e),
                          const Padding(padding: EdgeInsets.only(left: 8.0)),
                          infoProduct(e),
                        ],
                      ),
                    ]))
                .toList(),
            const Padding(padding: EdgeInsets.all(8.0)),
          ],
        ),
      );
    }

    Widget shopCheck(cart_response.EntityDtos shop) {
      return Container(
          height: 48.0,
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.all(3.0),
                    child: ClipOval(
                      child: CachedNetworkImage(
                          imageUrl: getImageById(
                              shop.avatar?.id ?? "", ImageType.mobile),
                          errorWidget: (BuildContext context, String url,
                              Object exception) {
                            return package
                                .createSvgFromAsset(AssetHelper.shopDefault);
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(shop.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: CommonTextStyle.textSmSemibold),
                    ),
                  ),
                ],
              ),
            ],
          ));
    }

    Widget genVoucher() {
      return  Container(
        padding:
        const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  Container(
                    child: Text(
                      "${SharedLocalizations.of(context)!.vouchers}:",
                      style: const TextStyle(
                        color: Color(0xFF344053),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  (nameVoucherShop != '') ? TextButton.icon(
                    onPressed: () {},
                    icon: const icon.SoctripIcon(
                      icon.Icons.solidCheckVerified02,
                      style: TextStyle(
                          color: ColorPalette.red700, fontSize: 12),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      backgroundColor: const Color(0xFFFFF3ED),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    label: Text(
                      nameVoucherShop,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFB93814),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ) : Container(),
                  (nameVoucherShipping != '') ? TextButton.icon(
                    onPressed: () {},
                    icon: package.createSvgFromAsset(
                        AssetHelper.shippingDelivery,
                        height: 12,
                        width: 12),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      backgroundColor: const Color(0xFFEBFDF2),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    label: Text(
                      nameVoucherShipping,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF039754),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ) : Container(),
                ],
              ))
        ]),
      );
    }

    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              shopCheck(widget.data),
              const ThinLine(),
              product(widget.data.objectDTOs ?? []),
              NoteInput(
                onGetNote: getOnNote,
              ),
              genVoucher(),
              const ThinLine(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    List<ItemShipment> getShipmentMethods(){
                      String shopId = widget.data.id!;
                      final methods = state.shipments?[shopId] ?? [];
                      return methods;
                    }
                return Shipment(
                  bloc: widget.bloc,
                  onGetShipment: (newValue) {
                    getOnShipment(newValue);
                  },
                  list: getShipmentMethods()
                );
              }),
              CheckInvoice(
                onInvoices: (newValue) {
                  getOnElectronic(newValue);
                },
              )
            ],
          ),
        ),
        const ThickLine(),
      ],
    );
  }
}
