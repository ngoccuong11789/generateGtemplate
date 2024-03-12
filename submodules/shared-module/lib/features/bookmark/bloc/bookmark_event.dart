part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();
}

class LoadBookmark extends BookmarkEvent {
  const LoadBookmark();

  @override
  List<Object?> get props => [];
}

class AddBookmark extends BookmarkEvent {
  final String objectId;
  final BookmarkType type;
  final String? groupId;
  final String? groupName;

  const AddBookmark(this.objectId, this.type, this.groupId,this.groupName);

  @override
  List<Object?> get props => [objectId, type];
}

class RemoveBookmark extends BookmarkEvent {
  final String objectId;

  const RemoveBookmark(this.objectId);

  @override
  List<Object?> get props => [objectId];
}