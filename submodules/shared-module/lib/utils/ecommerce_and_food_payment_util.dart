import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';


// This is a work around to avoid cyclic dependency.
// We copied this code from payment_gate.
// We might need to update this code, if the payment_gate code changed.
class EcommerceAndFoodPaymentUtils {
  static const String successCallbackUrl = "callback://spayment/success";
  static const String failCallbackUrl = "callback://spayment/fail";

  EcommerceAndFoodPaymentUtils._();

  static Future<EcommerceAndFoodPaymentResult> start(BuildContext context, String paymentToken,
      {Map<String, String>? others}) async {
    final parameters = {...?others, "paymentToken": paymentToken};

    final result = await _startUnchecked(context, parameters);
    return EcommerceAndFoodPaymentResult.fromMap(result);
  }

  static Future<Map<String, String>?> _startUnchecked(
      BuildContext context, Map<String, String> parameters) {
    return GoRouter.of(context)
        .pushNamed("startPayment", queryParameters: parameters);
  }
}

class EcommerceAndFoodPaymentResult {
  EcommerceAndFoodPaymentStatus get status {
    final rawStatus = rawData["is callback success"];
    if (rawStatus == "true") {
      return EcommerceAndFoodPaymentStatus.success;
    }
    return EcommerceAndFoodPaymentStatus.fail;
  }

  Map<String, String> rawData;

  EcommerceAndFoodPaymentResult.fromMap(Map<String, String>? map) : rawData = map ?? {};
}

enum EcommerceAndFoodPaymentStatus { success, fail }