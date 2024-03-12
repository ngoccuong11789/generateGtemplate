part of 'post_share_to_feed_bloc.dart';

class PostShareToFeedState extends Equatable {
  final AuthModel? user;
  const PostShareToFeedState({this.user});

  @override
  List<Object?> get props => [user];

  PostShareToFeedState copyWith({
    AuthModel? user,
  }) {
    return PostShareToFeedState(
      user: user ?? this.user,
    );
  }
}

class LoadingData extends PostShareToFeedState {}
