import 'dart:convert';

import 'package:equatable/equatable.dart';
/// page : 0
/// pageSize : 10
/// totalElement : 7
/// data : [{"id":"b4c5f21b-b2a0-4fdd-92ab-d9145ab2c674","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"DISCOUNT2$","code":"d4cac6001efba5552b06aa9eec2dc743","name":"Product Voucher discount 2$ for bill greater than 50$","description":"Discount ","voucher_status":"ACTIVE","discount_type":"PRICE","discount_amount":10,"minimum_order_price":100,"max_discount_price":1000,"used_amount":0,"max_usage_count":50,"maximum_usage_per_user_count":1,"used_count":1,"start_date":"2023-09-18T02:41:51.038+00:00","end_date":"2023-10-18T02:41:51.038+00:00","platform":"ALL","payment_type":null,"payment_type_id":"1a83746c-4a74-4d1a-ac93-2729a64ba3cf","element_ids":[],"created_at":"2023-09-27T17:12:50.632131","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"ALL_PAGE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":false,"is_public":true},{"id":"d6cff522-59d1-4baf-aa81-ee20cabce658","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"DISCOUNT2$","code":"0262b3c5058334d19d5fa5d9badd6740","name":"Product Voucher discount 2$ for bill greater than 50$","description":"Discount ","voucher_status":"ACTIVE","discount_type":"PRICE","discount_amount":10,"minimum_order_price":100,"max_discount_price":1000,"used_amount":0,"max_usage_count":50,"maximum_usage_per_user_count":1,"used_count":1,"start_date":"2023-09-18T02:41:51.038+00:00","end_date":"2023-10-18T02:41:51.038+00:00","platform":"ALL","payment_type":null,"payment_type_id":"1a83746c-4a74-4d1a-ac93-2729a64ba3cf","element_ids":["9188e7c2-579b-11ee-bd16-59f05f784de6","91b66060-579b-11ee-bd16-59f05f784de6"],"created_at":"2023-09-27T14:50:14.145587","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"ALL_PAGE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":false,"is_public":true},{"id":"0d48db1b-e945-4060-8e40-9b69d5a6666f","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"FREESHIP30K","code":"462d9a94be61e6dc21d72662a8e4c972","name":"Christmas Product Voucher","description":"Free ship for bill from 30k","voucher_status":"ACTIVE","discount_type":"PRICE","discount_amount":10,"minimum_order_price":100,"max_discount_price":1000,"used_amount":10,"max_usage_count":50,"maximum_usage_per_user_count":1,"used_count":1,"start_date":"2023-09-18T02:41:51.038+00:00","end_date":"2023-10-18T02:41:51.038+00:00","platform":"ALL","payment_type":null,"payment_type_id":null,"element_ids":[],"created_at":"2023-09-28T13:51:17.208162","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"ALL_PAGE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":true,"is_public":true},{"id":"21ce281e-5081-4e95-9a27-16b79570e386","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"DISCOUNT5","code":"0ebc98d17e0ac293f5612cbf88678a13","name":"Product Voucher discount 5$ for bill greater than 200$","description":"Discount ","voucher_status":"ACTIVE","discount_type":"PRICE","discount_amount":10,"minimum_order_price":100,"max_discount_price":1000,"used_amount":0,"max_usage_count":50,"maximum_usage_per_user_count":1,"used_count":1,"start_date":"2023-09-18T02:41:51.038+00:00","end_date":"2023-10-18T02:41:51.038+00:00","platform":"ALL","payment_type":null,"payment_type_id":"1a83746c-4a74-4d1a-ac93-2729a64ba3cf","element_ids":["9188e7c2-579b-11ee-bd16-59f05f784de6","91b66060-579b-11ee-bd16-59f05f784de6"],"created_at":"2023-09-27T14:53:07.818755","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"ALL_PAGE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":true,"is_public":true},{"id":"1ef1bf43-a51d-4a57-b44c-6d2b676d7752","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"PERCENT10","code":"b3ec151e48d84618b0c1f59bd94fbe89","name":"Product Voucher discount 10% for bill greater than 100$","description":"Discount ","voucher_status":"ACTIVE","discount_type":"PERCENTAGE","discount_amount":10,"minimum_order_price":100,"max_discount_price":1000,"used_amount":0,"max_usage_count":50,"maximum_usage_per_user_count":1,"used_count":1,"start_date":"2023-09-18T02:41:51.038+00:00","end_date":"2023-10-18T02:41:51.038+00:00","platform":"ALL","payment_type":null,"payment_type_id":"1a83746c-4a74-4d1a-ac93-2729a64ba3cf","element_ids":["9188e7c2-579b-11ee-bd16-59f05f784de6","91b66060-579b-11ee-bd16-59f05f784de6"],"created_at":"2023-09-27T14:52:35.174601","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"ALL_PAGE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":true,"is_public":true},{"id":"c00f8218-ec5a-4e90-863a-8ac49bc6146d","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"SHOPTHHSGG","code":"62ad6bec811842b6006bd0a476d3cd53","name":"Discount","description":"","voucher_status":"ACTIVE","discount_type":"PERCENTAGE","discount_amount":10,"minimum_order_price":500,"max_discount_price":100,"used_amount":0,"max_usage_count":6,"maximum_usage_per_user_count":0,"used_count":0,"start_date":"2023-10-02T08:07:34.229+00:00","end_date":"2023-10-03T17:00:00.000+00:00","platform":"ALL","payment_type":{"id":"def91b9c-1d27-49a3-8401-9729f5f81538","name":"Cash on delivery (COD)","code":"1"},"payment_type_id":"def91b9c-1d27-49a3-8401-9729f5f81538","element_ids":[],"created_at":"2023-10-02T15:09:00.780896","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"ALL_PAGE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":true,"is_public":true},{"id":"0a025a51-07ed-4775-8a3a-39e3919ea93a","voucherType":{"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"},"object_id":"ba9f4ea4-03ec-4b66-81af-1b80eccb5e96","voucher_code":"SHOPTMNHGB","code":"854d0787e3ae195b1119fa4c48ff576f","name":"Mien phi","description":"","voucher_status":"ACTIVE","discount_type":"PRICE","discount_amount":10,"minimum_order_price":2,"max_discount_price":0,"used_amount":0,"max_usage_count":20,"maximum_usage_per_user_count":0,"used_count":0,"start_date":"2023-10-02T07:45:15.205+00:00","end_date":"2023-10-06T17:00:00.000+00:00","platform":"ALL","payment_type":{"id":"def91b9c-1d27-49a3-8401-9729f5f81538","name":"Cash on delivery (COD)","code":"1"},"payment_type_id":"def91b9c-1d27-49a3-8401-9729f5f81538","element_ids":[],"created_at":"2023-10-02T14:48:03.335359","created_by":"d6228fd8-229b-457e-991f-c403b5a3e123","display_setting":"PRIVATE","is_limit_discount_price":true,"is_limit_usage":true,"is_applicable_all":true,"is_public":true}]

VoucherResponseModel voucherResponseModelFromJson(String str) => VoucherResponseModel.fromJson(json.decode(str));
String voucherResponseModelToJson(VoucherResponseModel data) => json.encode(data.toJson());
class VoucherResponseModel {
  VoucherResponseModel({
      num? page, 
      num? pageSize, 
      num? totalElement, 
      List<VoucherDetail>? data,}){
    _page = page;
    _pageSize = pageSize;
    _totalElement = totalElement;
    _data = data;
}

  VoucherResponseModel.fromJson(dynamic json) {
    _page = json['page'];
    _pageSize = json['pageSize'];
    _totalElement = json['totalElement'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(VoucherDetail.fromJson(v));
      });
    }
  }
  num? _page;
  num? _pageSize;
  num? _totalElement;
  List<VoucherDetail>? _data;
VoucherResponseModel copyWith({  num? page,
  num? pageSize,
  num? totalElement,
  List<VoucherDetail>? data,
}) => VoucherResponseModel(  page: page ?? _page,
  pageSize: pageSize ?? _pageSize,
  totalElement: totalElement ?? _totalElement,
  data: data ?? _data,
);
  num? get page => _page;
  num? get pageSize => _pageSize;
  num? get totalElement => _totalElement;
  List<VoucherDetail>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['pageSize'] = _pageSize;
    map['totalElement'] = _totalElement;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
@override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}

/// id : "b4c5f21b-b2a0-4fdd-92ab-d9145ab2c674"
/// voucherType : {"id":"14d61bc0-514c-11ee-b100-e3e199a95200","name":"Shop voucher","code":"SHOP","icon":"20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP","color":"#FFF4ED","description":"SHOP"}
/// object_id : "ba9f4ea4-03ec-4b66-81af-1b80eccb5e96"
/// voucher_code : "DISCOUNT2$"
/// code : "d4cac6001efba5552b06aa9eec2dc743"
/// name : "Product Voucher discount 2$ for bill greater than 50$"
/// description : "Discount "
/// voucher_status : "ACTIVE"
/// discount_type : "PRICE"
/// discount_amount : 10
/// minimum_order_price : 100
/// max_discount_price : 1000
/// used_amount : 0
/// max_usage_count : 50
/// maximum_usage_per_user_count : 1
/// used_count : 1
/// start_date : "2023-09-18T02:41:51.038+00:00"
/// end_date : "2023-10-18T02:41:51.038+00:00"
/// platform : "ALL"
/// payment_type : null
/// payment_type_id : "1a83746c-4a74-4d1a-ac93-2729a64ba3cf"
/// element_ids : []
/// created_at : "2023-09-27T17:12:50.632131"
/// created_by : "d6228fd8-229b-457e-991f-c403b5a3e123"
/// display_setting : "ALL_PAGE"
/// is_limit_discount_price : true
/// is_limit_usage : true
/// is_applicable_all : false
/// is_public : true

VoucherDetail dataFromJson(String str) => VoucherDetail.fromJson(json.decode(str));
String dataToJson(VoucherDetail data) => json.encode(data.toJson());
class VoucherDetail {
  VoucherDetail({
      String? id, 
      VoucherType? voucherType, 
      String? objectId, 
      String? voucherCode, 
      String? code, 
      String? name, 
      String? description, 
      String? voucherStatus, 
      String? discountType, 
      num? discountAmount, 
      num? minimumOrderPrice, 
      num? maxDiscountPrice, 
      num? usedAmount, 
      num? maxUsageCount, 
      num? maximumUsagePerUserCount, 
      num? usedCount, 
      String? startDate, 
      String? endDate, 
      String? platform,
      PaymentType? paymentType,
      String? paymentTypeId, 
      List<dynamic>? elementIds, 
      String? createdAt, 
      String? createdBy, 
      String? displaySetting, 
      bool? isLimitDiscountPrice, 
      bool? isLimitUsage, 
      bool? isApplicableAll, 
      bool? isPublic,}){
    _id = id;
    _voucherType = voucherType;
    _objectId = objectId;
    _voucherCode = voucherCode;
    _code = code;
    _name = name;
    _description = description;
    _voucherStatus = voucherStatus;
    _discountType = discountType;
    _discountAmount = discountAmount;
    _minimumOrderPrice = minimumOrderPrice;
    _maxDiscountPrice = maxDiscountPrice;
    _usedAmount = usedAmount;
    _maxUsageCount = maxUsageCount;
    _maximumUsagePerUserCount = maximumUsagePerUserCount;
    _usedCount = usedCount;
    _startDate = startDate;
    _endDate = endDate;
    _platform = platform;
    _paymentType = paymentType;
    _paymentTypeId = paymentTypeId;
    _elementIds = elementIds;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _displaySetting = displaySetting;
    _isLimitDiscountPrice = isLimitDiscountPrice;
    _isLimitUsage = isLimitUsage;
    _isApplicableAll = isApplicableAll;
    _isPublic = isPublic;
}

  VoucherDetail.fromJson(dynamic json) {
    _id = json['id'];
    _voucherType = json['voucherType'] != null ? VoucherType.fromJson(json['voucherType']) : null;
    _objectId = json['object_id'];
    _voucherCode = json['voucher_code'];
    _code = json['code'];
    _name = json['name'];
    _description = json['description'];
    _voucherStatus = json['voucher_status'];
    _discountType = json['discount_type'];
    _discountAmount = json['discount_amount'];
    _minimumOrderPrice = json['minimum_order_price'];
    _maxDiscountPrice = json['max_discount_price'];
    _usedAmount = json['used_amount'];
    _maxUsageCount = json['max_usage_count'];
    _maximumUsagePerUserCount = json['maximum_usage_per_user_count'];
    _usedCount = json['used_count'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _platform = json['platform'];
    _paymentType = json['payment_type'] != null ? PaymentType.fromJson(json['payment_type']) : null;
    _paymentTypeId = json['payment_type_id'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _displaySetting = json['display_setting'];
    _isLimitDiscountPrice = json['is_limit_discount_price'];
    _isLimitUsage = json['is_limit_usage'];
    _isApplicableAll = json['is_applicable_all'];
    _isPublic = json['is_public'];
  }
  String? _id;
  VoucherType? _voucherType;
  String? _objectId;
  String? _voucherCode;
  String? _code;
  String? _name;
  String? _description;
  String? _voucherStatus;
  String? _discountType;
  num? _discountAmount;
  num? _minimumOrderPrice;
  num? _maxDiscountPrice;
  num? _usedAmount;
  num? _maxUsageCount;
  num? _maximumUsagePerUserCount;
  num? _usedCount;
  String? _startDate;
  String? _endDate;
  String? _platform;
  PaymentType? _paymentType;
  String? _paymentTypeId;
  List<dynamic>? _elementIds;
  String? _createdAt;
  String? _createdBy;
  String? _displaySetting;
  bool? _isLimitDiscountPrice;
  bool? _isLimitUsage;
  bool? _isApplicableAll;
  bool? _isPublic;
  VoucherDetail copyWith({  String? id,
  VoucherType? voucherType,
  String? objectId,
  String? voucherCode,
  String? code,
  String? name,
  String? description,
  String? voucherStatus,
  String? discountType,
  num? discountAmount,
  num? minimumOrderPrice,
  num? maxDiscountPrice,
  num? usedAmount,
  num? maxUsageCount,
  num? maximumUsagePerUserCount,
  num? usedCount,
  String? startDate,
  String? endDate,
  String? platform,
    PaymentType? paymentType,
  String? paymentTypeId,
  List<dynamic>? elementIds,
  String? createdAt,
  String? createdBy,
  String? displaySetting,
  bool? isLimitDiscountPrice,
  bool? isLimitUsage,
  bool? isApplicableAll,
  bool? isPublic,
}) => VoucherDetail(  id: id ?? _id,
  voucherType: voucherType ?? _voucherType,
  objectId: objectId ?? _objectId,
  voucherCode: voucherCode ?? _voucherCode,
  code: code ?? _code,
  name: name ?? _name,
  description: description ?? _description,
  voucherStatus: voucherStatus ?? _voucherStatus,
  discountType: discountType ?? _discountType,
  discountAmount: discountAmount ?? _discountAmount,
  minimumOrderPrice: minimumOrderPrice ?? _minimumOrderPrice,
  maxDiscountPrice: maxDiscountPrice ?? _maxDiscountPrice,
  usedAmount: usedAmount ?? _usedAmount,
  maxUsageCount: maxUsageCount ?? _maxUsageCount,
  maximumUsagePerUserCount: maximumUsagePerUserCount ?? _maximumUsagePerUserCount,
  usedCount: usedCount ?? _usedCount,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  platform: platform ?? _platform,
  paymentType: paymentType ?? _paymentType,
  paymentTypeId: paymentTypeId ?? _paymentTypeId,
  elementIds: elementIds ?? _elementIds,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  displaySetting: displaySetting ?? _displaySetting,
  isLimitDiscountPrice: isLimitDiscountPrice ?? _isLimitDiscountPrice,
  isLimitUsage: isLimitUsage ?? _isLimitUsage,
  isApplicableAll: isApplicableAll ?? _isApplicableAll,
  isPublic: isPublic ?? _isPublic,
);
  String? get id => _id;
  VoucherType? get voucherType => _voucherType;
  String? get objectId => _objectId;
  String? get voucherCode => _voucherCode;
  String? get code => _code;
  String? get name => _name;
  String? get description => _description;
  String? get voucherStatus => _voucherStatus;
  String? get discountType => _discountType;
  num? get discountAmount => _discountAmount;
  num? get minimumOrderPrice => _minimumOrderPrice;
  num? get maxDiscountPrice => _maxDiscountPrice;
  num? get usedAmount => _usedAmount;
  num? get maxUsageCount => _maxUsageCount;
  num? get maximumUsagePerUserCount => _maximumUsagePerUserCount;
  num? get usedCount => _usedCount;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get platform => _platform;
  PaymentType? get paymentType => _paymentType;
  String? get paymentTypeId => _paymentTypeId;
  List<dynamic>? get elementIds => _elementIds;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get displaySetting => _displaySetting;
  bool? get isLimitDiscountPrice => _isLimitDiscountPrice;
  bool? get isLimitUsage => _isLimitUsage;
  bool? get isApplicableAll => _isApplicableAll;
  bool? get isPublic => _isPublic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_voucherType != null) {
      map['voucherType'] = _voucherType?.toJson();
    }
    map['object_id'] = _objectId;
    map['voucher_code'] = _voucherCode;
    map['code'] = _code;
    map['name'] = _name;
    map['description'] = _description;
    map['voucher_status'] = _voucherStatus;
    map['discount_type'] = _discountType;
    map['discount_amount'] = _discountAmount;
    map['minimum_order_price'] = _minimumOrderPrice;
    map['max_discount_price'] = _maxDiscountPrice;
    map['used_amount'] = _usedAmount;
    map['max_usage_count'] = _maxUsageCount;
    map['maximum_usage_per_user_count'] = _maximumUsagePerUserCount;
    map['used_count'] = _usedCount;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['platform'] = _platform;
    if (_paymentType != null) {
      map['payment_type'] = _paymentType?.toJson();
    }
    map['payment_type_id'] = _paymentTypeId;
    if (_elementIds != null) {
      map['element_ids'] = _elementIds?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['display_setting'] = _displaySetting;
    map['is_limit_discount_price'] = _isLimitDiscountPrice;
    map['is_limit_usage'] = _isLimitUsage;
    map['is_applicable_all'] = _isApplicableAll;
    map['is_public'] = _isPublic;
    return map;
  }
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}

class PaymentType {
  PaymentType({
    String? id,
    String? name,
    String? code,}){
    _id = id;
    _name = name;
    _code = code;
  }

  PaymentType.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
  }
  String? _id;
  String? _name;
  String? _code;
  PaymentType copyWith({  String? id,
    String? name,
    String? code,
  }) => PaymentType(  id: id ?? _id,
    name: name ?? _name,
    code: code ?? _code,
  );
  String? get id => _id;
  String? get name => _name;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    return map;
  }

}

/// id : "14d61bc0-514c-11ee-b100-e3e199a95200"
/// name : "Shop voucher"
/// code : "SHOP"
/// icon : "20230929T104931590870645_00000000-0000-0000-0000-000000000000_SHOP"
/// color : "#FFF4ED"
/// description : "SHOP"

VoucherType voucherTypeFromJson(String str) => VoucherType.fromJson(json.decode(str));
String voucherTypeToJson(VoucherType data) => json.encode(data.toJson());
class VoucherType extends Equatable {
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

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [id];
}