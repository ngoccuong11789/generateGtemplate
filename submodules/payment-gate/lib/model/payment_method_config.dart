class PaymentMethodConfig {
  bool get isEnabled => true;

  PaymentMethodConfig();

  factory PaymentMethodConfig.disabled() = DisabledPaymentMethodConfig;
}

class DisabledPaymentMethodConfig extends PaymentMethodConfig {
  @override
  bool get isEnabled => false;
}
