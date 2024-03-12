import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/storage/storage_service.dart';
import 'package:shared_module/models/attachment.dart';

class StorageController extends BaseApiController {
  final StorageService _service;

  StorageController(Dio dio) : _service = StorageService(dio);

  Future<List<Attachment>> uploadFilesByFrom(FormData data) {
    return handleWithFreshTokenRetry(() => _service.uploadFiles(data));
  }

  Future<List<Attachment>> uploadFiles(List<XFile> files) async {
    final formData = FormData.fromMap({});
    final futures = files.map((file) async =>
        MapEntry("files", await MultipartFile.fromFile(file.path)));
    formData.files.addAll(await Future.wait(futures));
    return uploadFilesByFrom(formData);
  }
}
