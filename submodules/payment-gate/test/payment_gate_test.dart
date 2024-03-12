import 'package:flutter_test/flutter_test.dart';
import 'package:payment_gate/payment_gate.dart';
import 'package:payment_gate/payment_gate_platform_interface.dart';
import 'package:payment_gate/payment_gate_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPaymentGatePlatform
    with MockPlatformInterfaceMixin
    implements PaymentGatePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PaymentGatePlatform initialPlatform = PaymentGatePlatform.instance;

  test('$MethodChannelPaymentGate is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPaymentGate>());
  });

  test('getPlatformVersion', () async {
    PaymentGate paymentGatePlugin = PaymentGate();
    MockPaymentGatePlatform fakePlatform = MockPaymentGatePlatform();
    PaymentGatePlatform.instance = fakePlatform;

    expect(await paymentGatePlugin.getPlatformVersion(), '42');
  });
}
