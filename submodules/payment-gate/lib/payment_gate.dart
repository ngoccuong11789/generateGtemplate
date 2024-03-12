import 'package:dio/dio.dart';
import 'package:payment_gate/model/payment_gate_config.dart';
import 'package:payment_gate/model/payment_result.dart';
import 'package:payment_gate/routing/routing.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/exception/soctrip_exeception.dart';
import 'package:shared_module/shared_module.dart';
import 'payment_gate_platform_interface.dart';
export 'routing/routing.dart';
export 'payment_gate_screen.dart';
export 'enum/payment_method.dart';
export 'model/payment_gate_config.dart';
export 'model/payment_method_config.dart';
export 'model/stripe_config.dart';
export 'widgets/payment_method_selector.dart';
export 'enum/payment_status.dart';
export 'model/payment_result.dart';
import 'localization/localizations.dart';

typedef PaymentGateLocalization = AppLocalizations;

class PaymentGate {
  Future<String?> getPlatformVersion() {
    return PaymentGatePlatform.instance.getPlatformVersion();
  }
}

class PaymentGateApp extends MiniApp {

  static const String successCallbackUrl = "callback://spayment/success";
  static const String failCallbackUrl = "callback://spayment/fail";

  static Dio? _dio;

  static PaymentGateConfig? _config;

  @override
  String get appName => "Payment Gate";

  @override
  Widget get miniHome => const Text("Payment module have no home screen");

  @override
  List<LocalizationsDelegate> get localizationsDelegates =>
      [AppLocalizations.delegate];

  @override
  void registerAppDelegates(AppDelegates appDelegates) {
    _dio = appDelegates.dio;
  }

  @override
  List<RouteBase> get rootRoutes {
    return paymentGateRoutes;
  }

  static Dio get dio {
    if (_dio == null) {
      throw UnregisteredAppException(
          message:
          "You should register this app with Super app/ main app first");
    }
    return _dio!;
  }

  static PaymentGateConfig get config {
    if (_config == null) {
      throw UnConfigPaymentGateException(
          message:
          "You should set the config first");
    }
    return _config!;
  }

  static set config(PaymentGateConfig value) {
    _config = value;
  }

  static Future<PaymentResult> start(BuildContext context, String paymentToken,
      {Map<String, String>? others}) async {
    final parameters = {...?others, "paymentToken": paymentToken};

    final result = await _startUnchecked(context, parameters);
    return PaymentResult.fromMap(result);
  }

  static Future<Map<String, String>?> _startUnchecked(
      BuildContext context, Map<String, String> parameters) {
    return GoRouter.of(context)
        .pushNamed(RouteNames.startPayment, queryParameters: parameters);
  }
}

class UnregisteredAppException extends SoctripException {
  UnregisteredAppException({super.message});
}

class UnConfigPaymentGateException extends SoctripException {
  UnConfigPaymentGateException({super.message});
}