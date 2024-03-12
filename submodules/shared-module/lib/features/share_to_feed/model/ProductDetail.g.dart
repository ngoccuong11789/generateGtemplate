// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VouchersInShop _$VouchersInShopFromJson(Map<String, dynamic> json) =>
    VouchersInShop(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      voucherStatus: json['voucher_status'] as String,
      discountType: json['discount_type'] as String,
      discountAmount: (json['discount_amount'] as num).toDouble(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$VouchersInShopToJson(VouchersInShop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'description': instance.description,
      'voucher_status': instance.voucherStatus,
      'discount_type': instance.discountType,
      'discount_amount': instance.discountAmount,
    };
