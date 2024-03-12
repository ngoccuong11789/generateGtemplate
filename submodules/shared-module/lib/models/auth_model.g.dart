// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      refreshTokenExpiryDate: json['refresh_token_expiry_date'] as String,
      accessTokenExpiryDate: json['access_token_expiry_date'] as String,
      device: json['device'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'refresh_token_expiry_date': instance.refreshTokenExpiryDate,
      'access_token_expiry_date': instance.accessTokenExpiryDate,
      'device': instance.device,
      'user': instance.user.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      fullName: json['full_name'] as String,
      lastName: json['last_name'] as String,
      numberOfMutualFriend: json['number_of_mutual_friend'] as int,
      avatarThumbnailUrl: json['avatar_thumbnail_url'] as String,
      frameUrl: json['frame_url'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'full_name': instance.fullName,
      'last_name': instance.lastName,
      'number_of_mutual_friend': instance.numberOfMutualFriend,
      'avatar_thumbnail_url': instance.avatarThumbnailUrl,
      'frame_url': instance.frameUrl,
    };
