import 'package:dio/dio.dart';
import 'package:shared_module/exception/invalid_api_response_exception.dart';
import 'package:shared_module/exception/soctrip_api_exception.dart';
import 'package:shared_module/models/base_response.dart';

mixin class BaseApiController {
  static TokenRefresher? tokenRefresher;

  Future<T> handleResponseFuture<T>(Future<BaseResponse<T>> future,
      {T Function(T? data)? successIntercept}) async {
    return handleResponse(await future);
  }

  T handleResponse<T>(BaseResponse<T> response,
      {T Function(T? data)? successIntercept, Function(Error? error)? onError}) {
    if (response.success) {
      if (successIntercept != null) {
        return successIntercept(response.data);
      }
      if (response.data == null) {
        throw InvalidApiResponseException("Expect response.data is not null");
      }
      return response.data!;
    } else {
      final error = response.error;
      if(onError != null) return onError(error);
      if (error != null) {
        throw SoctripApiException(
            errorCode: error.code, message: error.message);
      } else {
        throw InvalidApiResponseException("Expect response.error is not null");
      }
    }
  }

  bool _isDio401Exception(dynamic exception) {
    return exception is DioException &&
        exception.type == DioExceptionType.badResponse &&
        (exception.message?.endsWith("401.") ?? false);
  }

  bool _isSoctrip401Exception(dynamic exception) {
    return exception is SoctripApiException && exception.errorCode == 401;
  }

  Future<T> handleWithFreshTokenRetry<T>(
      Future<BaseResponse<T>> Function() action) async {
    return withFreshTokenRetry(() async {
      final response = await action();
      return handleResponse(response);
    });
  }

  Future<T> withFreshTokenRetry<T>(Future<T> Function() action) async {
    try {
      return action();
    } catch (exception) {
      bool shouldRefreshToken = false;
      if (await tokenRefresher?.canRefresh ?? false) {
        if (_isDio401Exception(exception) ||
            _isSoctrip401Exception(exception)) {
          shouldRefreshToken = true;
        }
      }
      if (shouldRefreshToken) {
        await tokenRefresher!.refresh();
        return action();
      } else {
        rethrow;
      }
    }
  }
}

abstract class TokenRefresher {
  Future<bool> get canRefresh;

  Future<void> refresh();
}
