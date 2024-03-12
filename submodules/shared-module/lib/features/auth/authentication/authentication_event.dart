// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppLoad extends AuthenticationEvent {}

class SignIn extends AuthenticationEvent {
  final AuthModel authModel;
  SignIn({
    required this.authModel,
  });
}

class LogOut extends AuthenticationEvent {}

class AuthenticationReloadEvent extends AuthenticationEvent {}
