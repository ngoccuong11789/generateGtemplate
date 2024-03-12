// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      addressId: json['address_id'] as String,
      voucherIds: (json['voucher_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      successCallback: json['success_callback'] as String,
      failCallback: json['fail_callback'] as String,
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'voucher_ids': instance.voucherIds,
      'success_callback': instance.successCallback,
      'fail_callback': instance.failCallback,
      'orders': instance.orders,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      vendorId: json['vendor_id'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Offering.fromJson(e as Map<String, dynamic>))
          .toList(),
      voucherIds: (json['voucher_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      note: json['note'] as String?,
      shippingCode: json['shipping_code'] as String,
      amount: json['amount'] as num,
      isInvoiceExact: json['is_invoice_exact'] as bool,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'vendor_id': instance.vendorId,
      'data': instance.data,
      'voucher_ids': instance.voucherIds,
      'note': instance.note,
      'shipping_code': instance.shippingCode,
      'amount': instance.amount,
      'is_invoice_exact': instance.isInvoiceExact,
    };

Offering _$OfferingFromJson(Map<String, dynamic> json) => Offering(
      stockId: json['stock_id'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$OfferingToJson(Offering instance) => <String, dynamic>{
      'stock_id': instance.stockId,
      'quantity': instance.quantity,
    };
