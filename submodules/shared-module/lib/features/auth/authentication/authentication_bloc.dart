import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_module/exception/soctrip_exeception.dart';
import 'package:shared_module/features/auth/auth_controller.dart';
import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/models/sign_in_request.dart';
import 'package:shared_module/models/sign_in_request_model.dart';
import 'package:shared_module/utils/share_pre.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthController authController = AuthController.instance;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppLoad>((event, emit) async {
      if (isClosed) return;
      emit(Authenticating());
      try {
        bool isSignOut = await SharedPre.isSignOut();
        if (isSignOut) {
          if (isClosed) return;
          emit(UnAuthentication());
          return;
        }
        SignInRequestModel? signInRequestModel = await SharedPre.getSignInfo();
        if (signInRequestModel != null) {
          try {
            final AuthModel authModel =
                await AuthController.instance.signIn(SignInRequest(
                    phoneOrEmail: signInRequestModel.phoneOrEmail,
                    password: signInRequestModel.password,
                    device: signInRequestModel.device,
                    areaCode: signInRequestModel.areaCode));
            SharedPre.saveUserName(signInRequestModel.phoneOrEmail);
            SharedPre.signOut(false);
            if (isClosed) return;
            emit(Authenticated(authModel: authModel));
          } on SoctripException catch (_) {
            if (isClosed) return;
            emit(UnAuthentication());
          }
        } else {
          if (isClosed) return;
          emit(UnAuthentication());
        }
      } catch (e) {
        if (isClosed) return;
        emit(UnAuthentication());
      }
    });
    on<SignIn>((event, emit) async {
      if (isClosed) return;
      emit(Authenticating());
      SharedPre.signOut(false);
      if (isClosed) return;
      emit(Authenticated(authModel: event.authModel));
    });
    on<LogOut>((event, emit) async {
      try {
        await SharedPre.removeMyReactions();
        await authController.signOut();
      } finally {
        SharedPre.signOut(true);
        if (isClosed) return;
        emit(UnAuthentication());
      }
    });
    on<AuthenticationReloadEvent>(_reloadUserData);
  }

  FutureOr<void> _reloadUserData(AuthenticationReloadEvent event,
      Emitter<AuthenticationState> emit) async {
    AuthModel? authModel = await SharedPre.getUser();
    if (authModel != null) {
      emit(Authenticated(authModel: authModel));
    }
  }
}
