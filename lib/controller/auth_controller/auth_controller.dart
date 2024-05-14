import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:esmartpms/model/token_model.dart';
import 'package:esmartpms/utils/base_urls.dart';

class AuthService {
  static const String _baseUrl = baseUrl;
  static const String _loginEndPoint = loginEndPoint;

  Future<Map<String, dynamic>> login(String email, String password, String code) async {
    const String url = '$_baseUrl$_loginEndPoint';
    final Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
      "deal_id": code,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(requestBody),
        headers: {
          "Content-Type": "application/json",
        },
      );

      return _handleResponse(response);
    } catch (error) {
      return {'error': 'An error occurred. Please try again later.'};
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return _handleSuccessResponse(response);
      case 401:
        throw Exception('Unauthorized: Incorrect email or password');
      case 404:
        throw Exception('Not Found: Resource not found');
      default:
        throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Map<String, dynamic> _handleSuccessResponse(http.Response response) {
    final responseData = json.decode(response.body);
    if (responseData['status'] == 'success') {
      _saveToken(responseData['data']);
      // SharedPrefController().();
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? 'Unknown error occurred');
    }
  }

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final TokenModel token = TokenModel(
      userId: data['user_id'],
      checklistName: data['checklist_name'],
      checklistEmail: data['checklist__email'],
    );
    await SharedPrefController().saveUserId(token);
  }

  Future<void> logout() async {
    try {
      await SharedPrefController().clearToken();
      log('Logout successful');
    } catch (error) {
      log('Error occurred during logout: $error');
    }
  }
}
