// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'dart:convert';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;

class ContractController {
  Future<Map<String, dynamic>> fetchData() async {
    final token = await SharedPrefController().getUserId();

    final url = Uri.parse('https://epenhasia.com/api/contracts.php');

    final params = {
      'call_checklist_id': token,
    };

    final uriWithParams = Uri.http(url.authority, url.path, params);

    try {
      final response = await http.get(
        uriWithParams,
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
      print('Error: $error');
      throw error;
    }
  }
}
