
import 'package:payment_gate/model/payment_method_config.dart';

class StripeConfig extends PaymentMethodConfig {
  final String publishableKey;

  StripeConfig({required this.publishableKey});
}