import 'dart:convert';
import 'dart:developer';

import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/models/sign_in_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static Future<void> saveUser(AuthModel authModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth', json.encode(authModel.toJson()));
  }

  static Future<AuthModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('auth');
    if (user == null) return null;
    return AuthModel.fromJson(json.decode(user));
  }

  static Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth');
  }

  static Future<void> saveUserName(String? name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (name != null) {
      await prefs.setString('name', name);
    }
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('name');
    if (user == null) return null;
    return user;
  }

  static Future enableBio({required bool enable}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bio', enable);
  }

  static Future<bool> isEnableBio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? checkBio = prefs.getBool('bio');
    return checkBio ?? false;
  }

  static Future signOut(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sign_out', status);
  }

  static Future<bool> isSignOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? checkBio = prefs.getBool('sign_out');
    return checkBio ?? false;
  }

  static Future<void> saveSignInfo(
      SignInRequestModel signInRequestModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'SIGN_REQUEST', json.encode(signInRequestModel.toMap()));
  }

  static Future<void> removeSignInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('SIGN_REQUEST');
  }

  static Future<SignInRequestModel?> getSignInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String srource = prefs.getString('SIGN_REQUEST') ?? '';
    if (srource.isEmpty) {
      return null;
    }
    final SignInRequestModel signInRequestModel =
        SignInRequestModel.fromMap(json.decode(srource));
    return signInRequestModel;
  }
  static Future<void> removeMyReactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('myReactions');
  }
  
}
