// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MethodPayment _$MethodPaymentFromJson(Map<String, dynamic> json) =>
    MethodPayment(
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => DataMethodPayment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MethodPaymentToJson(MethodPayment instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataMethodPayment _$DataMethodPaymentFromJson(Map<String, dynamic> json) =>
    DataMethodPayment(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      isSelect: json['is_select'] as bool? ?? false,
    );

Map<String, dynamic> _$DataMethodPaymentToJson(DataMethodPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'code': instance.code,
      'name': instance.name,
      'is_select': instance.isSelect,
    };
