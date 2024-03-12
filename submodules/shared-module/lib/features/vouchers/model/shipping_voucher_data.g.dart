// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_voucher_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataShippingVouchers _$DataShippingVouchersFromJson(
        Map<String, dynamic> json) =>
    DataShippingVouchers(
      page: json['page'] as num?,
      pageSize: json['page_size'] as num?,
      totalElement: json['total_element'] as num?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataItemVoucher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataShippingVouchersToJson(
        DataShippingVouchers instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_element': instance.totalElement,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

DataItemVoucher _$DataItemVoucherFromJson(Map<String, dynamic> json) =>
    DataItemVoucher(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      soctripVoucherType: json['soctrip_voucher_type'] == null
          ? null
          : SoctripVoucherType.fromJson(json['soctrip_voucher_type']),
      voucherCode: json['voucher_code'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'],
      avatarId: json['avatar_id'] as String?,
      avatarType: json['avatar_type'] as String?,
      discountPercent: json['discount_percent'] as num?,
      maxDiscountPrice: json['max_discount_price'] as num?,
      minimumOrderPrice: json['minimum_order_price'] as num?,
      soctripPaymentTypes: (json['soctrip_payment_types'] as List<dynamic>?)
          ?.map(SoctripPaymentTypes.fromJson)
          .toList(),
      platform: json['platform'] as String?,
      description: json['description'] as String?,
      objectRatingMin: json['object_rating_min'] as num?,
      objectRatingMax: json['object_rating_max'] as num?,
      registeredObjectMax: json['registered_object_max'] as num?,
      elementMax: json['element_max'] as num?,
      quantityElementMax: json['quantity_element_max'] as num?,
      elementRatingMin: json['element_rating_min'] as num?,
      elementRatingMax: json['element_rating_max'] as num?,
      percentShare: json['percent_share'] as num?,
      status: json['status'] as String?,
      voucherUsed: json['voucher_used'] as num?,
      usedAmount: json['used_amount'] as num?,
      shopStatus: json['shop_status'],
      isExpiredDate: json['is_expired_date'] as bool?,
      isLimitDiscountAmount: json['is_limit_discount_amount'] as bool?,
      isVisible: json['is_visible'] as bool? ?? false,
      isSelect: json['is_select'] as bool? ?? false,
      isLimitObjectRegister: json['is_limit_object_register'] as bool?,
      isShareBenefit: json['is_share_benefit'] as bool?,
      isPublic: json['is_public'] as bool?,
    );

Map<String, dynamic> _$DataItemVoucherToJson(DataItemVoucher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'soctrip_voucher_type': instance.soctripVoucherType?.toJson(),
      'voucher_code': instance.voucherCode,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'avatar_id': instance.avatarId,
      'avatar_type': instance.avatarType,
      'discount_percent': instance.discountPercent,
      'max_discount_price': instance.maxDiscountPrice,
      'minimum_order_price': instance.minimumOrderPrice,
      'soctrip_payment_types':
          instance.soctripPaymentTypes?.map((e) => e.toJson()).toList(),
      'platform': instance.platform,
      'description': instance.description,
      'object_rating_min': instance.objectRatingMin,
      'object_rating_max': instance.objectRatingMax,
      'registered_object_max': instance.registeredObjectMax,
      'element_max': instance.elementMax,
      'quantity_element_max': instance.quantityElementMax,
      'element_rating_min': instance.elementRatingMin,
      'element_rating_max': instance.elementRatingMax,
      'percent_share': instance.percentShare,
      'status': instance.status,
      'voucher_used': instance.voucherUsed,
      'used_amount': instance.usedAmount,
      'shop_status': instance.shopStatus,
      'is_expired_date': instance.isExpiredDate,
      'is_limit_discount_amount': instance.isLimitDiscountAmount,
      'is_limit_object_register': instance.isLimitObjectRegister,
      'is_share_benefit': instance.isShareBenefit,
      'is_public': instance.isPublic,
      'is_select': instance.isSelect,
      'is_visible': instance.isVisible,
    };
