// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_voucher_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataShopVouchers _$DataShopVouchersFromJson(Map<String, dynamic> json) =>
    DataShopVouchers(
      page: json['page'] as num?,
      pageSize: json['page_size'] as num?,
      totalElement: json['total_element'] as num?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataItemShopVoucher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataShopVouchersToJson(DataShopVouchers instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_element': instance.totalElement,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

DataItemShopVoucher _$DataItemShopVoucherFromJson(Map<String, dynamic> json) =>
    DataItemShopVoucher(
      id: json['id'] as String?,
      voucherType: json['voucher_type'] == null
          ? null
          : VoucherType.fromJson(json['voucher_type']),
      objectId: json['object_id'] as String?,
      voucherCode: json['voucher_code'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      voucherStatus: json['voucher_status'] as String?,
      discountType: json['discount_type'] as String?,
      discountAmount: json['discount_amount'] as num?,
      minimumOrderPrice: json['minimum_order_price'] as num?,
      maxDiscountPrice: json['max_discount_price'] as num?,
      usedAmount: json['used_amount'] as num?,
      maxUsageCount: json['max_usage_count'] as num?,
      maximumUsagePerUserCount: json['maximum_usage_per_user_count'] as num?,
      usedCount: json['used_count'] as num?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      platform: json['platform'] as String?,
      paymentType: json['payment_type'],
      paymentTypeId: json['payment_type_id'] as String?,
      elementIds: (json['element_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      displaySetting: json['display_setting'] as String?,
      isLimitDiscountPrice: json['is_limit_discount_price'] as bool?,
      isLimitUsage: json['is_limit_usage'] as bool?,
      isApplicableAll: json['is_applicable_all'] as bool?,
      isSelect: json['is_select'] as bool? ?? false,
      isVisible: json['is_visible'] as bool? ?? false,
      isPublic: json['is_public'] as bool?,
    );

Map<String, dynamic> _$DataItemShopVoucherToJson(
        DataItemShopVoucher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'voucher_type': instance.voucherType?.toJson(),
      'object_id': instance.objectId,
      'voucher_code': instance.voucherCode,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'voucher_status': instance.voucherStatus,
      'discount_type': instance.discountType,
      'discount_amount': instance.discountAmount,
      'minimum_order_price': instance.minimumOrderPrice,
      'max_discount_price': instance.maxDiscountPrice,
      'used_amount': instance.usedAmount,
      'max_usage_count': instance.maxUsageCount,
      'maximum_usage_per_user_count': instance.maximumUsagePerUserCount,
      'used_count': instance.usedCount,
      'start_date': instance.startDate,
      'end_date': instance.endDate?.toIso8601String(),
      'platform': instance.platform,
      'payment_type': instance.paymentType,
      'payment_type_id': instance.paymentTypeId,
      'element_ids': instance.elementIds,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'display_setting': instance.displaySetting,
      'is_limit_discount_price': instance.isLimitDiscountPrice,
      'is_limit_usage': instance.isLimitUsage,
      'is_applicable_all': instance.isApplicableAll,
      'is_public': instance.isPublic,
      'is_select': instance.isSelect,
      'is_visible': instance.isVisible,
    };
