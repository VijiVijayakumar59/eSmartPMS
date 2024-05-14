// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:esmartpms/model/profile_model.dart';
import 'package:esmartpms/utils/base_urls.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  final String url = baseUrl + profileEndPoint;

  Future<UserModel> fetchUserProfile() async {
    try {
      final token = await SharedPrefController().getUserId();
      //   if (token != null) {
      // log(token.userId.toString());

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "user_id": token,
          "is_editable": false,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        log('success');

        final responseData = json.decode(response.body);
        print(responseData);
        UserModel userModel = UserModel(
          userId: responseData['data']['user_id'],
          name: responseData['data']["name"],
          email: responseData['data']['email'],
          password: responseData['data']['password'],
          contact: responseData['data']['contact'],
          address: responseData['data']['address'],
          nationalId: responseData['data']['national_id'],
          country: responseData['data']['country'],
        );
        print(userModel);
        return userModel;
      } else {
        throw Exception('Failed to load profile');
      }
      // } else {
      //   throw Exception('User not valid');
      // }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
