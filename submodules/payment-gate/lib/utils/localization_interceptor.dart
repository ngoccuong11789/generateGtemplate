import 'package:payment_gate/localization/payment_gate_translateable.dart';

typedef PaymentTranslatableInterceptor = PaymentGateTranslatableWrapper Function(
    PaymentGateTranslatable);

class PaymentGateTranslatableWrapper implements PaymentGateTranslatable {
  final PaymentGateTranslatable origin;

  PaymentGateTranslatableWrapper(this.origin);

  @override
  String get paymentMethod => origin.paymentMethod;

  @override
  String get cashOnDelivery => origin.cashOnDelivery;

  @override
  String get bankTransfer => origin.bankTransfer;

  @override
  String get creditCard => origin.creditCard;

  @override
  String get crypto => origin.crypto;
}
