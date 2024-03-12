import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/app_delegates.dart';

abstract mixin class MiniApp {

  List<RouteBase> get routes => [];

  List<RouteBase> get rootRoutes => [];

  List<LocalizationsDelegate> get localizationsDelegates => [];

  // List <BlocProvider> will cause a bug with MiltiBlocProvider.
  // So I use List<dynamic> instead
  List<dynamic> createBlocProviders() => [];

  void registerAppDelegates(AppDelegates appDelegates) {}

  void onReceiveFcmMessage(RemoteMessage message) {}

  bool shouldReceivedMessage(RemoteMessage message) => false;

  String get appName;

  Widget get miniHome;
}
