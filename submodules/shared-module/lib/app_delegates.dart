import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/enum/toast_status.dart';
import 'package:shared_module/global_config.dart';
import 'package:shared_module/localization/global_localization.dart';

abstract class AppDelegates {
  Dio get dio;

  GlobalConfig get config;

  Future<String> get deviceId;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> toast(
      BuildContext context, String message,
      {ToastStatus status = ToastStatus.success, Duration? duration});

  GlobalLocalization? localizationOf(BuildContext context);
}