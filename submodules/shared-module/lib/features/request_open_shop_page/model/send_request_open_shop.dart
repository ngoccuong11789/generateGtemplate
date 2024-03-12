import 'dart:core';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'send_request_open_shop.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class SendRequestOpenShop {
  final String? name;
  final String? ownerName;
  final String? phone;
  final CountryRequest? country;
  final ProvinceRequest? province;
  final DistrictRequest? district;
  final WardRequest? ward;
  final String? street;
  final String? subStreet;
  final String? email;
  final String? idCard;
  final DateTime? openTime;
  final DateTime? closedTime;
  final List<String>? workingDays;
  final String? address;
  final String? googleMapUrl;
  final double? longitude;
  final double? latitude;
  final Avatar? avatar;
  final Map<String,dynamic>? attachments;

  SendRequestOpenShop(
      this.name,
      this.ownerName,
      this.phone,
      this.country,
      this.province,
      this.district,
      this.ward,
      this.street,
      this.subStreet,
      this.email,
      this.idCard,
      this.openTime,
      this.closedTime,
      this.workingDays,
      this.address,
      this.googleMapUrl,
      this.longitude,
      this.latitude,
      this.avatar,
      this.attachments,);
  factory SendRequestOpenShop.fromJson(Map<String, dynamic> json) {
    return _$SendRequestOpenShopFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendRequestOpenShopToJson(this);
  }
}

class Avatar {
  Avatar({
      String? id, 
      String? name, 
      String? extension, 
      String? originalName, 
      num? size, 
      String? type, 
      String? description, 
      String? content,}){
    _id = id;
    _name = name;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
}

  Avatar.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _content = json['content'];
  }
  String? _id;
  String? _name;
  String? _extension;
  String? _originalName;
  num? _size;
  String? _type;
  String? _description;
  String? _content;
Avatar copyWith({  String? id,
  String? name,
  String? extension,
  String? originalName,
  num? size,
  String? type,
  String? description,
  String? content,
}) => Avatar(  id: id ?? _id,
  name: name ?? _name,
  extension: extension ?? _extension,
  originalName: originalName ?? _originalName,
  size: size ?? _size,
  type: type ?? _type,
  description: description ?? _description,
  content: content ?? _content,
);
  String? get id => _id;
  String? get name => _name;
  String? get extension => _extension;
  String? get originalName => _originalName;
  num? get size => _size;
  String? get type => _type;
  String? get description => _description;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['content'] = _content;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class WardRequest {
  WardRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  WardRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
WardRequest copyWith({  String? id,
  String? code,
  String? name,
}) => WardRequest(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class DistrictRequest {
  DistrictRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  DistrictRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
DistrictRequest copyWith({  String? id,
  String? code,
  String? name,
}) => DistrictRequest(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class ProvinceRequest {
  ProvinceRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  ProvinceRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
ProvinceRequest copyWith({  String? id,
  String? code,
  String? name,
}) => ProvinceRequest(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// code : "string"
/// name : "string"

class CountryRequest {
  CountryRequest({
      String? id, 
      String? code, 
      String? name,}){
    _id = id;
    _code = code;
    _name = name;
}

  CountryRequest.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }
  String? _id;
  String? _code;
  String? _name;
CountryRequest copyWith({  String? id,
  String? code,
  String? name,
}) => CountryRequest(  id: id ?? _id,
  code: code ?? _code,
  name: name ?? _name,
);
  String? get id => _id;
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }


}
class AttachmentDTO {
  AttachmentDTO({
    String? id,
    String? name,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? content,}){
    _id = id;
    _name = name;
    _extension = extension;
    _originalName = originalName;
    _size = size;
    _type = type;
    _description = description;
    _content = content;
  }

  AttachmentDTO.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _size = json['size'];
    _type = json['type'];
    _description = json['description'];
    _content = json['content'];
  }
  String? _id;
  String? _name;
  String? _extension;
  String? _originalName;
  num? _size;
  String? _type;
  String? _description;
  String? _content;
  AttachmentDTO copyWith({  String? id,
    String? name,
    String? extension,
    String? originalName,
    num? size,
    String? type,
    String? description,
    String? content,
  }) => AttachmentDTO(  id: id ?? _id,
    name: name ?? _name,
    extension: extension ?? _extension,
    originalName: originalName ?? _originalName,
    size: size ?? _size,
    type: type ?? _type,
    description: description ?? _description,
    content: content ?? _content,
  );
  String? get id => _id;
  String? get name => _name;
  String? get extension => _extension;
  String? get originalName => _originalName;
  num? get size => _size;
  String? get type => _type;
  String? get description => _description;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['size'] = _size;
    map['type'] = _type;
    map['description'] = _description;
    map['content'] = _content;
    return map;
  }

}