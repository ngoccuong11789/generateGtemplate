// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(
      phoneOrEmail: json['phone_or_email'] as String,
      password: json['password'] as String,
      device: json['device'] as String?,
      areaCode: json['area_code'] as String,
    );

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'phone_or_email': instance.phoneOrEmail,
      'password': instance.password,
      'device': instance.device,
      'area_code': instance.areaCode,
    };
