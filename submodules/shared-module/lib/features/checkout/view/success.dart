import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:shared_module/common_widgets/line.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/checkout/model/method_payment.dart';
import 'package:shared_module/features/my_cart/api/my_cart_controller.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/date_format.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:shared_module/utils/package_util.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({
    super.key,
    required this.deliveryFee,
    required this.toHome,
    required this.toOrder,
    required this.data,
    required this.discounts,
    required this.price,
    required this.deliveryDiscount
  });

  final VoidCallback toHome;
  final VoidCallback toOrder;
  final List<EntityDtos> data;
  final num discounts;
  final num price;
  final num deliveryFee;
  final num deliveryDiscount;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  var codeOrder = '#123456789';
  late num totalLasted;

  @override
  void initState() {
    totalLasted = (widget.price - widget.discounts + widget.deliveryFee - widget.deliveryDiscount);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 61,
                height: 61,
                padding: const EdgeInsets.all(14),
                decoration: ShapeDecoration(
                  color: const Color(0xFFD0FADF),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFEBFDF2),
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: package.createSvgFromAsset(
                            "assets/icons/checkout-success.svg",
                            package: packageName)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                SharedLocalizations.of(context)!.checkoutSuccess,
                style: const TextStyle(
                  color: Color(0xFF1D2838),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.56,
                ),
              ),
            ],
          ));
    }

    Widget listItemProduct() {
      Widget imageProduct(ObjectDtOs e) {
        return Container(
          width: 64,
          height: 64,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  getImageById(e.avatar?.id ?? "", ImageType.mobile)),
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
        );
      }

      Widget infoProduct(ObjectDtOs e) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  e.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF344053),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
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
                    "${e.stockDetail?.variationFirstName}${e.stockDetail?.variationSecondName != null ? "/" : ""}${e.stockDetail?.variationSecondName ?? ""}",
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
              Text(
                'x${SharedLocalizations.of(context)!.compact(e.quantity ?? 0)}',
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ));
      }

      return Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            ...widget.data.map((e) {
              return Column(
                children: [
                  ...(e.objectDTOs ?? []).map((i) {
                    // delete item in cart when buy success
                    if (i.id != null) {
                      MyCartController(SharedModule.appDelegates!.dio)
                          .deleteItemCart(i.id!);
                    }

                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 64,
                                child: Row(
                                  children: [
                                    imageProduct(i),
                                    infoProduct(i),
                                  ],
                                ),
                              ),
                            ),
                            Currency(
                              name: "USD",
                              value: i.stockDetail?.price ?? 0,
                              lineThrough: false,
                              prePromotionPrice: true,
                              colorText: Colors.black,
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    );
                  })
                ],
              );
            })
          ],
        ),
      );
    }

    Widget paymentDetail() {
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
              value: widget.price,
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
                  value: widget.discounts,
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
              value: widget.deliveryFee,
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
                  value: widget.deliveryDiscount,
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
              value: totalLasted,
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

    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 94,
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 34.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SecondaryButton(
                  SharedLocalizations.of(context)!.myOrder,
                  onPressed: () {
                    widget.toOrder();
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 8.0)),
              Expanded(
                  child: PrimaryButton(
                SharedLocalizations.of(context)!.continueShopping,
                onPressed: () {
                  widget.toHome();
                },
              ))
            ],
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: Image.asset(
                          "assets/bg-page-check-out.png",
                          package: packageName,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title(),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          SharedLocalizations.of(context)!.trackOrder,
                          style: const TextStyle(
                            color: Color(0xFF344053),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.50,
                          ),
                        ),
                      ),
                      listItemProduct(),
                    ],
                  ),
                ),
                const ThinLine(),
                paymentDetail()
              ],
            )));
  }
}
