// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String,
      extension: json['extension'] as String?,
      originalName: json['original_name'] as String?,
      size: json['size'] as int?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'extension': instance.extension,
      'original_name': instance.originalName,
      'size': instance.size,
      'type': instance.type,
      'description': instance.description,
      'signature': instance.signature,
    };
