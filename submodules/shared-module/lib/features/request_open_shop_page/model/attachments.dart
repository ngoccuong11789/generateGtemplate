import 'package:equatable/equatable.dart';

import 'attachment.dart';

class Attachments extends Equatable {
  final Attachment logo;
  final Attachment prop1;
  final Attachment prop2;
  final Attachment prop3;
  final int numOfAttachments;

  const Attachments({
    required this.logo,
    required this.prop1,
    required this.prop2,
    required this.prop3,
    this.numOfAttachments = 2,
  });

  Attachments copyWith({
    Attachment? logo,
    Attachment? prop1,
    Attachment? prop2,
    Attachment? prop3,
    int? numOfAttachments,
  }) {
    return Attachments(
      logo: logo ?? this.logo,
      prop1: prop1 ?? this.prop1,
      prop2: prop2 ?? this.prop2,
      prop3: prop3 ?? this.prop3,
      numOfAttachments: numOfAttachments ?? this.numOfAttachments,
    );
  }

  @override
  List<Object?> get props => [
        logo,
        prop1,
        prop2,
        prop3,
        numOfAttachments,
      ];
}



// /// additionalProp1 : {"id":"20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n","extension":".jpg","original_name":"333323209_2082633691930624_5586690523737888314_n.jpg","size":45547,"type":"image/jpeg","description":"Hình ảnh quần áo trẻ em","content":"string","signature":"f8fd3be48804059c32dfdc9425404745"}
// /// additionalProp2 : {"id":"20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n","extension":".jpg","original_name":"333323209_2082633691930624_5586690523737888314_n.jpg","size":45547,"type":"image/jpeg","description":"Hình ảnh quần áo trẻ em","content":"string","signature":"f8fd3be48804059c32dfdc9425404745"}
// /// additionalProp3 : {"id":"20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n","extension":".jpg","original_name":"333323209_2082633691930624_5586690523737888314_n.jpg","size":45547,"type":"image/jpeg","description":"Hình ảnh quần áo trẻ em","content":"string","signature":"f8fd3be48804059c32dfdc9425404745"}

// class Attachments {
//   Attachments({
//     AdditionalProp1? additionalProp1,
//     AdditionalProp2? additionalProp2,
//     AdditionalProp3? additionalProp3,
//   }) {
//     _additionalProp1 = additionalProp1;
//     _additionalProp2 = additionalProp2;
//     _additionalProp3 = additionalProp3;
//   }

//   Attachments.fromJson(dynamic json) {
//     _additionalProp1 = json['additionalProp1'] != null
//         ? AdditionalProp1.fromJson(json['additionalProp1'])
//         : null;
//     _additionalProp2 = json['additionalProp2'] != null
//         ? AdditionalProp2.fromJson(json['additionalProp2'])
//         : null;
//     _additionalProp3 = json['additionalProp3'] != null
//         ? AdditionalProp3.fromJson(json['additionalProp3'])
//         : null;
//   }
//   AdditionalProp1? _additionalProp1;
//   AdditionalProp2? _additionalProp2;
//   AdditionalProp3? _additionalProp3;
//   Attachments copyWith({
//     AdditionalProp1? additionalProp1,
//     AdditionalProp2? additionalProp2,
//     AdditionalProp3? additionalProp3,
//   }) =>
//       Attachments(
//         additionalProp1: additionalProp1 ?? _additionalProp1,
//         additionalProp2: additionalProp2 ?? _additionalProp2,
//         additionalProp3: additionalProp3 ?? _additionalProp3,
//       );
//   AdditionalProp1? get additionalProp1 => _additionalProp1;
//   AdditionalProp2? get additionalProp2 => _additionalProp2;
//   AdditionalProp3? get additionalProp3 => _additionalProp3;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_additionalProp1 != null) {
//       map['additionalProp1'] = _additionalProp1?.toJson();
//     }
//     if (_additionalProp2 != null) {
//       map['additionalProp2'] = _additionalProp2?.toJson();
//     }
//     if (_additionalProp3 != null) {
//       map['additionalProp3'] = _additionalProp3?.toJson();
//     }
//     return map;
//   }
// }

// /// id : "20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n"
// /// extension : ".jpg"
// /// original_name : "333323209_2082633691930624_5586690523737888314_n.jpg"
// /// size : 45547
// /// type : "image/jpeg"
// /// description : "Hình ảnh quần áo trẻ em"
// /// content : "string"
// /// signature : "f8fd3be48804059c32dfdc9425404745"

// class AdditionalProp1 {
//   AdditionalProp1({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? content,
//     String? signature,
//   }) {
//     _id = id;
//     _extension = extension;
//     _originalName = originalName;
//     _size = size;
//     _type = type;
//     _description = description;
//     _content = content;
//     _signature = signature;
//   }

//   AdditionalProp1.fromJson(dynamic json) {
//     _id = json['id'];
//     _extension = json['extension'];
//     _originalName = json['original_name'];
//     _size = json['size'];
//     _type = json['type'];
//     _description = json['description'];
//     _content = json['content'];
//     _signature = json['signature'];
//   }
//   String? _id;
//   String? _extension;
//   String? _originalName;
//   num? _size;
//   String? _type;
//   String? _description;
//   String? _content;
//   String? _signature;
//   AdditionalProp1 copyWith({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? content,
//     String? signature,
//   }) =>
//       AdditionalProp1(
//         id: id ?? _id,
//         extension: extension ?? _extension,
//         originalName: originalName ?? _originalName,
//         size: size ?? _size,
//         type: type ?? _type,
//         description: description ?? _description,
//         content: content ?? _content,
//         signature: signature ?? _signature,
//       );
//   String? get id => _id;
//   String? get extension => _extension;
//   String? get originalName => _originalName;
//   num? get size => _size;
//   String? get type => _type;
//   String? get description => _description;
//   String? get content => _content;
//   String? get signature => _signature;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['extension'] = _extension;
//     map['original_name'] = _originalName;
//     map['size'] = _size;
//     map['type'] = _type;
//     map['description'] = _description;
//     map['content'] = _content;
//     map['signature'] = _signature;
//     return map;
//   }
// }

// /// id : "20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n"
// /// extension : ".jpg"
// /// original_name : "333323209_2082633691930624_5586690523737888314_n.jpg"
// /// size : 45547
// /// type : "image/jpeg"
// /// description : "Hình ảnh quần áo trẻ em"
// /// content : "string"
// /// signature : "f8fd3be48804059c32dfdc9425404745"

// class AdditionalProp2 {
//   AdditionalProp2({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? content,
//     String? signature,
//   }) {
//     _id = id;
//     _extension = extension;
//     _originalName = originalName;
//     _size = size;
//     _type = type;
//     _description = description;
//     _content = content;
//     _signature = signature;
//   }

//   AdditionalProp2.fromJson(dynamic json) {
//     _id = json['id'];
//     _extension = json['extension'];
//     _originalName = json['original_name'];
//     _size = json['size'];
//     _type = json['type'];
//     _description = json['description'];
//     _content = json['content'];
//     _signature = json['signature'];
//   }
//   String? _id;
//   String? _extension;
//   String? _originalName;
//   num? _size;
//   String? _type;
//   String? _description;
//   String? _content;
//   String? _signature;
//   AdditionalProp2 copyWith({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? content,
//     String? signature,
//   }) =>
//       AdditionalProp2(
//         id: id ?? _id,
//         extension: extension ?? _extension,
//         originalName: originalName ?? _originalName,
//         size: size ?? _size,
//         type: type ?? _type,
//         description: description ?? _description,
//         content: content ?? _content,
//         signature: signature ?? _signature,
//       );
//   String? get id => _id;
//   String? get extension => _extension;
//   String? get originalName => _originalName;
//   num? get size => _size;
//   String? get type => _type;
//   String? get description => _description;
//   String? get content => _content;
//   String? get signature => _signature;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['extension'] = _extension;
//     map['original_name'] = _originalName;
//     map['size'] = _size;
//     map['type'] = _type;
//     map['description'] = _description;
//     map['content'] = _content;
//     map['signature'] = _signature;
//     return map;
//   }
// }

// /// id : "20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n"
// /// extension : ".jpg"
// /// original_name : "333323209_2082633691930624_5586690523737888314_n.jpg"
// /// size : 45547
// /// type : "image/jpeg"
// /// description : "Hình ảnh quần áo trẻ em"
// /// content : "string"
// /// signature : "f8fd3be48804059c32dfdc9425404745"

// class AdditionalProp3 {
//   AdditionalProp3({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? content,
//     String? signature,
//   }) {
//     _id = id;
//     _extension = extension;
//     _originalName = originalName;
//     _size = size;
//     _type = type;
//     _description = description;
//     _content = content;
//     _signature = signature;
//   }

//   AdditionalProp3.fromJson(dynamic json) {
//     _id = json['id'];
//     _extension = json['extension'];
//     _originalName = json['original_name'];
//     _size = json['size'];
//     _type = json['type'];
//     _description = json['description'];
//     _content = json['content'];
//     _signature = json['signature'];
//   }
//   String? _id;
//   String? _extension;
//   String? _originalName;
//   num? _size;
//   String? _type;
//   String? _description;
//   String? _content;
//   String? _signature;
//   AdditionalProp3 copyWith({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? content,
//     String? signature,
//   }) =>
//       AdditionalProp3(
//         id: id ?? _id,
//         extension: extension ?? _extension,
//         originalName: originalName ?? _originalName,
//         size: size ?? _size,
//         type: type ?? _type,
//         description: description ?? _description,
//         content: content ?? _content,
//         signature: signature ?? _signature,
//       );
//   String? get id => _id;
//   String? get extension => _extension;
//   String? get originalName => _originalName;
//   num? get size => _size;
//   String? get type => _type;
//   String? get description => _description;
//   String? get content => _content;
//   String? get signature => _signature;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['extension'] = _extension;
//     map['original_name'] = _originalName;
//     map['size'] = _size;
//     map['type'] = _type;
//     map['description'] = _description;
//     map['content'] = _content;
//     map['signature'] = _signature;
//     return map;
//   }
// }
