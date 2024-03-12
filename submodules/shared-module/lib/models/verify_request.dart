import 'package:json_annotation/json_annotation.dart';

part 'verify_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VerifyRequest {
  final String phoneOrEmail;
  final String getCodeVerification;
  final String? areaCode;

  VerifyRequest({
    required this.phoneOrEmail,
    required this.getCodeVerification,
    this.areaCode,
  });

  factory VerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestToJson(this);
}
