// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'dart:convert';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;

class VisitorListController {
  Future<Map<String, dynamic>> fetchVisitorList() async {
    final token = await SharedPrefController().getUserId();

    final url = Uri.parse('https://epenhasia.com/api/visitorlist.php');
    final Map<String, String> queryParams = {
      'lead_id': token!,
    };

    final uri = Uri.https(url.authority, url.path, queryParams);

    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // log(jsonResponse.toString());
        return jsonResponse;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
      throw error;
    }
  }
}
