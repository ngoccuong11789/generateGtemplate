import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AuthModel {
  final String accessToken;
  final String refreshToken;
  final String refreshTokenExpiryDate;
  final String accessTokenExpiryDate;
  final String device;
  final User user;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
    required this.refreshTokenExpiryDate,
    required this.accessTokenExpiryDate,
    required this.device,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String id;
  String firstName;
  String fullName;
  String lastName;
  int numberOfMutualFriend;
  String avatarThumbnailUrl;
  String? frameUrl;

  User({
    required this.id,
    required this.firstName,
    required this.fullName,
    required this.lastName,
    required this.numberOfMutualFriend,
    required this.avatarThumbnailUrl,
    this.frameUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
