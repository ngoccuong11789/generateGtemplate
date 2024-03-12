
import 'package:go_router/go_router.dart';
import 'package:payment_gate/payment_gate_screen.dart';

class ExternalRouteNames {

}

class RouteNames {
  RouteNames._();

  static const String startPayment = "startPayment";
}

List<RouteBase> paymentGateRoutes = [
  GoRoute(
      path: "/payment-gate/start",
      name: "startPayment",
      builder: (context, state) =>
          PaymentGateScreen(parameters: state.uri.queryParameters)),
];
