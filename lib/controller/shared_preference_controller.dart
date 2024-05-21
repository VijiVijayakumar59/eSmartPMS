import 'dart:convert';
import 'dart:developer';
import 'package:esmartpms/model/add_complaint_model.dart';
import 'package:esmartpms/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  Future<void> saveUserId(TokenModel token) async {
    final prefs = await SharedPreferences.getInstance();
    final tokenJson = jsonEncode(token.toJson());
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
        final token = TokenModel.fromString(tokenString);
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

  Future<void> saveData(AddComplaintModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(model.toJson());
    await prefs.setString('complaintModel', data).then((value) {
      print(value.toString());
    }).onError(
      (error, stackTrace) {
        log(error.toString());
      },
    );
  }

  Future<AddComplaintModel?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString('complaintModel');
    if (dataString != null) {
      try {
        final data = AddComplaintModel.fromString(dataString);
        return data;
      } catch (e) {
        log('Error decoding token: $e');
        return null;
      }
    }
    return null;
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
}
