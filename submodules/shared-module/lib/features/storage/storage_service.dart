import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/models/attachment.dart';
import 'package:shared_module/models/base_response.dart';

part 'storage_service.g.dart';

@RestApi(baseUrl: '')
abstract class StorageService {
  factory StorageService(Dio dio, {String? baseUrl}) = _StorageService;

  @POST("storage/files/upload-files")
  @MultiPart()
  Future<BaseResponse<List<Attachment>>> uploadFiles(@Body() FormData data);
}