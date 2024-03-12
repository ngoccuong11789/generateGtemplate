import 'package:payment_gate/enum/payment_method.dart';
import 'package:payment_gate/model/payment_method_config.dart';

typedef PaymentMethodConfigGenerator = PaymentMethodConfig? Function(
    PaymentMethod);

class PaymentGateConfig {
  final Map<PaymentMethod, PaymentMethodConfig> methodsConfig;
  final String paymentBaseUrl;

  const PaymentGateConfig(
      {required this.methodsConfig, required this.paymentBaseUrl});

  PaymentGateConfig.all(PaymentMethodConfigGenerator generator,
      this.paymentBaseUrl)
      : methodsConfig = PaymentMethod.values.asMap().map((key, method) =>
      MapEntry(method, generator(method) ?? PaymentMethodConfig()));

  Iterable<PaymentMethod> get availableMethods =>
      methodsConfig.keys.where((method) => methodsConfig[method]!.isEnabled);
}
