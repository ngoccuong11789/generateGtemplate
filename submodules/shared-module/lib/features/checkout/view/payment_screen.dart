import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_module/features/checkout/view/stripe_card_screen.dart';
import '../../../common_widgets/CurrencyWidget.dart';
import '../../../localization/shared_localizations.dart';
import '../../AddressBook/model/AddressNewModel.dart';
import 'loading_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key, this.address, this.price = 0, required this.payNow})
      : super(key: key);

  final AddressNewModel? address;
  final num? price;
  final Function(String token, String status) payNow;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final controller = CardEditController();

  @override
  void initState() {
    controller.addListener(update);
    super.initState();
  }

  void update() => setState(() {});

  @override
  void dispose() {
    controller.removeListener(update);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StripeCardScreen(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 15),
          child: Row(
            children: [
              Container(
                height: 23,
                width: 23,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/soctrip-logo.png'),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  SharedLocalizations.of(context)!.total,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Currency(
                value: widget.price ?? 0,
                name: "USD",
                lineThrough: false,
                prePromotionPrice: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CardField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(
            fontFamily: 'Inter',
          ),
          numberHintText: "5555555555554444",
        ),
        const SizedBox(height: 20),
        LoadingButton(
          text: 'Pay Now',
          onPressed: () async {
            if (controller.complete) {
              _handlePayPress(context).then((value) => Navigator.pop(context));
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }

  Future<void> _handlePayPress(BuildContext context) async {
    if (!controller.complete) {
      return;
    }
    try {
      var token = await Stripe.instance.createToken(
        CreateTokenParams.card(
          params: CardTokenParams(
            name: widget.address?.userFullName ?? "",
            address: Address(
              line1: widget.address?.address ?? "",
              line2: widget.address?.address ?? "",
              city: widget.address?.city ?? "",
              state: widget.address?.city ?? "",
              country: widget.address?.countryCode ?? "",
              postalCode: "900000",
            ),
            currency: "USD",
            type: TokenType.Card,
          ),
        ),
      );
      widget.payNow.call(token.id, "");
    } catch (e) {
      widget.payNow.call("", "payment_failed");
    }
  }
}
