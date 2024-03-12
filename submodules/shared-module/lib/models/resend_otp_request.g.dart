// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpRequest _$ResendOtpRequestFromJson(Map<String, dynamic> json) =>
    ResendOtpRequest(
      phoneOrEmail: json['phone_or_email'] as String,
      areaCode: json['area_code'] as String,
      check: json['check'] as bool,
    );

Map<String, dynamic> _$ResendOtpRequestToJson(ResendOtpRequest instance) =>
    <String, dynamic>{
      'phone_or_email': instance.phoneOrEmail,
      'area_code': instance.areaCode,
      'check': instance.check,
    };
