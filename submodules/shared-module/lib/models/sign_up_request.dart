import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SignUpRequest {
  final String? phone;
  final String? email;
  final String firstName;
  final String lastName;
  final String invitedByCode;
  final String password;
  final String? areaCode;
  final String systemLanguage;

  SignUpRequest({
    this.phone,
    this.email,
    required this.firstName,
    required this.lastName,
    required this.invitedByCode,
    required this.password,
    this.areaCode,
    required this.systemLanguage,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
