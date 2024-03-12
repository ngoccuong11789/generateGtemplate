import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookBloc.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookEvent.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookService.dart';
import 'package:shared_module/common_widgets/CurrencyWidget.dart';
import 'package:shared_module/common_widgets/orange_button.dart';
import 'package:shared_module/features/checkout/blocs/checkout_bloc.dart';
import 'package:shared_module/features/checkout/model/check_out_model.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';
import 'package:shared_module/features/checkout/view/success.dart';
import 'package:shared_module/features/checkout/view/widgets/payment_detail.dart';
import 'package:shared_module/features/checkout/view/widgets/select_address.dart';
import 'package:shared_module/features/checkout/view/widgets/product_item.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/my_cart/view/my_cart_screen.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/ecommerce_and_food_payment_util.dart';

import '../../AddressBook/model/AddressNewModel.dart';

class Checkout extends StatefulWidget {
  final List<EntityDtos> data;
  final num? price;
  final num? discount;
  final num? deliveryFee;
  final List<CheckVoucherShop>? checkVoucherShop;
  final int? countAllItem;
  final BuildContext context;
  final BUYTYPE buyType;
  final List<ItemVoucherShipping>? listSelectVoucherShipping;
  final List<ItemVoucherShop>? listSelectVoucher;

  const Checkout({
    super.key,
    required this.data,
    this.price,
    this.discount,
    this.deliveryFee,
    this.countAllItem,
    this.checkVoucherShop,
    required this.context,
    required this.buyType,
    this.toHome,
    this.toOrder, this.listSelectVoucherShipping, this.listSelectVoucher,
  });

  final VoidCallback? toHome;
  final VoidCallback? toOrder;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  Map<String, String> note = {};
  bool isEnabled = true;
  Map<String, bool> invoices = {};
  Map<String, ItemShipment> shippingCode = {};
  late CheckoutBloc bloc =
      CheckoutBloc(service: AddressBookService(SharedModule.appDelegates!.dio));
  List<CheckOutItemModel> filterData = [];
  List<ItemInShops> listItem = [];
  List<ObjectDtOs> listItemProduct = [];
  late List<String> voucherIdsValue;

  @override
  void initState() {
    super.initState();
    _initStripePayment();
  }

  void _initStripePayment() async {
    Stripe.publishableKey =
        SharedModule.appDelegates!.config.stripePublishableKey;
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
  }

  void updateNote(String idShop, String contentValue) {
    note[idShop] = contentValue;
  }

  void updateInvoices(String idShop, bool contentValue) {
    invoices[idShop] = contentValue;
  }

  void updateShippingCode(String idShop, ItemShipment contentValue) {
    bloc.add(SetPriceDelivery(item: contentValue, listSelectVoucherShipping: widget.listSelectVoucherShipping ?? [], shopId: idShop));
    bloc.add(SetDefaultShipment(dataShop: widget.data, shippingCode: shippingCode));
    shippingCode[idShop] = contentValue;
  }

  bool validationOrder() {
    return (bloc.state.addressSelected?.id != null) && (bloc.state.isCompareTotalShipmentSelected && isEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar:
          MainAppBar(titleAppbar: SharedLocalizations.of(context)!.checkOut),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CheckoutBloc>(
              create: (context) => bloc),
          BlocProvider<AddressBookBloc>(
              create: (context) => AddressBookBloc()..add(GetAddressList())),
        ],
        child: Builder(
          builder: (context) {
            AddressNewModel? address =
                context.watch<AddressBookBloc>().state.selectedAddress;
            if (address?.id != null) {
              bloc.add(SetDefaultAddress(address: address!));
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SelectAddress(bloc: bloc, data: widget.data,),
                        Column(
                          children: [
                            ...widget.data.map((e) {
                              return ProductItem(
                                data: e,
                                listSelectVoucher: widget.listSelectVoucher,
                                listSelectVoucherShipping:
                                    widget.listSelectVoucherShipping,
                                bloc: bloc,
                                address: address,
                                price: widget.price!,
                                onGetNote: (newValue) {
                                  updateNote(e.id ?? '', newValue);
                                },
                                shippingCode: (newValue) {
                                  updateShippingCode(e.id ?? '', newValue);
                                },
                                onGetElectronic: (newValue) {
                                  updateInvoices(e.id ?? '', newValue);
                                },
                              );
                            }).toList(),
                          ],
                        ),
                        BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              return PaymentDetail(
                                price: widget.price,
                                discount: widget.discount,
                                deliveryFee: state.deliveryFee,
                                deliveryDiscount: state.deliveryDiscount,
                              );
                            }),
                        const Padding(padding: EdgeInsets.all(8.0)),
                      ],
                    ),
                  ),
                ),
                bottomBarWidget(context)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget bottomBarWidget(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) async {
        if (state.token != '') {
          final result =
              await EcommerceAndFoodPaymentUtils.start(context, state.token);
          if (result.status == EcommerceAndFoodPaymentStatus.success) {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<CheckoutBloc>(context),
                      child: SuccessScreen(
                        deliveryDiscount: state.deliveryDiscount,
                        deliveryFee: state.deliveryFee,
                        discounts: state.totalDiscount,
                        price: state.priceProducts,
                        data: widget.data,
                        toOrder: () => widget.toOrder?.call(),
                        toHome: () => widget.toHome?.call(),
                      ),
                    );
                  },
                ),
              );
          }
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  SharedLocalizations.of(context)!.total,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Currency(
                      value: (widget.price ?? 0) - (widget.discount ?? 0) + state.deliveryFee - state.deliveryDiscount,
                      name: "USD",
                      lineThrough: false,
                      prePromotionPrice: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Opacity(
                        opacity: validationOrder() ? 1 : 0.5,
                        child: OrangeButton(
                          '${SharedLocalizations.of(context)!.checkout}(${widget.countAllItem})',
                          onPressed: () async {
                            if (validationOrder()) {
                              if (isEnabled) {
                                setState(() {
                                  isEnabled = false;
                                });
                                bloc.add(ActionCheckOut(
                                  buyType: widget.buyType,
                                  addressId: bloc.state.addressSelected?.id ?? "",
                                  shop: widget.data,
                                  context: context,
                                  note: note,
                                  listSelectVoucherShipping:
                                  widget.listSelectVoucherShipping ?? [],
                                  listSelectVoucher: widget.listSelectVoucher ?? [],
                                  shippingCode: shippingCode,
                                  invoices: invoices,
                                ));
                              }
                            }
                          },
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

enum StatusCheckOut { SUCCESS, FAILED }
