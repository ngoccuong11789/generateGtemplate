import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInRequestModel {
  final String phoneOrEmail;
  final String password;
  final String? device;
  final String areaCode;
  SignInRequestModel({
    required this.phoneOrEmail,
    required this.password,
    this.device,
    required this.areaCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_or_email': phoneOrEmail,
      'password': password,
      'device': device,
      'area_code': areaCode,
    };
  }

  factory SignInRequestModel.fromMap(Map<String, dynamic> map) {
    return SignInRequestModel(
      phoneOrEmail: map['phone_or_email'] as String,
      password: map['password'] as String,
      device: map['device'] != null ? map['device'] as String : null,
      areaCode: map['area_code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInRequestModel.fromJson(String source) =>
      SignInRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignInRequestModel(phoneOrEmail: $phoneOrEmail, password: $password, device: $device, areaCode: $areaCode)';
  }
}
