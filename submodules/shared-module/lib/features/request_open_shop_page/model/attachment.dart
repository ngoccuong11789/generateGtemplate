import 'dart:io';

import 'package:equatable/equatable.dart';

class Attachment extends Equatable {
  final File? image;
  final String original_name;
  final String description;

  const Attachment({
    this.image,
    this.original_name = "",
    this.description = "",
  });

  Attachment copyWith({
    File? image,
    String? original_name,
    String? description,
  }) {
    return Attachment(
      image: image ?? this.image,
      original_name: original_name ?? this.original_name,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
        image,
        original_name,
        description,
      ];
}

// /// id : "20230807T085936767686414732cee849a48462f843f2286b187d36e33332320920826336919306245586690523737888314n"
// /// extension : ".jpg"
// /// original_name : "333323209_2082633691930624_5586690523737888314_n.jpg"
// /// size : 45547
// /// type : "image/jpeg"
// /// description : "Hình ảnh quần áo trẻ em"
// /// signature : "f8fd3be48804059c32dfdc9425404745"

// class Attachment {
//   Attachment({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? signature,
//   }) {
//     _id = id;
//     _extension = extension;
//     _originalName = originalName;
//     _size = size;
//     _type = type;
//     _description = description;
//     _signature = signature;
//   }

//   Attachment.fromJson(dynamic json) {
//     _id = json['id'];
//     _extension = json['extension'];
//     _originalName = json['original_name'];
//     _size = json['size'];
//     _type = json['type'];
//     _description = json['description'];
//     _signature = json['signature'];
//   }
//   String? _id;
//   String? _extension;
//   String? _originalName;
//   num? _size;
//   String? _type;
//   String? _description;
//   String? _signature;
//   Attachment copyWith({
//     String? id,
//     String? extension,
//     String? originalName,
//     num? size,
//     String? type,
//     String? description,
//     String? signature,
//   }) =>
//       Attachment(
//         id: id ?? _id,
//         extension: extension ?? _extension,
//         originalName: originalName ?? _originalName,
//         size: size ?? _size,
//         type: type ?? _type,
//         description: description ?? _description,
//         signature: signature ?? _signature,
//       );
//   String? get id => _id;
//   String? get extension => _extension;
//   String? get originalName => _originalName;
//   num? get size => _size;
//   String? get type => _type;
//   String? get description => _description;
//   String? get signature => _signature;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['extension'] = _extension;
//     map['original_name'] = _originalName;
//     map['size'] = _size;
//     map['type'] = _type;
//     map['description'] = _description;
//     map['signature'] = _signature;
//     return map;
//   }
// }
