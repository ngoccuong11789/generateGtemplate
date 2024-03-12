// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRequest _$VerifyRequestFromJson(Map<String, dynamic> json) =>
    VerifyRequest(
      phoneOrEmail: json['phone_or_email'] as String,
      getCodeVerification: json['get_code_verification'] as String,
      areaCode: json['area_code'] as String?,
    );

Map<String, dynamic> _$VerifyRequestToJson(VerifyRequest instance) =>
    <String, dynamic>{
      'phone_or_email': instance.phoneOrEmail,
      'get_code_verification': instance.getCodeVerification,
      'area_code': instance.areaCode,
    };
