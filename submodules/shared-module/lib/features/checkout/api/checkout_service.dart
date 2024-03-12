import 'package:dio/dio.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/checkout/model/billing_address_res.dart';
import 'package:shared_module/features/checkout/model/cod_response.dart';
import 'package:shared_module/features/checkout/model/dto_get_shipment.dart';
import 'package:shared_module/features/checkout/model/city_model.dart';
import 'package:shared_module/features/checkout/model/countries.dart';
import 'package:shared_module/features/checkout/model/district_model.dart';
import 'package:shared_module/features/checkout/model/dto_payment_request.dart';
import 'package:shared_module/features/checkout/model/food_checkout_request.dart';
import 'package:shared_module/features/checkout/model/checkout_response.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/checkout/model/method_payment.dart';
import 'package:shared_module/features/checkout/model/order_request.dart';
import 'package:shared_module/features/checkout/model/order_result.dart';
import 'package:shared_module/features/checkout/model/payment_token_response.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';
import 'package:shared_module/models/base_response.dart';

import '../model/dto_billing_address.dart';

part 'checkout_service.g.dart';

@RestApi()
abstract class CheckoutService {
  factory CheckoutService(Dio dio, {String baseUrl}) = _CheckoutService;

  @POST("food-order/orders")
  Future<BaseResponse<CheckoutResponse>> foodCheckout(
      @Body() FoodCheckoutRequest dto);

  @GET("payment/payment-type")
  Future<MethodPayment> getMethodPayment();

  @GET("shipment/address/countries")
  Future<BaseResponse<List<ItemCountry>>> getCountry();

  @GET("shipment/address/provinces")
  Future<BaseResponse<List<ItemCity>>> getCity(@Query("countryId") String countryId);

  @GET("shipment/address/districts")
  Future<BaseResponse<List<ItemDistrict>>> getDistrict(@Query("provinceId") String countryId);

  @POST("shipment/shipping/fees")
  Future<BaseResponse<List<ItemShipment>>> getShipment(@Body() DtoGetShipment dto);

  @POST("payment/billing-address")
  Future<BaseResponse<BillingAddressResponse>> postBillingAddress(@Body() DtoBillingAddress dto);

  @POST("order/orders")
  Future<BaseResponse<OrderResult>> placeOrder(@Body() OrderRequest dto);

  @POST("payment/payments/cod/charge")
  Future<BaseResponse<CodResponse>> postCod(@Query("payment_token")String paymentToken);
}
