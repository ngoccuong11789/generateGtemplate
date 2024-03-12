import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_voucher_data.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DataShopVouchers {
  final num? page;
  final num? pageSize;
  final num? totalElement;
  final List<DataItemShopVoucher>? data;

  DataShopVouchers({this.page, this.pageSize, this.totalElement, this.data});

  factory DataShopVouchers.fromJson(Map<String, dynamic> json) {
    return _$DataShopVouchersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataShopVouchersToJson(this);
  }

  DataShopVouchers copyWith({
    num? page,
    num? pageSize,
    num? totalElement,
    List<DataItemShopVoucher>? data,
  }) {
    return DataShopVouchers(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalElement: totalElement ?? this.totalElement,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'DataShopVouchers{page: $page, pageSize: $pageSize, totalElement: $totalElement, data: $data}';
  }
}


@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DataItemShopVoucher {
  final String? id;
  final VoucherType? voucherType;
  final String? objectId;
  final String? voucherCode;
  final String? code;
  final String? name;
  final String? description;
  final String? voucherStatus;
  final String? discountType;
  final num? discountAmount;
  final num? minimumOrderPrice;
  final num? maxDiscountPrice;
  final num? usedAmount;
  final num? maxUsageCount;
  final num? maximumUsagePerUserCount;
  final num? usedCount;
  final String? startDate;
  final DateTime? endDate;
  final String? platform;
  final dynamic paymentType;
  final String? paymentTypeId;
  final List<String>? elementIds;
  final String? createdAt;
  final String? createdBy;
  final String? displaySetting;
  final bool? isLimitDiscountPrice;
  final bool? isLimitUsage;
  final bool? isApplicableAll;
  final bool? isPublic;
  late bool isSelect = false;
  late bool isVisible;

  DataItemShopVoucher(
      {this.id,
      this.voucherType,
      this.objectId,
      this.voucherCode,
      this.code,
      this.name,
      this.description,
      this.voucherStatus,
      this.discountType,
      this.discountAmount,
      this.minimumOrderPrice,
      this.maxDiscountPrice,
      this.usedAmount,
      this.maxUsageCount,
      this.maximumUsagePerUserCount,
      this.usedCount,
      this.startDate,
      this.endDate,
      this.platform,
      this.paymentType,
      this.paymentTypeId,
      this.elementIds,
      this.createdAt,
      this.createdBy,
      this.displaySetting,
      this.isLimitDiscountPrice,
      this.isLimitUsage,
      this.isApplicableAll,
      this.isSelect = false,
      this.isVisible = false,
      this.isPublic});

  factory DataItemShopVoucher.fromJson(Map<String, dynamic> json) {
    return _$DataItemShopVoucherFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataItemShopVoucherToJson(this);
  }

  @override
  String toString() {
    return 'DataItemShopVoucher{id: $id, voucherType: $voucherType, objectId: $objectId, voucherCode: $voucherCode, code: $code, name: $name, description: $description, voucherStatus: $voucherStatus, discountType: $discountType, discountAmount: $discountAmount, minimumOrderPrice: $minimumOrderPrice, maxDiscountPrice: $maxDiscountPrice, usedAmount: $usedAmount, maxUsageCount: $maxUsageCount, maximumUsagePerUserCount: $maximumUsagePerUserCount, usedCount: $usedCount, startDate: $startDate, endDate: $endDate, platform: $platform, paymentType: $paymentType, paymentTypeId: $paymentTypeId, elementIds: $elementIds, createdAt: $createdAt, createdBy: $createdBy, displaySetting: $displaySetting, isLimitDiscountPrice: $isLimitDiscountPrice, isLimitUsage: $isLimitUsage, isApplicableAll: $isApplicableAll, isPublic: $isPublic, isSelect: $isSelect}';
  }
}

/// id : "14d61bc0-514c-11ee-b100-e3e199a95200"
/// name : "Shop voucher"
/// code : "SHOP"
/// icon : "20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP"
/// color : "#FFF4ED"
/// description : "SHOP"

class VoucherType {
  VoucherType({
      String? id,
      String? name,
      String? code,
      String? icon,
      String? color,
      String? description,}){
    _id = id;
    _name = name;
    _code = code;
    _icon = icon;
    _color = color;
    _description = description;
}

  VoucherType.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _icon = json['icon'];
    _color = json['color'];
    _description = json['description'];
  }
  String? _id;
  String? _name;
  String? _code;
  String? _icon;
  String? _color;
  String? _description;
VoucherType copyWith({  String? id,
  String? name,
  String? code,
  String? icon,
  String? color,
  String? description,
}) => VoucherType(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  icon: icon ?? _icon,
  color: color ?? _color,
  description: description ?? _description,
);
  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get icon => _icon;
  String? get color => _color;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['icon'] = _icon;
    map['color'] = _color;
    map['description'] = _description;
    return map;
  }

}