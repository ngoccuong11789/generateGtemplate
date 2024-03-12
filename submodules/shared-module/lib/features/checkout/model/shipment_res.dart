import 'package:json_annotation/json_annotation.dart';

/// data : [{"id":"MTFfMTFfMTczNQ==","carrier_name":"Speedlink","carrier_logo":"http://sandbox.goship.io/storage/images/carriers/2020_09_25_14_21_26_7c7769c52a1f50a2325d4d2591ffb4be.png","carrier_short_name":"spl","service":"Nhanh","expected":"Dự kiến giao 3 ngày","promotion_id":0,"discount":0,"weight_fee":0,"location_first_fee":26000,"location_step_fee":0,"remote_area_fee":0,"oil_fee":0,"location_fee":26000,"cod_fee":0,"service_fee":2300,"total_fee":28300,"total_amount":28300,"total_amount_carrier":0,"total_amount_shop":-28300,"price_table_id":1735,"insurrance_fee":0,"return_fee":0,"_apply_only":false},{"id":"MTJfMTdfMTU1OQ==","carrier_name":"Giao Hàng Nhanh (v3)","carrier_logo":"http://sandbox.goship.io/storage/images/carriers/2018_11_19_08_58_42_a44867924ab27607d9a5e12142d7503e.png","carrier_short_name":"ghn","service":"Tiêu chuẩn","expected":"Dự kiến giao 3 ngày","promotion_id":0,"discount":0,"weight_fee":0,"location_first_fee":28000,"location_step_fee":0,"remote_area_fee":0,"oil_fee":0,"location_fee":28000,"cod_fee":0,"service_fee":2400,"total_fee":30400,"total_amount":30400,"total_amount_carrier":0,"total_amount_shop":-30400,"price_table_id":1559,"insurrance_fee":0,"return_fee":0,"_apply_only":false},{"id":"MTNfN18xNjE2","carrier_name":"Giao Hàng Tiết Kiệm","carrier_logo":"http://sandbox.goship.io/storage/images/carriers/2020_09_25_14_23_48_30f225685c73209e5762a5694a16cf97.png","carrier_short_name":"ghtk","service":"Tiết kiệm","expected":"Dự kiến giao 6 ngày","promotion_id":0,"discount":0,"weight_fee":0,"location_first_fee":37000,"location_step_fee":0,"remote_area_fee":0,"oil_fee":0,"location_fee":37000,"cod_fee":0,"service_fee":2850,"total_fee":39850,"total_amount":39850,"total_amount_carrier":0,"total_amount_shop":-39850,"price_table_id":1616,"insurrance_fee":0,"return_fee":19925,"_apply_only":false},{"id":"MTFfN18xMTk1","carrier_name":"Giao Hàng Tiết Kiệm","carrier_logo":"http://sandbox.goship.io/storage/images/carriers/2020_09_25_14_23_48_30f225685c73209e5762a5694a16cf97.png","carrier_short_name":"ghtk","service":"Nhanh","expected":"Dự kiến giao 2 ngày","promotion_id":0,"discount":0,"weight_fee":0,"location_first_fee":50000,"location_step_fee":0,"remote_area_fee":0,"oil_fee":0,"location_fee":50000,"cod_fee":0,"service_fee":3500,"total_fee":53500,"total_amount":53500,"total_amount_carrier":0,"total_amount_shop":-53500,"price_table_id":1195,"insurrance_fee":0,"return_fee":26750,"_apply_only":false}]
/// success : true
/// error : null
part 'shipment_res.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class ShipmentRes {
  final List<ItemShipment>? data;

  ShipmentRes({this.data});

  factory ShipmentRes.fromJson(Map<String, dynamic> json) {
    return _$ShipmentResFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShipmentResToJson(this);
  }

  ShipmentRes copyWith({
    List<ItemShipment>? data,
  }) {
    return ShipmentRes(
      data: data ?? this.data,
    );
  }
}

/// id : "MTFfMTFfMTczNQ=="
/// carrier_name : "Speedlink"
/// carrier_logo : "http://sandbox.goship.io/storage/images/carriers/2020_09_25_14_21_26_7c7769c52a1f50a2325d4d2591ffb4be.png"
/// carrier_short_name : "spl"
/// service : "Nhanh"
/// expected : "Dự kiến giao 3 ngày"
/// promotion_id : 0
/// discount : 0
/// weight_fee : 0
/// location_first_fee : 26000
/// location_step_fee : 0
/// remote_area_fee : 0
/// oil_fee : 0
/// location_fee : 26000
/// cod_fee : 0
/// service_fee : 2300
/// total_fee : 28300
/// total_amount : 28300
/// total_amount_carrier : 0
/// total_amount_shop : -28300
/// price_table_id : 1735
/// insurrance_fee : 0
/// return_fee : 0
/// _apply_only : false

class ItemShipment {
  ItemShipment({
      String? id, 
      String? carrierName, 
      String? carrierLogo, 
      String? carrierShortName, 
      String? service, 
      String? expected, 
      num? promotionId, 
      num? discount, 
      num? weightFee, 
      num? locationFirstFee, 
      num? locationStepFee, 
      num? remoteAreaFee, 
      num? oilFee, 
      num? locationFee, 
      num? codFee, 
      num? serviceFee, 
      num? totalFee, 
      num? totalAmount, 
      num? totalAmountCarrier, 
      num? totalAmountShop, 
      num? priceTableId, 
      num? insurranceFee, 
      num? returnFee, 
      bool? applyOnly,}){
    _id = id;
    _carrierName = carrierName;
    _carrierLogo = carrierLogo;
    _carrierShortName = carrierShortName;
    _service = service;
    _expected = expected;
    _promotionId = promotionId;
    _discount = discount;
    _weightFee = weightFee;
    _locationFirstFee = locationFirstFee;
    _locationStepFee = locationStepFee;
    _remoteAreaFee = remoteAreaFee;
    _oilFee = oilFee;
    _locationFee = locationFee;
    _codFee = codFee;
    _serviceFee = serviceFee;
    _totalFee = totalFee;
    _totalAmount = totalAmount;
    _totalAmountCarrier = totalAmountCarrier;
    _totalAmountShop = totalAmountShop;
    _priceTableId = priceTableId;
    _insurranceFee = insurranceFee;
    _returnFee = returnFee;
    _applyOnly = applyOnly;
}

  ItemShipment.fromJson(dynamic json) {
    _id = json['id'];
    _carrierName = json['carrier_name'];
    _carrierLogo = json['carrier_logo'];
    _carrierShortName = json['carrier_short_name'];
    _service = json['service'];
    _expected = json['expected'];
    _promotionId = json['promotion_id'];
    _discount = json['discount'];
    _weightFee = json['weight_fee'];
    _locationFirstFee = json['location_first_fee'];
    _locationStepFee = json['location_step_fee'];
    _remoteAreaFee = json['remote_area_fee'];
    _oilFee = json['oil_fee'];
    _locationFee = json['location_fee'];
    _codFee = json['cod_fee'];
    _serviceFee = json['service_fee'];
    _totalFee = json['total_fee'];
    _totalAmount = json['total_amount'];
    _totalAmountCarrier = json['total_amount_carrier'];
    _totalAmountShop = json['total_amount_shop'];
    _priceTableId = json['price_table_id'];
    _insurranceFee = json['insurrance_fee'];
    _returnFee = json['return_fee'];
    _applyOnly = json['_apply_only'];
  }
  String? _id;
  String? _carrierName;
  String? _carrierLogo;
  String? _carrierShortName;
  String? _service;
  String? _expected;
  num? _promotionId;
  num? _discount;
  num? _weightFee;
  num? _locationFirstFee;
  num? _locationStepFee;
  num? _remoteAreaFee;
  num? _oilFee;
  num? _locationFee;
  num? _codFee;
  num? _serviceFee;
  num? _totalFee;
  num? _totalAmount;
  num? _totalAmountCarrier;
  num? _totalAmountShop;
  num? _priceTableId;
  num? _insurranceFee;
  num? _returnFee;
  bool? _applyOnly;
ItemShipment copyWith({  String? id,
  String? carrierName,
  String? carrierLogo,
  String? carrierShortName,
  String? service,
  String? expected,
  num? promotionId,
  num? discount,
  num? weightFee,
  num? locationFirstFee,
  num? locationStepFee,
  num? remoteAreaFee,
  num? oilFee,
  num? locationFee,
  num? codFee,
  num? serviceFee,
  num? totalFee,
  num? totalAmount,
  num? totalAmountCarrier,
  num? totalAmountShop,
  num? priceTableId,
  num? insurranceFee,
  num? returnFee,
  bool? applyOnly,
}) => ItemShipment(  id: id ?? _id,
  carrierName: carrierName ?? _carrierName,
  carrierLogo: carrierLogo ?? _carrierLogo,
  carrierShortName: carrierShortName ?? _carrierShortName,
  service: service ?? _service,
  expected: expected ?? _expected,
  promotionId: promotionId ?? _promotionId,
  discount: discount ?? _discount,
  weightFee: weightFee ?? _weightFee,
  locationFirstFee: locationFirstFee ?? _locationFirstFee,
  locationStepFee: locationStepFee ?? _locationStepFee,
  remoteAreaFee: remoteAreaFee ?? _remoteAreaFee,
  oilFee: oilFee ?? _oilFee,
  locationFee: locationFee ?? _locationFee,
  codFee: codFee ?? _codFee,
  serviceFee: serviceFee ?? _serviceFee,
  totalFee: totalFee ?? _totalFee,
  totalAmount: totalAmount ?? _totalAmount,
  totalAmountCarrier: totalAmountCarrier ?? _totalAmountCarrier,
  totalAmountShop: totalAmountShop ?? _totalAmountShop,
  priceTableId: priceTableId ?? _priceTableId,
  insurranceFee: insurranceFee ?? _insurranceFee,
  returnFee: returnFee ?? _returnFee,
  applyOnly: applyOnly ?? _applyOnly,
);
  String? get id => _id;
  String? get carrierName => _carrierName;
  String? get carrierLogo => _carrierLogo;
  String? get carrierShortName => _carrierShortName;
  String? get service => _service;
  String? get expected => _expected;
  num? get promotionId => _promotionId;
  num? get discount => _discount;
  num? get weightFee => _weightFee;
  num? get locationFirstFee => _locationFirstFee;
  num? get locationStepFee => _locationStepFee;
  num? get remoteAreaFee => _remoteAreaFee;
  num? get oilFee => _oilFee;
  num? get locationFee => _locationFee;
  num? get codFee => _codFee;
  num? get serviceFee => _serviceFee;
  num? get totalFee => _totalFee;
  num? get totalAmount => _totalAmount;
  num? get totalAmountCarrier => _totalAmountCarrier;
  num? get totalAmountShop => _totalAmountShop;
  num? get priceTableId => _priceTableId;
  num? get insurranceFee => _insurranceFee;
  num? get returnFee => _returnFee;
  bool? get applyOnly => _applyOnly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['carrier_name'] = _carrierName;
    map['carrier_logo'] = _carrierLogo;
    map['carrier_short_name'] = _carrierShortName;
    map['service'] = _service;
    map['expected'] = _expected;
    map['promotion_id'] = _promotionId;
    map['discount'] = _discount;
    map['weight_fee'] = _weightFee;
    map['location_first_fee'] = _locationFirstFee;
    map['location_step_fee'] = _locationStepFee;
    map['remote_area_fee'] = _remoteAreaFee;
    map['oil_fee'] = _oilFee;
    map['location_fee'] = _locationFee;
    map['cod_fee'] = _codFee;
    map['service_fee'] = _serviceFee;
    map['total_fee'] = _totalFee;
    map['total_amount'] = _totalAmount;
    map['total_amount_carrier'] = _totalAmountCarrier;
    map['total_amount_shop'] = _totalAmountShop;
    map['price_table_id'] = _priceTableId;
    map['insurrance_fee'] = _insurranceFee;
    map['return_fee'] = _returnFee;
    map['_apply_only'] = _applyOnly;
    return map;
  }

}