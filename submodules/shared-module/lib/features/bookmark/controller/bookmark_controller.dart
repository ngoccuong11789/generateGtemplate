import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/bookmark/controller/bookmark_service.dart';

class BookmarkController extends BaseApiController {
  final BookmarkService service;

  BookmarkController(Dio dio) : service = BookmarkService(dio);

  Future<String?> getBookmarkHash() async {
    final bloomContainer =
        await handleWithFreshTokenRetry(() => service.getBloomFilter());
    return bloomContainer.bloomFilter;
  }

  Future<dynamic> addBookmark(CreateBookMarkRequest request) {
    return handleWithFreshTokenRetry(() => service.addBookmark(request));
  }

  Future<dynamic> removeBookmark(String objectId) {
    return handleWithFreshTokenRetry(() => service.removeBookmark(objectId));
  }

  Future<bool> checkIfBookmarked(String objectId) async {
    final container = await handleWithFreshTokenRetry(
        () => service.checkIfBookmarked(objectId));
    return container.isExisted;
  }
}