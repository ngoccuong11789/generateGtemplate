import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SignInRequest {
  final String phoneOrEmail;
  final String password;
  final String? device;
  final String areaCode;

  SignInRequest({
    required this.phoneOrEmail,
    required this.password,
    this.device,
    required this.areaCode,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
