part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class Authenticating extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final AuthModel authModel;
  Authenticated({required this.authModel});
}

class UnAuthentication extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {}
