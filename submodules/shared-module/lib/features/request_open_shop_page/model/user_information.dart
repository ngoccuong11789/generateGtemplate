import 'package:json_annotation/json_annotation.dart';

/// data : {"id":"edc999a7-c766-4620-ba46-fd0f1532db31","first_name":"Dev","last_name":"Soctrip 30","full_name":"Dev Soctrip 30","phone":"937891903","email":"soctrip30@yopmail.com","invited_by_code":"","invite_code":"ST4831939","status":"ACTIVE","username_id":"s3dev","country_name":null,"area_code":"+84","register_date":"11/10/2023","avatar_thumbnail_url":"/media/libraries/default/UserAvatar.jpg","frame_url":"","roles":["USER"],"created_at":"2023-10-11 10:22:00","updated_at":"2023-10-11 10:22:00","created_by":null,"updated_by":null,"is_friend":null,"relationship_status":null}

part 'user_information.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class UserInformation {
  UserInformation({
      User? data,}){
    _data = data;
}

  UserInformation.fromJson(dynamic json) {
    _data = json['data'] != null ? User.fromJson(json['data']) : null;
  }
  User? _data;
UserInformation copyWith({  User? data,
}) => UserInformation(  data: data ?? _data,
);
  User? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "edc999a7-c766-4620-ba46-fd0f1532db31"
/// first_name : "Dev"
/// last_name : "Soctrip 30"
/// full_name : "Dev Soctrip 30"
/// phone : "937891903"
/// email : "soctrip30@yopmail.com"
/// invited_by_code : ""
/// invite_code : "ST4831939"
/// status : "ACTIVE"
/// username_id : "s3dev"
/// country_name : null
/// area_code : "+84"
/// register_date : "11/10/2023"
/// avatar_thumbnail_url : "/media/libraries/default/UserAvatar.jpg"
/// frame_url : ""
/// roles : ["USER"]
/// created_at : "2023-10-11 10:22:00"
/// updated_at : "2023-10-11 10:22:00"
/// created_by : null
/// updated_by : null
/// is_friend : null
/// relationship_status : null

class User {
  User({
      String? id, 
      String? firstName, 
      String? lastName, 
      String? fullName, 
      String? phone, 
      String? email, 
      String? invitedByCode, 
      String? inviteCode, 
      String? status, 
      String? usernameId, 
      dynamic countryName, 
      String? areaCode, 
      String? registerDate, 
      String? avatarThumbnailUrl, 
      String? frameUrl, 
      List<String>? roles, 
      String? createdAt, 
      String? updatedAt, 
      dynamic createdBy, 
      dynamic updatedBy, 
      dynamic isFriend, 
      dynamic relationshipStatus,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _fullName = fullName;
    _phone = phone;
    _email = email;
    _invitedByCode = invitedByCode;
    _inviteCode = inviteCode;
    _status = status;
    _usernameId = usernameId;
    _countryName = countryName;
    _areaCode = areaCode;
    _registerDate = registerDate;
    _avatarThumbnailUrl = avatarThumbnailUrl;
    _frameUrl = frameUrl;
    _roles = roles;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _isFriend = isFriend;
    _relationshipStatus = relationshipStatus;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _fullName = json['full_name'];
    _phone = json['phone'];
    _email = json['email'];
    _invitedByCode = json['invited_by_code'];
    _inviteCode = json['invite_code'];
    _status = json['status'];
    _usernameId = json['username_id'];
    _countryName = json['country_name'];
    _areaCode = json['area_code'];
    _registerDate = json['register_date'];
    _avatarThumbnailUrl = json['avatar_thumbnail_url'];
    _frameUrl = json['frame_url'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _isFriend = json['is_friend'];
    _relationshipStatus = json['relationship_status'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _fullName;
  String? _phone;
  String? _email;
  String? _invitedByCode;
  String? _inviteCode;
  String? _status;
  String? _usernameId;
  dynamic _countryName;
  String? _areaCode;
  String? _registerDate;
  String? _avatarThumbnailUrl;
  String? _frameUrl;
  List<String>? _roles;
  String? _createdAt;
  String? _updatedAt;
  dynamic _createdBy;
  dynamic _updatedBy;
  dynamic _isFriend;
  dynamic _relationshipStatus;
User copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? fullName,
  String? phone,
  String? email,
  String? invitedByCode,
  String? inviteCode,
  String? status,
  String? usernameId,
  dynamic countryName,
  String? areaCode,
  String? registerDate,
  String? avatarThumbnailUrl,
  String? frameUrl,
  List<String>? roles,
  String? createdAt,
  String? updatedAt,
  dynamic createdBy,
  dynamic updatedBy,
  dynamic isFriend,
  dynamic relationshipStatus,
}) => User(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  fullName: fullName ?? _fullName,
  phone: phone ?? _phone,
  email: email ?? _email,
  invitedByCode: invitedByCode ?? _invitedByCode,
  inviteCode: inviteCode ?? _inviteCode,
  status: status ?? _status,
  usernameId: usernameId ?? _usernameId,
  countryName: countryName ?? _countryName,
  areaCode: areaCode ?? _areaCode,
  registerDate: registerDate ?? _registerDate,
  avatarThumbnailUrl: avatarThumbnailUrl ?? _avatarThumbnailUrl,
  frameUrl: frameUrl ?? _frameUrl,
  roles: roles ?? _roles,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
  isFriend: isFriend ?? _isFriend,
  relationshipStatus: relationshipStatus ?? _relationshipStatus,
);
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get fullName => _fullName;
  String? get phone => _phone;
  String? get email => _email;
  String? get invitedByCode => _invitedByCode;
  String? get inviteCode => _inviteCode;
  String? get status => _status;
  String? get usernameId => _usernameId;
  dynamic get countryName => _countryName;
  String? get areaCode => _areaCode;
  String? get registerDate => _registerDate;
  String? get avatarThumbnailUrl => _avatarThumbnailUrl;
  String? get frameUrl => _frameUrl;
  List<String>? get roles => _roles;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  dynamic get isFriend => _isFriend;
  dynamic get relationshipStatus => _relationshipStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['full_name'] = _fullName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['invited_by_code'] = _invitedByCode;
    map['invite_code'] = _inviteCode;
    map['status'] = _status;
    map['username_id'] = _usernameId;
    map['country_name'] = _countryName;
    map['area_code'] = _areaCode;
    map['register_date'] = _registerDate;
    map['avatar_thumbnail_url'] = _avatarThumbnailUrl;
    map['frame_url'] = _frameUrl;
    map['roles'] = _roles;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    map['is_friend'] = _isFriend;
    map['relationship_status'] = _relationshipStatus;
    return map;
  }

}