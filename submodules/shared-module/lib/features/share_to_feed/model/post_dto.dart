/// content : "The food was so delicious."
/// post_type : "User"
/// post_privacy : "Public"
/// friend_tags : ["hello"]
/// share_link : "http://localhost:4200/food/ab5d7e40-524b-11ee-8c57-31e87cf9c793"
/// share_link_type : "Food"
/// dag_object_name : "FOOD_SHARE"
/// dag_object_id : "ab5d7e40-524b-11ee-8c57-31e87cf9c793"

class PostDto {
  PostDto({
      String? content, 
      String? postType, 
      String? postPrivacy, 
      List<String>? friendTags, 
      String? shareLink, 
      String? shareLinkType, 
      String? dagObjectName, 
      String? dagObjectId,}){
    _content = content;
    _postType = postType;
    _postPrivacy = postPrivacy;
    _friendTags = friendTags;
    _shareLink = shareLink;
    _shareLinkType = shareLinkType;
    _dagObjectName = dagObjectName;
    _dagObjectId = dagObjectId;
}

  PostDto.fromJson(dynamic json) {
    _content = json['content'];
    _postType = json['post_type'];
    _postPrivacy = json['post_privacy'];
    _friendTags = json['friend_tags'] != null ? json['friend_tags'].cast<String>() : [];
    _shareLink = json['share_link'];
    _shareLinkType = json['share_link_type'];
    _dagObjectName = json['dag_object_name'];
    _dagObjectId = json['dag_object_id'];
  }
  String? _content;
  String? _postType;
  String? _postPrivacy;
  List<String>? _friendTags;
  String? _shareLink;
  String? _shareLinkType;
  String? _dagObjectName;
  String? _dagObjectId;
PostDto copyWith({  String? content,
  String? postType,
  String? postPrivacy,
  List<String>? friendTags,
  String? shareLink,
  String? shareLinkType,
  String? dagObjectName,
  String? dagObjectId,
}) => PostDto(  content: content ?? _content,
  postType: postType ?? _postType,
  postPrivacy: postPrivacy ?? _postPrivacy,
  friendTags: friendTags ?? _friendTags,
  shareLink: shareLink ?? _shareLink,
  shareLinkType: shareLinkType ?? _shareLinkType,
  dagObjectName: dagObjectName ?? _dagObjectName,
  dagObjectId: dagObjectId ?? _dagObjectId,
);
  String? get content => _content;
  String? get postType => _postType;
  String? get postPrivacy => _postPrivacy;
  List<String>? get friendTags => _friendTags;
  String? get shareLink => _shareLink;
  String? get shareLinkType => _shareLinkType;
  String? get dagObjectName => _dagObjectName;
  String? get dagObjectId => _dagObjectId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    map['post_type'] = _postType;
    map['post_privacy'] = _postPrivacy;
    map['friend_tags'] = _friendTags;
    map['share_link'] = _shareLink;
    map['share_link_type'] = _shareLinkType;
    map['dag_object_name'] = _dagObjectName;
    map['dag_object_id'] = _dagObjectId;
    return map;
  }

  @override
  String toString() {
    return 'PostDto{_content: $_content, _postType: $_postType, _postPrivacy: $_postPrivacy, _friendTags: $_friendTags, _shareLink: $_shareLink, _shareLinkType: $_shareLinkType, _dagObjectName: $_dagObjectName, _dagObjectId: $_dagObjectId}';
  }
}