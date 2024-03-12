import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RefreshTokenRequest {
  final String? refreshToken;
  final String? device;

  RefreshTokenRequest({
    this.refreshToken,
    this.device,
  });

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);

  RefreshTokenRequest copyWith({
    String? refreshToken,
    String? device,
  }) {
    return RefreshTokenRequest(
      refreshToken: refreshToken ?? this.refreshToken,
      device: device ?? this.device,
    );
  }
}
