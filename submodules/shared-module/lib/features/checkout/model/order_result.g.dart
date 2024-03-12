// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResult _$OrderResultFromJson(Map<String, dynamic> json) => OrderResult(
      token: json['token'] as String,
      paymentUrl: json['payment_url'] as String?,
      expiredAt: json['expired_at'] as int?,
    );

// ignore: unused_element
abstract class _$OrderResultPerFieldToJson {
  // ignore: unused_element
  static Object? token(String instance) => instance;
  // ignore: unused_element
  static Object? paymentUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? expiredAt(int? instance) => instance;
}

Map<String, dynamic> _$OrderResultToJson(OrderResult instance) =>
    <String, dynamic>{
      'token': instance.token,
      'payment_url': instance.paymentUrl,
      'expired_at': instance.expiredAt,
    };
