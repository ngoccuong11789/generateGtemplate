import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/common_widgets/line.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/show_modal.dart';
import 'package:shared_module/features/buy_now/buy_now.dart';
import 'package:shared_module/features/checkout/view/checkout.dart';
import 'package:shared_module/features/my_cart/api/my_cart_controller.dart';
import 'package:shared_module/features/my_cart/blocs/my_cart_bloc.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart'
    as cart_response;
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/common_widgets/AlertDialog.dart';
import 'package:shared_module/common_widgets/orange_button.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/share_to_feed/model/ProductDetail.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/features/vouchers/view/voucher_screen.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class MyCartPage extends StatefulWidget {
  const MyCartPage(
      {super.key,
      this.toShop,
      this.toVoucher,
      this.toHome,
      this.toOrder,
      required this.buytype});

  final BUYTYPE buytype;
  final Function(String shopId)? toShop;
  final VoidCallback? toVoucher;
  final VoidCallback? toHome;
  final VoidCallback? toOrder;

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final MyCartBloc bloc = MyCartBloc();
  num discountValue = 0;

  void getDiscount(List<ItemVoucherShop> list, List<ItemVoucherShipping> listShipping) {
    bloc.add(UpdateDiscount(list: list, listShipping: listShipping));
  }

  void reloadMyCart(CartRequest dto, String orderId) {
    bloc.add(UpdateCartById(
        quantity: dto.quantity ?? 0,
        productId: dto.objectId ?? '',
        stockId: dto.stockId ?? '',
        type: UpdateCartByIdType.variation,
        shopId: dto.entityId ?? '',
        id: orderId));
  }

  @override
  void initState() {
    bloc.add(GetDataMyCart(buyType: widget.buytype,));
    super.initState();
  }

  void unVisible() {
    Navigator.pop(context);
  }

  bool checkSelected(Set<String> selectedShops, Set<String> selectedProducts, EntityDtos data) {
    if (selectedShops.contains(data.id)) {
      return true;
    } else {
      for (ObjectDtOs i in (data.objectDTOs ?? [])) {
        if (selectedProducts.contains(i.stockId)) {
          return true;
        }
      }
      return false;
    }
  }

  bool isEnabled() {
    return bloc.state.selectedProducts.isNotEmpty;
  }

  void onNavigator(List<DataItemShopVoucher> data, List<DataItemVoucher> dataShipping, num price, String shopId) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ShopVouchersScreen(
          dataVoucher: data,
          dataShippingVoucher: dataShipping,
          price: price,
          onDiscount: getDiscount,
          shopId: shopId,
          listSelectVoucher: bloc.state.listVoucherSelect,
          listSelectVoucherShipping: bloc.state.listVoucherSelectShipping,
        );
      },
    ));
  }

  void onCheckoutCart(List<cart_response.EntityDtos> data) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return Checkout(
            buyType: widget.buytype,
            toOrder: widget.toOrder,
            toHome: widget.toHome,
            checkVoucherShop: bloc.state.checkVoucherShop,
            context: context,
            data: data,
            listSelectVoucher: bloc.state.listVoucherSelect,
            listSelectVoucherShipping: bloc.state.listVoucherSelectShipping,
            price: bloc.state.price,
            discount: bloc.state.discount,
            deliveryFee: bloc.state.deliveryFee,
            countAllItem: bloc.state.selectedItemCount,);
      },
    ));
  }

  List<cart_response.EntityDtos> _getSelectedProductWithShop(
      GetMyCartState state) {
    List<cart_response.EntityDtos> result = [];
    for (final shop in state.shops) {
      final List<cart_response.ObjectDtOs> selectedProducts = [];
      for (final cart_response.ObjectDtOs product in shop.objectDTOs ?? []) {
        if (state.selectedProducts.contains(product.stockId)) {
          selectedProducts.add(product);
        }
      }
      if (selectedProducts.isNotEmpty) {
        shop.objectDTOs = selectedProducts;
        result.add(shop);
      }
    }
    return result;
  }

  Future<ProductDetail> fetchProduct(String productId) async {
    return MyCartController(SharedModule.appDelegates!.dio).fetchProduct(productId);
  }

  @override
  Widget build(BuildContext context) {
    Widget checkAllProduct() {
      var checkbox = Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: BlocSelector<MyCartBloc, GetMyCartState, bool>(
          selector: (state) => state.isSelectedAll,
          builder: (context, isSelectedAll) {
            return Checkbox(
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
                activeColor: ColorPalette.primary50,
                checkColor: ColorPalette.primary600,
                value: isSelectedAll,
                onChanged: (value) => {
                      bloc.add(CheckAll(isCheck: isSelectedAll),),
                    });
          },
        ),
      );
      return Container(
        height: 40,
        color: Colors.white,
        child: Row(
          children: [
            checkbox,
            Text(SharedLocalizations.of(context)!.allProducts,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),),
          ],
        ),
      );
    }

    Widget bodyBottomSheet(onFunction, bool isShowDetail, int total) {
      var totalBottom = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(SharedLocalizations.of(context)!.total,
                  style: CommonTextStyle.textMm500),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Currency(
                      name: "USD",
                      value: bloc.state.price - bloc.state.discount,
                      lineThrough: false,
                      prePromotionPrice: false,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        onFunction();
                      }, // Handle your callback
                      child: Ink(
                          height: 20,
                          width: 20,
                          child: isShowDetail
                              ? package
                                  .createSvgFromAsset(AssetHelper.downMyCart)
                              : package
                                  .createSvgFromAsset(AssetHelper.upChevron)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Opacity(
                opacity: isEnabled() ? 1 : 0.5,
                child: OrangeButton(
                  SharedLocalizations.of(context)!
                      .checkoutGetItem(bloc.state.selectedItemCount),
                  onPressed: () {
                    if (isEnabled()) {
                      List<cart_response.EntityDtos> selectedProductWithShop =
                      _getSelectedProductWithShop(bloc.state);
                      onCheckoutCart(selectedProductWithShop);
                    }
                  },
                ),
              )
            ),
          ),
        ]),
      );

      return totalBottom;
    }

    void onShowBottomSheet() {
      var paymentDetail = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(SharedLocalizations.of(context)!.subtotal,
                          style: const TextStyle(
                            color: Color(0xFF667084),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(SharedLocalizations.of(context)!
                            .priceCheckOut(bloc.state.price, "USD"))))
              ],
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(SharedLocalizations.of(context)!.discounts,
                          style: const TextStyle(
                            color: Color(0xFF667084),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text('-${SharedLocalizations.of(context)!
                            .priceCheckOut(bloc.state.discount, "USD")}')))
              ],
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(SharedLocalizations.of(context)!.deliveryFee,
                          style: const TextStyle(
                            color: Color(0xFF667084),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(SharedLocalizations.of(context)!
                            .priceCheckOut(bloc.state.deliveryFee, "USD"))))
              ],
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(SharedLocalizations.of(context)!.deliveryDiscount,
                        style: const TextStyle(
                          color: Color(0xFF667084),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(SharedLocalizations.of(context)!
                            .priceCheckOut(bloc.state.deliveryFee, "USD"))))
              ],
            ),
          ],
        ),
      );

      var totalAndNavigation = Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 2, color: ColorPalette.gray200), // Bottom border
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(SharedLocalizations.of(context)!.total,
                    style: CommonTextStyle.titleText16),
                Text(
                    SharedLocalizations.of(context)!
                        .priceCheckOut(bloc.state.price - bloc.state.discount, "USD"),
                    style: CommonTextStyle.titleText16700)
              ],
            ),
          ),
          bodyBottomSheet(unVisible, false, 9555)
        ],
      );

      showCommonBottomSheet(
        context: context,
        height: 350, //todo 380
        builder: (BuildContext context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [paymentDetail, totalAndNavigation]);
        },
      );
    }

    Widget genderShop() {
      var textNull = const TextSpan(
        text: ' ',
        style: TextStyle(
          color: Color(0xFF344053),
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.60,
        ),
      );

      Widget valueQuantity(int value) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  color: Color(0xFF475466),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                ),
              ),
            ],
          ),
        );
      }

      shopVoucher(EntityDtos e, Set<String> selectedShops, Set<String> selectedProducts) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: checkSelected(selectedShops, selectedProducts, e) ? const Color(0xFFFFF3ED) : const Color(0xFFFFF3ED).withOpacity(0.5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton.icon(
                  onPressed: () {
                    checkSelected(selectedShops, selectedProducts, e)
                        ? {
                            bloc.add(GetVoucher(shop: e, onEvent: onNavigator)),
                          }
                        : ();
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: package.createSvgFromAsset(
                      "assets/icons/voucherIcon.svg",
                      colorFilter: ColorFilter.mode(
                          checkSelected(selectedShops, selectedProducts, e) ? const Color(0xFFFE692D) : const Color(0xFFFE692D).withOpacity(0.5),
                          BlendMode.srcIn)),
                  label: Text(SharedLocalizations.of(context)!.selectVouchers,
                      style: TextStyle(
                          fontSize: 14,
                          color: checkSelected(selectedShops, selectedProducts, e) ? const Color(0xFFFE692D) : const Color(0xFFFE692D).withOpacity(0.5),
                          fontWeight: FontWeight.w600)),
                ))
          ]),
        );
      }

      return BlocBuilder<MyCartBloc, GetMyCartState>(builder: (context, state) {
        Widget shopCheck(cart_response.EntityDtos e) {
          return Container(
            height: 48,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: Checkbox(
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
                          activeColor: ColorPalette.primary50,
                          checkColor: ColorPalette.primary600,
                          value: state.selectedShops.contains(e.id),
                          onChanged: (value) => {
                            bloc.add(CheckShopItem(
                              isCheck: state.selectedShops.contains(e.id),
                              idShop: e.id!,
                            ))
                          }),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(3.0),
                      child: ClipOval(
                        child: CachedNetworkImage(
                            imageUrl: getImageById(
                                e.avatar?.id ?? "", ImageType.mobile),
                            errorWidget: (BuildContext context, String url,
                                Object exception) {
                              return package
                                  .createSvgFromAsset(AssetHelper.shopDefault);
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        e.name ?? SharedLocalizations.of(context)!.noData,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Color(0xFF344053),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      if (widget.toShop != null) {
                        widget.toShop!(e.id!);
                      }
                    },
                    child: Row(
                      children: [
                        Text(SharedLocalizations.of(context)!.visitShop,
                          style: const TextStyle(
                            color: Color(0xFF175CD3),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),),
                        package.createSvgFromAsset(AssetHelper.nextIcon)
                      ],
                    )),
              ],
            ),
          );
        }

        return Column(
          children: [
            ...state.shops.asMap().entries.map((value) {
              var e = value.value;
              Widget checkboxItem(cart_response.ObjectDtOs item) {
                return Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  child: Checkbox(
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
                      activeColor: ColorPalette.primary50,
                      checkColor: ColorPalette.primary600,
                      value: state.selectedProducts.contains(item.stockId),
                      onChanged: (value) => {
                            bloc.add(CheckProductInShop(
                                isCheck: state.selectedProducts
                                    .contains(item.stockId),
                                idShop: e.id!,
                                idStock: item.stockId!)),
                          }),
                );
              }

              Widget imageProduct(cart_response.ObjectDtOs item) {
                return Container(
                  width: 64,
                  height: 64,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(getImageById(
                          item.avatar?.id ?? '', ImageType.mobile)),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFEAECF0)),
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

              Widget infoProduct(cart_response.ObjectDtOs item,
                  cart_response.EntityDtos shop) {
                Widget variation() {
                  return Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: SharedLocalizations.of(context)!
                                  .variationProduct,
                              style: const TextStyle(
                                color: Color(0xFF475466),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                            textNull,
                            item.stockDetail?.variationFirstName != null
                                ? TextSpan(
                                    text:
                                        '${item.stockDetail!.variationFirstName}',
                                    style: const TextStyle(
                                      color: Color(0xFF344053),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
                                    ),
                                  )
                                : textNull,
                            item.stockDetail?.variationSecondName != null
                                ? TextSpan(
                                    text:
                                        '/${item.stockDetail!.variationSecondName}',
                                    style: const TextStyle(
                                      color: Color(0xFF344053),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
                                    ),
                                  )
                                : textNull,
                          ],
                        ),
                      ),
                      FutureBuilder<ProductDetail>(
                          future: fetchProduct(item.objectId ?? ''),
                          builder: (context, snapshot) {
                            bool haveProduct = !(snapshot.connectionState ==
                                    ConnectionState.waiting) &&
                                !snapshot.hasError;
                            return GestureDetector(
                              onTap: () {
                                if (haveProduct) {
                                  ShowModal.modal(
                                      context: context,
                                      bodyModal: AddToCart<ProductDetail>(
                                        product: snapshot.data!,
                                        isMyCart: true,
                                        quantity: (item.quantity ?? 0),
                                        stockSelected: item.stockDetail,
                                        buyNow: false,
                                        reloadMyCart: (newValue) {
                                          reloadMyCart(newValue, item.id ?? '');
                                        },
                                        buytype: BUYTYPE.ecommerce,
                                        toOrder: () {},
                                      ));
                                }
                              },
                              child: const icon.SoctripIcon(
                                icon.Icons.chevronDown,
                                style: TextStyle(
                                    color: ColorPalette.appBarIcon,
                                    fontSize: 16.0),
                              ),
                            );
                          }),
                    ],
                  );
                }

                Widget priceProduct() {
                  return Row(
                    children: [
                      Currency(
                          value: item.stockDetail?.price ?? 0,
                          lineThrough: false,
                          prePromotionPrice: false,
                          name: "USD"),
                      Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Currency(
                              value: item.stockDetail?.originalPrice ?? 0,
                              lineThrough: true,
                              name: "USD")),
                    ],
                  );
                }

                Widget handleQuantity() {
                  Widget genButton(
                      String path,
                      TypeInput type,
                      cart_response.ObjectDtOs e,
                      cart_response.EntityDtos shop) {
                    return GestureDetector(
                      onTap: () {
                        switch (type) {
                          case TypeInput.delete:
                            bloc.add(DeleteItemCart(
                                id: e.id ?? "", stockId: e.stockId ?? ''));
                            break;
                          case TypeInput.increment:
                            bloc.add(UpdateCartById(
                                quantity: e.quantity?.toInt() ?? 0,
                                productId: e.objectId ?? "",
                                shopId: shop.id ?? "",
                                stockId: e.stockId ?? "",
                                id: e.id ?? "", type: UpdateCartByIdType.increment));
                            break;
                          case TypeInput.decrement:
                            if (e.quantity?.toInt() == 1) {
                              showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return CustomAlertDialog(
                                      title: SharedLocalizations.of(context)!
                                          .titleDeleteItem,
                                      description:
                                          SharedLocalizations.of(context)!
                                              .descriptionDeleteItem,
                                      onActionNo: () {
                                        Navigator.pop(context);
                                      },
                                      onPressed: () {
                                        bloc.add(DeleteItemCart(
                                            id: e.id ?? "",
                                            stockId: e.stockId ?? ''));
                                        Navigator.pop(context);
                                      });
                                },
                              );
                            } else {
                              bloc.add(UpdateCartById(
                                  quantity: e.quantity?.toInt() ?? 0,
                                  productId: e.objectId ?? "",
                                  shopId: shop.id ?? "",
                                  stockId: e.stockId ?? "",
                                  id: e.id ?? "", type: UpdateCartByIdType.decrement));
                            }
                            break;
                        }
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        padding: const EdgeInsets.all(6),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: Stack(children: [
                                package.createSvgFromAsset(
                                  path,
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    child: Row(
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0xFFEAECF0)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Row(
                            children: [
                              genButton(AssetHelper.minus, TypeInput.decrement,
                                  item, shop),
                              valueQuantity(item.quantity?.toInt() ?? 0),
                              genButton(AssetHelper.plus, TypeInput.increment,
                                  item, shop),
                              const SizedBox(
                                width: 5,
                              ),
                              genButton(AssetHelper.trash, TypeInput.delete,
                                  item, shop),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Flexible(
                    child: Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  height: 100,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.name ?? SharedLocalizations.of(context)!.noData,
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
                      variation(),
                      const SizedBox(height: 2),
                      priceProduct(),
                      const SizedBox(height: 2),
                      handleQuantity()
                    ],
                  ),
                ));
              }

              if ((e.objectDTOs ?? []).isNotEmpty) {
                return Column(
                  children: [
                    shopCheck(e),
                    const ThinLine(),
                    const SizedBox(height: 16,),
                    Column(
                      children: [
                        ...(e.objectDTOs ?? []).map((item) {
                          return Container(
                              padding: EdgeInsets.only(
                                  bottom: item == e.objectDTOs?.last ? 0.0 : 20.0 , right: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  checkboxItem(item),
                                  imageProduct(item),
                                  infoProduct(item, e),
                                ],
                              ));
                        }),
                      ],
                    ),
                    const ThinLine(),
                    BlocBuilder<MyCartBloc, GetMyCartState>(
                        builder: (context, state) {
                      return shopVoucher(
                          e, state.selectedShops, state.selectedProducts);
                    }),
                    Container(
                      height: 10,
                      color: ColorPalette.gray100,
                    )
                  ],
                );
              } else {
                return Container();
              }
            }),
          ],
        );
      });
    }

    var loading = Container(
      color: Colors.white,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              SharedLocalizations.of(context)!.loading,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFF0F1728),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );

    Widget emptyCart() =>
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: package.createSvgFromAsset(AssetHelper.emptyCart,
                  width: 180.0, height: 180.0),
            ),
            const SizedBox(height: 16.0,),
            Text(
              SharedLocalizations.of(context)!.emptyCart,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF101828),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              SharedLocalizations.of(context)!.descriptionEmptyCart,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF344054),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16.0,),
            PrimaryButton(SharedLocalizations.of(context)!.continueShopping,
                onPressed: () {
                  int count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 1;
                  });
                })
          ],
        );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MainAppBar(
          titleAppbar: SharedLocalizations.of(context)!.myCart,
        ),
        body: BlocProvider(
            create: (context) => bloc,
            child: BlocBuilder<MyCartBloc, GetMyCartState>(
                builder: (context, state) {
              switch (state.status) {
                case MyCartStatus.init:
                  return loading;
                case MyCartStatus.waiting:
                case MyCartStatus.success:
                  return Column(children: [
                    Expanded(
                        child: bloc.state.shops.isNotEmpty
                            ? GestureDetector(
                          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                          child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      checkAllProduct(),
                                      const ThinLine(),
                                      genderShop()],
                                  ),
                                ],
                              )),
                        )
                            : emptyCart()),
                    bodyBottomSheet(onShowBottomSheet, true, 0)
                  ]);
                case MyCartStatus.fail:
                  return Center(
                    child: Text(
                      SharedLocalizations.of(context)!.error,
                      style: const TextStyle(
                        color: Color(0xFFFF4305),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                  );
              }
            })));
  }
}

enum TypeInput { increment, decrement, delete }

class CheckVoucherShop {
  final String shopId;
  late String voucherId;

  CheckVoucherShop({required this.shopId, required this.voucherId});

  @override
  String toString() {
    return 'CheckVoucherShop{shopId: $shopId, voucherId: $voucherId}';
  }
}