// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'dart:convert';
import 'package:http/http.dart' as http;

class OverDueInvoicesController {
  Future<Map<String, dynamic>> fetchOverDueInvoices() async {
    final url = Uri.parse('https://epenhasia.com/api/due_invoice_list.php?lead_id=440');

    try {
      final response = await http.get(
        url,
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
