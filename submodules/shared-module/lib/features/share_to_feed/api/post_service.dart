import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/share_to_feed/model/post_dto.dart';
import 'package:shared_module/models/base_response.dart';

part 'post_service.g.dart';

@RestApi()
abstract class PostService {
  factory PostService(Dio dio, {String baseUrl}) = _PostService;

  @POST("posts/posts/share-as-link")
  Future<BaseResponse> postShareToFeed(@Body() PostDto dto);
}
