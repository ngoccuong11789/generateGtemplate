import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/share_to_feed/api/post_service.dart';
import 'package:shared_module/features/share_to_feed/model/post_dto.dart';

class PostController extends BaseApiController {
  final PostService service;

  PostController(Dio dio) : service = PostService(dio);

  Future postShareToFeed(PostDto dto) {
    return handleWithFreshTokenRetry(() => service.postShareToFeed(dto));
  }
}
