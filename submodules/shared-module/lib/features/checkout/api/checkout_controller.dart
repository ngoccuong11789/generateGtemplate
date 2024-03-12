import 'package:dio/dio.dart';
import 'package:shared_module/features/checkout/api/checkout_service.dart';
import 'package:shared_module/features/checkout/model/billing_address_res.dart';
import 'package:shared_module/features/checkout/model/city_model.dart';
import 'package:shared_module/features/checkout/model/cod_response.dart';
import 'package:shared_module/features/checkout/model/countries.dart';
import 'package:shared_module/features/checkout/model/district_model.dart';
import 'package:shared_module/features/checkout/model/dto_billing_address.dart';
import 'package:shared_module/features/checkout/model/dto_get_shipment.dart';
import 'package:shared_module/features/checkout/model/dto_payment_request.dart';
import 'package:shared_module/features/checkout/model/food_checkout_request.dart';
import 'package:shared_module/features/checkout/model/checkout_response.dart';

import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/checkout/model/ecommerce_checkout_request.dart';
import 'package:shared_module/features/checkout/model/invoices_res.dart';
import 'package:shared_module/features/checkout/model/method_payment.dart';
import 'package:shared_module/features/checkout/model/order_request.dart';
import 'package:shared_module/features/checkout/model/order_result.dart';
import 'package:shared_module/features/checkout/model/payment_response.dart';
import 'package:shared_module/features/checkout/model/payment_token_response.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';

class CheckoutController extends BaseApiController {
  final CheckoutService service;

  CheckoutController(Dio dio) : service = CheckoutService(dio);

  Future<CheckoutResponse> foodCheckout(FoodCheckoutRequest dto) {
    return handleWithFreshTokenRetry(() => service.foodCheckout(dto));
  }

  //  Future<PaymentResponse> ecommerceCheckout(DtoPaymentCheckout dto, String token) {
  //   return handleWithFreshTokenRetry(() => service.ecommerceCheckout(dto, token));
  // }

  Future<MethodPayment> getMethodPayment() {
    return service.getMethodPayment();
  }

  Future<List<ItemCountry>> getCountries() {
    return handleWithFreshTokenRetry(() => service.getCountry());
  }

  Future<List<ItemCity>> getCity(String countryId) {
    return handleWithFreshTokenRetry(() => service.getCity(countryId));
  }

  Future<List<ItemDistrict>> getDistrict(String provinceId) {
    return handleWithFreshTokenRetry(() => service.getDistrict(provinceId));
  }

  Future<List<ItemShipment>> getShipment(DtoGetShipment dto) {
    return handleWithFreshTokenRetry(() => service.getShipment(dto));
  }

  Future<BillingAddressResponse> postBillingAddress(DtoBillingAddress dto) {
    return handleWithFreshTokenRetry(() => service.postBillingAddress(dto));
  }

  Future<OrderResult> placeOrder(OrderRequest dto) {
    return handleWithFreshTokenRetry(() => service.placeOrder(dto));
  }

  Future<CodResponse> postCod(String token) {
    return handleWithFreshTokenRetry(() => service.postCod(token));
  }
}
