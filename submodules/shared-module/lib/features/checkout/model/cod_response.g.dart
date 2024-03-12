// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cod_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodResponse _$CodResponseFromJson(Map<String, dynamic> json) => CodResponse(
      status: json['status'] as String?,
      orderTotal: json['order_total'] as num?,
      discounts: json['discounts'] as num?,
      paymentTotal: json['payment_total'] as num?,
      createdAt: json['created_at'] as String?,
      orders: (json['orders'] as List<dynamic>?)?.map(Orders.fromJson).toList(),
      redirectUrl: json['redirect_url'] as String?,
      qrData: json['qr_data'] as String?,
    );

Map<String, dynamic> _$CodResponseToJson(CodResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'order_total': instance.orderTotal,
      'discounts': instance.discounts,
      'payment_total': instance.paymentTotal,
      'created_at': instance.createdAt,
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
      'redirect_url': instance.redirectUrl,
      'qr_data': instance.qrData,
    };
