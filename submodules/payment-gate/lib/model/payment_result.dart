
import 'package:payment_gate/const/strings.dart';
import 'package:payment_gate/enum/payment_status.dart';

class PaymentResult {
  PaymentStatus get status {
    final rawStatus = rawData[Strings.keyIsCallbackSuccess];
    if (rawStatus == "true") {
      return PaymentStatus.success;
    }
    return PaymentStatus.fail;
  }

  Map<String, String> rawData;

  PaymentResult.fromMap(Map<String, String>? map) : rawData = map ?? {};
}
