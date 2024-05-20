// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;

class DealViewController {
  Future<Map<String, dynamic>> dealView() async {
    final token = await SharedPrefController().getUserId();

    final url = Uri.parse('https://epenhasia.com/api/view_deal.php');

    final params = {
      'checklist_id': token, // Change the checklist ID here
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
        // If the server returns a 200 OK response, parse the JSON
        final jsonResponse = json.decode(response.body);
        log(jsonResponse.toString());
        return jsonResponse;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
      rethrow; // Rethrow the error to handle it in the calling function
    }
  }
}
