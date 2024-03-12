import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/features/bookmark/controller/bloom_service.dart';
import 'package:shared_module/features/bookmark/controller/bookmark_controller.dart';
import 'package:shared_module/features/bookmark/controller/bookmark_service.dart';
import 'package:shared_module/features/bookmark/model/bookmark_type.dart';
import 'package:shared_module/shared_module.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final controller = BookmarkController(SharedModule.appDelegates!.dio);

  final bloomService = BloomService();

  BookmarkBloc() : super(const BookmarkState()) {
    on<LoadBookmark>((event, emit) async {
      await updateBookmarkHash(emit);
    });

    on<AddBookmark>((event, emit) async {
      await addBookmarkServeSide(event.objectId, event.type,event.groupId ?? '',event.groupName ?? '');
      await updateBookmarkHash(emit);
    });

    on<RemoveBookmark>((event, emit) async {
      await removeBookmarkServeSide(event.objectId);
      await updateBookmarkHash(emit);
    });
  }

  Future<dynamic> addBookmarkServeSide(
      String objectId, BookmarkType type,String groupId,String groupName) {
    return controller.addBookmark(
        CreateBookMarkRequest(objectId: objectId, dagObject: type,groupId: groupId,groupName: groupName));
  }

  Future<dynamic> removeBookmarkServeSide(String objectId) {
    return controller.removeBookmark(objectId);
  }

  Future<void> updateBookmarkHash(Emitter<BookmarkState> emit) async {
    final bookmarkHash = await controller.getBookmarkHash();
    await bloomService.updateFilter(bookmarkHash);
    emit(state.copyWith(bookmarkHash: bookmarkHash));
  }
}
