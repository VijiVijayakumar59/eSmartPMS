// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'dart:convert';
import 'package:http/http.dart' as http;

class ReceiptViewController {
  Future<Map<String, dynamic>> getSingleReceipt(String receiptId) async {
    final url = Uri.parse('https://epenhasia.com/api/view_reciept_details.php');

    // JSON payload for the POST request
    final Map<String, dynamic> payload = {
      "receipt_id": receiptId,
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
        // log(jsonResponse.toString());
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
