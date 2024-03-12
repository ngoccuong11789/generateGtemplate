// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTokenResponse _$PaymentTokenResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentTokenResponse(
      id: json['id'] as String?,
      orderType: json['order_type'] as String?,
      addressId: json['address_id'] as String?,
      voucherIds: json['voucher_ids'] as List<dynamic>?,
      orders: (json['orders'] as List<dynamic>?)?.map(Orders.fromJson).toList(),
      callBackUrl: json['call_back_url'] as String?,
      subtotalFee: json['subtotal_fee'] as num?,
      deliveryFee: json['delivery_fee'] as num?,
      deliveryDiscount: json['delivery_discount'] as num?,
      discount: json['discount'] as num?,
      voucherNames: (json['voucher_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isInvoiceExact: json['is_invoice_exact'] as bool?,
    );

Map<String, dynamic> _$PaymentTokenResponseToJson(
        PaymentTokenResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_type': instance.orderType,
      'address_id': instance.addressId,
      'voucher_ids': instance.voucherIds,
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
      'call_back_url': instance.callBackUrl,
      'subtotal_fee': instance.subtotalFee,
      'delivery_fee': instance.deliveryFee,
      'delivery_discount': instance.deliveryDiscount,
      'discount': instance.discount,
      'voucher_names': instance.voucherNames,
      'is_invoice_exact': instance.isInvoiceExact,
    };
