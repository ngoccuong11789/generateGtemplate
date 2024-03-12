import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_module/app_delegates.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/exception/soctrip_exeception.dart';
import 'package:shared_module/features/auth/auth_service.dart';
import 'package:shared_module/features/auth/auth_tokens_manager.dart';
import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/models/base_response.dart';
import 'package:shared_module/models/refresh_token_request.dart';
import 'package:shared_module/models/resend_otp_request.dart';
import 'package:shared_module/models/sign_in_request.dart';
import 'package:shared_module/models/sign_out_request.dart';
import 'package:shared_module/models/sign_up_request.dart';
import 'package:shared_module/models/verify_request.dart';

class AuthController extends BaseApiController {
  final AppDelegates appDelegates;
  final AuthService service;
  final AuthTokensManager tokensManager;

  AuthController._(this.appDelegates, this.tokensManager)
      : service = AuthService(appDelegates.dio) {
    BaseApiController.tokenRefresher = _TokenRefresher(this);
    _configureDio();
  }

  _configureDio() {
    appDelegates.dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onDioRequest,
    ));
  }

  _onDioRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokensManager.loadAccessToken();
    if (token != null && token.isNotEmpty) {
      if (!options.headers.containsKey("Authorization")) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return handler.next(options);
  }

  static AuthController initAndConfigDio(
      AppDelegates appDelegates, AuthTokensManager tokensManager) {
    _instance = AuthController._(appDelegates, tokensManager);
    return _instance!;
  }

  static AuthController? _instance;

  static AuthController get instance {
    if (_instance == null) {
      throw SoctripException(message: "AuthController was not initialized yet");
    }
    return _instance!;
  }

  Future<dynamic> signUp(SignUpRequest request) async {
    final response = await service.signUp(request);
    return handleResponse(response);
  }

  Future<AuthModel> verify(VerifyRequest request) async {
    final response = await service.verify(request);
    return _handleAuthModel(response);
  }

  Future<dynamic> resendOtp(ResendOtpRequest request) async {
    final response = await service.resendOtp(request);
    return handleResponse(response);
  }

  Future<AuthModel> signIn(SignInRequest request) async {
    final response = await service.signIn(request);
    return _handleAuthModel(response);
  }

  Future<void> signOut() async {
    final request = SignOutRequest(
        refreshToken: await tokensManager.loadRefreshToken(),
        device: await appDelegates.deviceId);
    final response = await service.signOut(request);
    handleResponse(response);
    _saveTokens(null);
  }

  Future<AuthModel> refreshToken() async {
    final request = RefreshTokenRequest(
        refreshToken: await tokensManager.loadRefreshToken(),
        device: await appDelegates.deviceId);
    final response = await service.refreshToken(request);
    return _handleAuthModel(response);
  }

  Future<bool> get isSignedIn async {
    return await tokensManager.loadAccessToken() != null;
  }

  _handleAuthModel(BaseResponse<AuthModel> response) {
    final authModel = handleResponse(response);
    _saveTokens(authModel);
    return authModel;
  }

  void _saveTokens(AuthModel? authModel) {
    tokensManager.saveAccessToken(authModel?.accessToken);
    tokensManager.saveRefreshToken(authModel?.refreshToken);
    if (authModel != null) {
      tokensManager.saveMetaData(
          AuthTokensManager.authModel, jsonEncode(authModel.toJson()));
    } else {
      tokensManager.saveMetaData(AuthTokensManager.authModel, null);
    }
  }

  Future<String?> getAuthModel(){
    return tokensManager.loadMetaData(AuthTokensManager.authModel);
  }
}

class _TokenRefresher implements TokenRefresher {
  final AuthController authController;

  _TokenRefresher(this.authController);

  @override
  Future<bool> get canRefresh => authController.isSignedIn;

  @override
  Future<void> refresh() async {
    await authController.refreshToken();
  }
}
