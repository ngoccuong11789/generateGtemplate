import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'payment_gate_method_channel.dart';

abstract class PaymentGatePlatform extends PlatformInterface {
  /// Constructs a PaymentGatePlatform.
  PaymentGatePlatform() : super(token: _token);

  static final Object _token = Object();

  static PaymentGatePlatform _instance = MethodChannelPaymentGate();

  /// The default instance of [PaymentGatePlatform] to use.
  ///
  /// Defaults to [MethodChannelPaymentGate].
  static PaymentGatePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PaymentGatePlatform] when
  /// they register themselves.
  static set instance(PaymentGatePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
