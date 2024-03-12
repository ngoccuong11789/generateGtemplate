import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/my_cart/blocs/my_cart_bloc.dart';
import 'package:shared_module/features/my_cart/view/my_cart_screen.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/common_widgets/orange_button.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar(
      {super.key,
      required this.buyType,
      this.toShop,
      this.toOrder,
      this.toVoucher});

  final BUYTYPE buyType;
  final Function(String shopId)? toShop;
  final VoidCallback? toOrder;
  final VoidCallback? toVoucher;

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            MyCartBloc()..add(GetDataMyCart(buyType: widget.buyType)),
        child:
            BlocBuilder<MyCartBloc, GetMyCartState>(builder: (context, state) {
          return Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: OrangeButton(
                    "${SharedLocalizations.of(context)!.goToCart} (${context.watch<MyCartBloc>().state.data?.totalItems as int? ?? 0})",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MyCartPage(
                            toVoucher: widget.toVoucher,
                            toShop: widget.toShop,
                            toOrder: widget.toOrder,
                            toHome: () {
                              int count = 0;
                              Navigator.popUntil(context, (route) {
                                return count++ == 3;
                              });
                            },
                            buytype: widget.buyType,
                          );
                        },
                      ));
                    },
                  ),
                ),
              ),
            ]),
          );
        }));
  }
}
