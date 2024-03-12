import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/common_widgets/common_info_popup.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/buy_now/bloc/variants_bloc.dart';
import 'package:shared_module/features/buy_now/widgets/product_info.dart';
import 'package:shared_module/features/buy_now/widgets/quantity.dart';
import 'package:shared_module/features/buy_now/widgets/variant_group.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/my_cart/view/my_cart_screen.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class AddToCart<T> extends StatefulWidget {
  const AddToCart({super.key,
    this.isMyCart = false,
    this.reloadMyCart,
    this.quantity,
    this.stockSelected,
    required this.product,
    required this.buyNow,
    required this.toOrder,
    required this.buytype});

  final T product;
  final bool buyNow;
  final bool? isMyCart;
  final StockDetail? stockSelected;
  final num? quantity;
  final BUYTYPE buytype;
  final void Function(CartRequest)? reloadMyCart;
  final VoidCallback? toOrder;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int numberOfVariants = 0;

  @override
  void initState() {
    numberOfVariants = widget.product.prices?.length ?? 0;
    super.initState();
  }

  Widget _blocProviderWithAddedToCardListener(
      {required BuildContext context, required Widget child}) {
    return BlocProvider(
        create: (context) => VariantsBloc(widget.toOrder)
          ..add(SetProductEvent(widget.product, widget.buytype)),
        child: BlocListener<VariantsBloc, VariantsState>(
          listener: (context, state) {
            if (state.addedToCard) {
              _navigateToMyCart(context);
            }
          },
          child: child,
          listenWhen: (previousState, currentState) {
            return previousState.addedToCard != currentState.addedToCard;
          },
        ));
  }

  void _navigateToMyCart(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
        CommonInfoPopup(
            info: SharedLocalizations.of(context)!
                .addToCartSuccessfully(
                widget.product.name!)));0.toString();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return MyCartPage(
          buytype: widget.buytype == BUYTYPE.ecommerce ? BUYTYPE.ecommerce : BUYTYPE.food,
          toOrder: () {
            int count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 2;
            });
            GoRouter.of(context).push("/ecommerce/purchase-history");
          },
          toHome: () {
            int count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 4;
            });
          },
          toShop: (shopId) {
            int count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 1;
            });
            GoRouter.of(context).push("/ecommerce/shop/$shopId");
          },
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _blocProviderWithAddedToCardListener(
      context: context,
      child: BlocBuilder<VariantsBloc, VariantsState>(
        builder: (context, state) {
          var stock =  state.stocks?.quantity ?? state.product?.quantity ?? 0;
          return Column(
            children: [
              Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(SharedLocalizations.of(context)!.variantSelection,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  color: ColorPalette.gray900
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const icon.SoctripIcon(
                                icon.Icons.xClose,
                                style: TextStyle(color: ColorPalette.gray500, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProductInfo(
                        product: widget.product,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: ColorPalette.greyBorderLine,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      numberOfVariants > 0
                          ? VariantGroup(
                        isMyCart: widget.isMyCart,
                        stockIdSelected: widget.stockSelected?.variationFirstId ?? '',
                        product: widget.product,
                        index: 0,
                      )
                          : Container(),
                      numberOfVariants > 1
                          ? VariantGroup(
                        isMyCart: widget.isMyCart,
                        stockIdSelected: widget.stockSelected?.variationSecondId ?? '',
                        product: widget.product,
                        index: 1,
                      )
                          : Container(),
                      Quantity(quantity: widget.quantity,),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: ColorPalette.gray200,
                      width: 1
                    )
                  )
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: (widget.isMyCart == false) ?
                  widget.buyNow
                      ? PrimaryButton(
                    SharedLocalizations.of(context)!.buyNow,
                    color: stock == 0 ? ColorPalette.primary200 : ColorPalette.primary,
                    onPressed: stock == 0 ? null : () {
                      context
                          .read<VariantsBloc>()
                          .add(AddToCartEvent(isBuyNow: widget.buyNow));
                    },
                  )
                      : PrimaryButton(
                    SharedLocalizations.of(context)!.addToCart,
                    color: stock == 0 ? ColorPalette.primary200 : ColorPalette.primary,
                    onPressed: stock == 0 ? null : () {
                      context
                          .read<VariantsBloc>()
                          .add(AddToCartEvent(isBuyNow: widget.buyNow));
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                          CommonInfoPopup(
                              info: SharedLocalizations.of(context)!
                                  .addToCartSuccessfully(
                                  widget.product.name!)));
                    },
                  ) : PrimaryButton(
                    SharedLocalizations.of(context)!.confirm,
                    color: stock == 0 ? ColorPalette.primary200 : ColorPalette.primary,
                    onPressed: stock == 0 ? null : () {
                      CartRequest dto = CartRequest(
                        quantity: state.quantity as int?,
                        entityId: state.product?.shop?.id,
                        objectType: "PRODUCT",
                        note: "",
                        objectId: state.product?.id,
                        stockId: state.stocks?.id,
                      );
                      widget.reloadMyCart!(dto);
                      Navigator.of(context).pop();
                    },
                  )
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
