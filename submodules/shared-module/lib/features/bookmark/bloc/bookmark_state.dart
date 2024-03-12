part of 'bookmark_bloc.dart';

class BookmarkState extends Equatable {
  final String? bookmarkHash;

  const BookmarkState({this.bookmarkHash});

  @override
  List<Object?> get props => [bookmarkHash];

  BookmarkState copyWith({
    String? bookmarkHash,
  }) {
    return BookmarkState(
      bookmarkHash: bookmarkHash ?? this.bookmarkHash,
    );
  }
}
