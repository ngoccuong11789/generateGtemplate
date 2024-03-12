// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InVoicesRes _$InVoicesResFromJson(Map<String, dynamic> json) => InVoicesRes(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
      companyName: json['company_name'] as String?,
      companyAddress: json['company_address'] as String?,
      email: json['email'] as String?,
      taxCode: json['tax_code'] as String?,
    );

Map<String, dynamic> _$InVoicesResToJson(InVoicesRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'company_name': instance.companyName,
      'company_address': instance.companyAddress,
      'email': instance.email,
      'tax_code': instance.taxCode,
    };
