import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/default_text.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/features/vouchers/bloc/shop_voucher_bloc.dart';
import 'package:shared_module/features/vouchers/itemVoucher/item_shipping_voucher.dart';
import 'package:shared_module/features/vouchers/itemVoucher/item_voucher.dart';
import 'package:shared_module/features/vouchers/model/item_voucher.dart';
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/package_util.dart';

class ShopVouchersScreen extends StatefulWidget {
  final num? price;
  final String? shopId;
  final List<DataItemShopVoucher>? dataVoucher;
  final List<DataItemVoucher>? dataShippingVoucher;
  final void Function(List<ItemVoucherShop>, List<ItemVoucherShipping>)? onDiscount;
  final List<ItemVoucherShop>? listSelectVoucher;
  final List<ItemVoucherShipping>? listSelectVoucherShipping;

  const ShopVouchersScreen(
      {super.key,
      this.price,
      this.shopId,
      this.onDiscount,
      this.dataVoucher,
      this.listSelectVoucher,
      this.listSelectVoucherShipping,
      this.dataShippingVoucher});

  @override
  State<ShopVouchersScreen> createState() => _ShopVouchersScreenState();
}

class _ShopVouchersScreenState extends State<ShopVouchersScreen> {
  final ShopVoucherBloc bloc = ShopVoucherBloc();

  @override
  void initState() {
    bloc.add(SetData(
        data: widget.dataVoucher, dataShipping: widget.dataShippingVoucher, list: widget.listSelectVoucher, listShipping: widget.listSelectVoucherShipping, price: widget.price ?? 0));
    super.initState();
  }

  void calculatorDiscount(List<ItemVoucherShop> list, List<ItemVoucherShipping> listShipping) {
    widget.onDiscount!(list, listShipping);
  }

  void checkItemVoucher(DataItemShopVoucher value, String shopId) {
    bloc.add(SelectItemVouchers(value: value, shopId: shopId, price: widget.price ?? 0));
  }

  void checkItemShippingVoucher(DataItemVoucher value, String shopId) {
    bloc.add(SelectItemShippingVouchers(value: value, shopId: shopId));
  }

  Widget emptyData(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: package.createSvgFromAsset(AssetHelper.emptyVouchersIcon,
              width: 150.0, height: 150.0),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF101828),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          SharedLocalizations.of(context)!.descriptionNoVoucher,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget shopVoucher(List<DataItemShopVoucher> data) {
      return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(SharedLocalizations.of(context)!.shopVouchers,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ),
          const Padding(padding: EdgeInsets.all(4.0)),
          data.isNotEmpty
              ? Column(
                  children: [
                    ...data.asMap().entries.map((e) => GestureDetector(
                          onTap: () {
                            e.value.isVisible
                                ? checkItemVoucher(e.value, widget.shopId ?? '' )
                                : ();
                          },
                          child: ItemShopVouchers(
                            onData: () {
                              e.value.isVisible
                                  ? checkItemVoucher(e.value, widget.shopId ?? '')
                                  : ();
                            },
                            dataItemVoucher: e.value,
                            price: widget.price ?? 0,
                          ),
                        ))
                  ],
                )
              : emptyData(SharedLocalizations.of(context)!.noShopVoucher)
        ],
      );
    }

    Widget shippingVoucher(List<DataItemVoucher> data) {
      return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(SharedLocalizations.of(context)!.shippingVouchers,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ),
          const Padding(padding: EdgeInsets.all(4.0)),
          data.isNotEmpty
              ? Column(
                  children: [
                    ...data.asMap().entries.map((e) => GestureDetector(
                          onTap: () {
                            e.value.isVisible
                                ? checkItemShippingVoucher(e.value, widget.shopId ?? '')
                                : ();
                          },
                          child: ItemShippingVouchers(
                            onData: () {
                              e.value.isVisible
                                  ? checkItemShippingVoucher(e.value, widget.shopId ?? '')
                                  : ();
                            },
                            dataItemVoucher: e.value,
                            price: widget.price ?? 0,
                            shopId: widget.shopId ?? ''
                          ),
                        ))
                  ],
                )
              : emptyData(SharedLocalizations.of(context)!.noShippingVoucher)
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          toolbarHeight: 60,
          automaticallyImplyLeading: true,
          titleTextStyle: CommonTextStyle.title,
          centerTitle: true,
          flexibleSpace: Image.asset(
            AssetHelper.appBarBackground,
            package: packageName,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          title: DefaultTitleText(SharedLocalizations.of(context)!.voucher),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
          child: PrimaryButton(
            SharedLocalizations.of(context)!.confirm,
            onPressed: () {
              bloc.add(CalculatorDiscount(
                  price: widget.price,
                  onData: calculatorDiscount));
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocProvider(
                create: (context) => bloc,
                child: BlocBuilder<ShopVoucherBloc, ShopVoucherState>(
                    builder: (context, state) {
                  return SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shopVoucher(state.data ?? []),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: const Divider(
                          height: 1,
                          color: ColorPalette.gray200,
                        ),
                      ),
                      shippingVoucher(state.dataShipping ?? [])
                    ],
                  ));
                }))));
  }
}

enum TypeSelect { SHOPVOUCHERS, ALL }
