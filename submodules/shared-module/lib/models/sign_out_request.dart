import 'package:json_annotation/json_annotation.dart';

part 'sign_out_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SignOutRequest {
  final String? refreshToken;
  final String? device;

  SignOutRequest({
    this.refreshToken,
    this.device,
  });

  factory SignOutRequest.fromJson(Map<String, dynamic> json) =>
      _$SignOutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignOutRequestToJson(this);

  SignOutRequest copyWith({
    String? refreshToken,
    String? device,
  }) {
    return SignOutRequest(
      refreshToken: refreshToken ?? this.refreshToken,
      device: device ?? this.device,
    );
  }
}
