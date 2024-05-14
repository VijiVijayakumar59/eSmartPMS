import 'dart:convert';
import 'dart:developer';

import 'package:esmartpms/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  Future<void> saveUserId(TokenModel token) async {
    final prefs = await SharedPreferences.getInstance();
    final tokenJson = jsonEncode(token.toJson()); // Convert TokenModel to JSON string
    await prefs.setString('token', tokenJson).then((value) {
      log(value.toString());
      log('success');
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenString = prefs.getString('token');
    if (tokenString != null) {
      try {
        final token = TokenModel.fromString(tokenString); // Parse the string back to TokenModel
        log(token.userId);
        return token.userId;
      } catch (e) {
        log('Error decoding token: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async {
    final String? data = await getUserId();
    if (data != null) {
      return true;
    }
    return false;
  }

  // loggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('loggedIn', true);
  // }

  // logOut() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setBool('loggedIn', false);
  // }

  // Future<bool> checkLoggedIn() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('loggedIn') ?? false;
  // }
}
