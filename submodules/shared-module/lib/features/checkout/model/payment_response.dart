class PaymentResponse {
  double? orderTotal;
  double? discounts;
  double? paymentTotal;
  String? status;

  PaymentResponse({
    this.orderTotal,
    this.discounts,
    this.paymentTotal,
    this.status,
  });

  PaymentResponse.fromJson(Map<String, dynamic> json)
      : orderTotal = json["order_total"] ?? 0,
        discounts = json["discounts"] ?? 0,
        paymentTotal = json["payment_total"] ?? 0,
        status = json["status"] ?? "";
}
