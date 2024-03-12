import 'package:json_annotation/json_annotation.dart';

part 'logo_shop.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class LogoShop {
  LogoShop({
      DataFile? data,
      bool? success, 
      dynamic error,}){
    _data = data;
    _success = success;
    _error = error;
}

  LogoShop.fromJson(dynamic json) {
    _data = json['data'] != null ? DataFile.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
  }
  DataFile? _data;
  bool? _success;
  dynamic _error;
LogoShop copyWith({  DataFile? data,
  bool? success,
  dynamic error,
}) => LogoShop(  data: data ?? _data,
  success: success ?? _success,
  error: error ?? _error,
);
  DataFile? get data => _data;
  bool? get success => _success;
  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    map['error'] = _error;
    return map;
  }

}

/// id : "20231020T143456866883906_00000000-0000-0000-0000-000000000000_1023221329"
/// extension : ".jpg"
/// original_name : "1023221329.jpg"
/// type : "image/jpeg"
/// size : 1070401
/// description : ""
/// signature : "3aa9f193fbcea5c649579c6a35df53e9"
/// qualities : null

class DataFile {
  DataFile({
      String? id, 
      String? extension, 
      String? originalName, 
      String? type, 
      num? size, 
      String? description, 
      String? signature, 
      dynamic qualities,}){
    _id = id;
    _extension = extension;
    _originalName = originalName;
    _type = type;
    _size = size;
    _description = description;
    _signature = signature;
    _qualities = qualities;
}

  DataFile.fromJson(dynamic json) {
    _id = json['id'];
    _extension = json['extension'];
    _originalName = json['original_name'];
    _type = json['type'];
    _size = json['size'];
    _description = json['description'];
    _signature = json['signature'];
    _qualities = json['qualities'];
  }
  String? _id;
  String? _extension;
  String? _originalName;
  String? _type;
  num? _size;
  String? _description;
  String? _signature;
  dynamic _qualities;
DataFile copyWith({  String? id,
  String? extension,
  String? originalName,
  String? type,
  num? size,
  String? description,
  String? signature,
  dynamic qualities,
}) => DataFile(  id: id ?? _id,
  extension: extension ?? _extension,
  originalName: originalName ?? _originalName,
  type: type ?? _type,
  size: size ?? _size,
  description: description ?? _description,
  signature: signature ?? _signature,
  qualities: qualities ?? _qualities,
);
  String? get id => _id;
  String? get extension => _extension;
  String? get originalName => _originalName;
  String? get type => _type;
  num? get size => _size;
  String? get description => _description;
  String? get signature => _signature;
  dynamic get qualities => _qualities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extension'] = _extension;
    map['original_name'] = _originalName;
    map['type'] = _type;
    map['size'] = _size;
    map['description'] = _description;
    map['signature'] = _signature;
    map['qualities'] = _qualities;
    return map;
  }

}