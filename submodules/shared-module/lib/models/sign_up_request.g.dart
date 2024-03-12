// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      invitedByCode: json['invited_by_code'] as String,
      password: json['password'] as String,
      areaCode: json['area_code'] as String?,
      systemLanguage: json['system_language'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'invited_by_code': instance.invitedByCode,
      'password': instance.password,
      'area_code': instance.areaCode,
      'system_language': instance.systemLanguage,
    };
