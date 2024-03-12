import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResendOtpRequest {
  final String phoneOrEmail;
  final String areaCode;
  final bool check;

  ResendOtpRequest({
    required this.phoneOrEmail,
    required this.areaCode,
    required this.check,
  });

  factory ResendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpRequestToJson(this);
}
