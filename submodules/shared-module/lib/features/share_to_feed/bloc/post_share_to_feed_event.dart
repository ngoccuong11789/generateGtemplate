part of 'post_share_to_feed_bloc.dart';

abstract class PostShareToFeedEvent extends Equatable {
  const PostShareToFeedEvent();
}

class PostAction extends PostShareToFeedEvent {
  final String? content;
  final DagObjectName dagObjectName;
  final ShareLinkType shareLinkType;
  final String postPrivacy;
  final String dagObjectId;

  const PostAction(
      {this.content,
      required this.dagObjectName,
      required this.shareLinkType,
      required this.postPrivacy,
      required this.dagObjectId});

  @override
  List<Object?> get props =>
      [content, dagObjectName, shareLinkType, postPrivacy, dagObjectId];
}

class GetUser extends PostShareToFeedEvent {

  const GetUser();

  @override
  List<Object?> get props => [];
}
