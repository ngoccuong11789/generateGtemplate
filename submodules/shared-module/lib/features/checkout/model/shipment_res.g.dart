// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentRes _$ShipmentResFromJson(Map<String, dynamic> json) => ShipmentRes(
      data:
          (json['data'] as List<dynamic>?)?.map(ItemShipment.fromJson).toList(),
    );

Map<String, dynamic> _$ShipmentResToJson(ShipmentRes instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
