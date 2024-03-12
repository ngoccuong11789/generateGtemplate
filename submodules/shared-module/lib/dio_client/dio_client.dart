import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_module/features/auth/auth_controller.dart';
import 'package:shared_module/features/auth/auth_tokens_manager.dart';
import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/shared_module.dart';

@Deprecated("Use BaseApiController and appDelegates.dio instead")
class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio()
          ..options.baseUrl = SharedModule.appDelegates!.config.apiBaseUrl
          ..options.connectTimeout = const Duration(seconds: 15)
          ..options.receiveTimeout = const Duration(seconds: 15)
          ..options.responseType = ResponseType.json {
    _dio
      ..interceptors.clear()
      ..interceptors.add(InterceptorsWrapper(
        onRequest: onRequest,
      ));
  }
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Access-Control-Allow-Origin'] = '*';
    options.headers['accept'] = '*/*';
    if (!options.headers.containsKey('content-type')) {
      options.headers['content-type'] = 'application/json';
    }
    final authController = AuthController.instance;
    final token =await authController.tokensManager.loadAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  onError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
      try {
        final authController = AuthController.instance;
    String? authModel = await authController.tokensManager.loadMetaData(AuthTokensManager.authModel);
    
        if (authModel!=null&&authModel.isNotEmpty) {
          AuthModel user = AuthModel.fromJson(json.decode(authModel));
          final response = await _dio.post(
            '/user/refresh/token',
            data: jsonEncode({
              'refreshToken': user.accessToken,
            }),
          );
          if (response.statusCode == 200 && response.data['success']) {
            final AuthModel authModel = AuthModel.fromJson(response.data['data']);
            authController.tokensManager.saveMetaData(AuthTokensManager.authModel, jsonEncode(authModel.toJson()));
            e.requestOptions.headers['Authorization'] =
                'Bearer ${authModel.accessToken}';
            final opts = Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers);
            final cloneReq = await _dio.request(e.requestOptions.path,
                options: opts,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          } else {
            await authController.tokensManager.saveMetaData(AuthTokensManager.authModel, null);
            return handler.next(e.requestOptions as DioException);
          }
        } else {
          await authController.tokensManager.saveMetaData(AuthTokensManager.authModel, null);
          return handler.next(e.requestOptions as DioException);
        }
      } catch (e) {
        handler.reject(e as DioException);
      }
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> download(
    String url,
    String savePath, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.download(
        url,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
