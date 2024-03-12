import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/models/base_response.dart';
import 'package:shared_module/models/refresh_token_request.dart';
import 'package:shared_module/models/resend_otp_request.dart';
import 'package:shared_module/models/sign_in_request.dart';
import 'package:shared_module/models/sign_out_request.dart';
import 'package:shared_module/models/sign_up_request.dart';
import 'package:shared_module/models/verify_request.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('user/signup')
  Future<BaseResponse<dynamic>> signUp(@Body() SignUpRequest request);

  @POST("user/check-verification-code")
  Future<BaseResponse<AuthModel>> verify(@Body() VerifyRequest request);

  @POST("user/send-verification-code")
  Future<BaseResponse<dynamic>> resendOtp(@Body() ResendOtpRequest request);

  @POST("auth/signin")
  Future<BaseResponse<AuthModel>> signIn(@Body() SignInRequest request);

  @POST("auth/signout")
  Future<BaseResponse<dynamic>> signOut(@Body() SignOutRequest request);

  @POST("user/refresh-token")
  Future<BaseResponse<AuthModel>> refreshToken(
      @Body() RefreshTokenRequest request);
}
