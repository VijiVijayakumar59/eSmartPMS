import 'dart:convert';
import 'package:http/http.dart' as http;

class EventListController {
  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse('https://epenhasia.com/api/event.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
