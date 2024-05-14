// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;

class ReceiptController {
  Future<Map<String, dynamic>> fetchReceipt() async {
    final token = await SharedPrefController().getUserId();

    final url = Uri.parse('https://epenhasia.com/api/view_reciept.php');
    // log(token.toString());
    // JSON payload for the POST request
    final Map<String, dynamic> payload = {
      'lead_id': token,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
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
      throw error; // Rethrow the error to handle it in the calling function
    }
  }
}
