import 'package:json_annotation/json_annotation.dart';
part 'shipping_voucher_data.g.dart';

/// page : 0
/// pageSize : 50
/// totalElement : 1
/// data : [{"id":"6e912f04-e6b4-4888-ae65-d4b572c6a5c1","code":"479c17cfe0b470157a3aa20dee6c3cda","name":"SHIPPING 26/12","soctrip_voucher_type":{"id":"de92d6a4-7e7c-474d-b67f-1d612b4d7ff5","name":"Livestream voucher","code":"LIVESTREAM","icon":"20230929T104956553783042_00000000-0000-0000-0000-000000000000_LIVESTREAM","color":"#FFF1F3","description":"LIVESTREAM"},"voucher_code":"SHIPPINGFEE3ZKM","start_date":"2023-11-18T02:41:51.038+00:00","end_date":null,"avatar_id":"20231004T121648596674954_f582880a-3fb4-43fa-b5f0-7bcdef04439e_811OpisQJqLSX606","avatar_type":"image/jpeg","discount_percent":20.0,"max_discount_price":50.0,"minimum_order_price":2.0,"soctrip_payment_types":[{"id":"a1c30470-d1d8-4f73-b35e-0c378ba87f70","name":"QR code","code":"QR"}],"platform":"ALL","description":"Free ship for bill from 30k","object_rating_min":3,"object_rating_max":5,"registered_object_max":200,"categories":[],"element_max":200,"quantity_element_max":10,"element_rating_min":3,"element_rating_max":5,"percent_share":5.0,"status":"Ongoing","voucher_used":0,"used_amount":0.0,"shop_status":null,"is_expired_date":false,"is_limit_discount_amount":true,"is_limit_object_register":true,"is_share_benefit":true,"is_public":true}]
@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DataShippingVouchers {
  final num? page;
  final num? pageSize;
  final num? totalElement;
  final List<DataItemVoucher>? data;

  DataShippingVouchers({this.page, this.pageSize, this.totalElement, this.data});

  factory DataShippingVouchers.fromJson(Map<String, dynamic> json) {
    return _$DataShippingVouchersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataShippingVouchersToJson(this);
  }

  DataShippingVouchers copyWith({
    num? page,
    num? pageSize,
    num? totalElement,
    List<DataItemVoucher>? data,
  }) {
    return DataShippingVouchers(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalElement: totalElement ?? this.totalElement,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'DataShippingVouchers{page: $page, pageSize: $pageSize, totalElement: $totalElement, data: $data}';
  }
}

/// id : "6e912f04-e6b4-4888-ae65-d4b572c6a5c1"
/// code : "479c17cfe0b470157a3aa20dee6c3cda"
/// name : "SHIPPING 26/12"
/// soctrip_voucher_type : {"id":"de92d6a4-7e7c-474d-b67f-1d612b4d7ff5","name":"Livestream voucher","code":"LIVESTREAM","icon":"20230929T104956553783042_00000000-0000-0000-0000-000000000000_LIVESTREAM","color":"#FFF1F3","description":"LIVESTREAM"}
/// voucher_code : "SHIPPINGFEE3ZKM"
/// start_date : "2023-11-18T02:41:51.038+00:00"
/// end_date : null
/// avatar_id : "20231004T121648596674954_f582880a-3fb4-43fa-b5f0-7bcdef04439e_811OpisQJqLSX606"
/// avatar_type : "image/jpeg"
/// discount_percent : 20.0
/// max_discount_price : 50.0
/// minimum_order_price : 2.0
/// soctrip_payment_types : [{"id":"a1c30470-d1d8-4f73-b35e-0c378ba87f70","name":"QR code","code":"QR"}]
/// platform : "ALL"
/// description : "Free ship for bill from 30k"
/// object_rating_min : 3
/// object_rating_max : 5
/// registered_object_max : 200
/// categories : []
/// element_max : 200
/// quantity_element_max : 10
/// element_rating_min : 3
/// element_rating_max : 5
/// percent_share : 5.0
/// status : "Ongoing"
/// voucher_used : 0
/// used_amount : 0.0
/// shop_status : null
/// is_expired_date : false
/// is_limit_discount_amount : true
/// is_limit_object_register : true
/// is_share_benefit : true
/// is_public : true


@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DataItemVoucher {
  final String? id;
  final String? code;
  final String? name;
  final SoctripVoucherType? soctripVoucherType;
  final String? voucherCode;
  final String? startDate;
  final dynamic endDate;
  final String? avatarId;
  final String? avatarType;
  final num? discountPercent;
  final num? maxDiscountPrice;
  final num? minimumOrderPrice;
  final List<SoctripPaymentTypes>? soctripPaymentTypes;
  final String? platform;
  final String? description;
  final num? objectRatingMin;
  final num? objectRatingMax;
  final num? registeredObjectMax;
  final num? elementMax;
  final num? quantityElementMax;
  final num? elementRatingMin;
  final num? elementRatingMax;
  final num? percentShare;
  final String? status;
  final num? voucherUsed;
  final num? usedAmount;
  final dynamic shopStatus;
  final bool? isExpiredDate;
  final bool? isLimitDiscountAmount;
  final bool? isLimitObjectRegister;
  final bool? isShareBenefit;
  final bool? isPublic;
  late bool isSelect;
  late bool isVisible;

  DataItemVoucher({this.id, this.code, this.name, this.soctripVoucherType,
    this.voucherCode, this.startDate, this.endDate, this.avatarId,
    this.avatarType, this.discountPercent, this.maxDiscountPrice,
    this.minimumOrderPrice, this.soctripPaymentTypes, this.platform,
    this.description, this.objectRatingMin, this.objectRatingMax,
    this.registeredObjectMax, this.elementMax, this.quantityElementMax,
    this.elementRatingMin, this.elementRatingMax, this.percentShare,
    this.status, this.voucherUsed, this.usedAmount, this.shopStatus,
    this.isExpiredDate, this.isLimitDiscountAmount,
    this.isVisible = false, this.isSelect = false,
    this.isLimitObjectRegister, this.isShareBenefit, this.isPublic});


  factory DataItemVoucher.fromJson(Map<String, dynamic> json) {
    return _$DataItemVoucherFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataItemVoucherToJson(this);
  }

  DataItemVoucher copyWith({
    String? id,
    String? code,
    String? name,
    SoctripVoucherType? soctripVoucherType,
    String? voucherCode,
    String? startDate,
    dynamic? endDate,
    String? avatarId,
    String? avatarType,
    num? discountPercent,
    num? maxDiscountPrice,
    num? minimumOrderPrice,
    List<SoctripPaymentTypes>? soctripPaymentTypes,
    String? platform,
    String? description,
    num? objectRatingMin,
    num? objectRatingMax,
    num? registeredObjectMax,
    num? elementMax,
    num? quantityElementMax,
    num? elementRatingMin,
    num? elementRatingMax,
    num? percentShare,
    String? status,
    num? voucherUsed,
    num? usedAmount,
    dynamic? shopStatus,
    bool? isExpiredDate,
    bool? isLimitDiscountAmount,
    bool? isLimitObjectRegister,
    bool? isShareBenefit,
    bool? isPublic,
    bool? isSelect,
    bool? isVisible,
  }) {
    return DataItemVoucher(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      soctripVoucherType: soctripVoucherType ?? this.soctripVoucherType,
      voucherCode: voucherCode ?? this.voucherCode,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      avatarId: avatarId ?? this.avatarId,
      avatarType: avatarType ?? this.avatarType,
      discountPercent: discountPercent ?? this.discountPercent,
      maxDiscountPrice: maxDiscountPrice ?? this.maxDiscountPrice,
      minimumOrderPrice: minimumOrderPrice ?? this.minimumOrderPrice,
      soctripPaymentTypes: soctripPaymentTypes ?? this.soctripPaymentTypes,
      platform: platform ?? this.platform,
      description: description ?? this.description,
      objectRatingMin: objectRatingMin ?? this.objectRatingMin,
      objectRatingMax: objectRatingMax ?? this.objectRatingMax,
      registeredObjectMax: registeredObjectMax ?? this.registeredObjectMax,
      elementMax: elementMax ?? this.elementMax,
      quantityElementMax: quantityElementMax ?? this.quantityElementMax,
      elementRatingMin: elementRatingMin ?? this.elementRatingMin,
      elementRatingMax: elementRatingMax ?? this.elementRatingMax,
      percentShare: percentShare ?? this.percentShare,
      status: status ?? this.status,
      voucherUsed: voucherUsed ?? this.voucherUsed,
      usedAmount: usedAmount ?? this.usedAmount,
      shopStatus: shopStatus ?? this.shopStatus,
      isExpiredDate: isExpiredDate ?? this.isExpiredDate,
      isLimitDiscountAmount:
          isLimitDiscountAmount ?? this.isLimitDiscountAmount,
      isLimitObjectRegister:
          isLimitObjectRegister ?? this.isLimitObjectRegister,
      isShareBenefit: isShareBenefit ?? this.isShareBenefit,
      isPublic: isPublic ?? this.isPublic,
      isSelect: isSelect ?? this.isSelect,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

/// id : "a1c30470-d1d8-4f73-b35e-0c378ba87f70"
/// name : "QR code"
/// code : "QR"

class SoctripPaymentTypes {
  SoctripPaymentTypes({
      String? id, 
      String? name, 
      String? code,}){
    _id = id;
    _name = name;
    _code = code;
}

  SoctripPaymentTypes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
  }
  String? _id;
  String? _name;
  String? _code;
SoctripPaymentTypes copyWith({  String? id,
  String? name,
  String? code,
}) => SoctripPaymentTypes(  id: id ?? _id,
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

/// id : "de92d6a4-7e7c-474d-b67f-1d612b4d7ff5"
/// name : "Livestream voucher"
/// code : "LIVESTREAM"
/// icon : "20230929T104956553783042_00000000-0000-0000-0000-000000000000_LIVESTREAM"
/// color : "#FFF1F3"
/// description : "LIVESTREAM"

class SoctripVoucherType {
  SoctripVoucherType({
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

  SoctripVoucherType.fromJson(dynamic json) {
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
SoctripVoucherType copyWith({  String? id,
  String? name,
  String? code,
  String? icon,
  String? color,
  String? description,
}) => SoctripVoucherType(  id: id ?? _id,
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