import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Attachment {
  final String id;
  final String? extension;
  final String? originalName;
  final int? size;
  final String? type;
  final String? description;
  final String? signature;

  Attachment(
      {required this.id,
      this.extension,
      this.originalName,
      this.size,
      this.type,
      this.description,
      this.signature});

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
