import 'dart:convert';
import 'package:http/http.dart' as http;

class EditProfileController {
  Future<Map<String, dynamic>> editProfile(String userId, String name, String email, String password) async {
    final url = Uri.parse('https://epenhasia.com/api/profile/view_profile_or_edit.php');
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "user_id": userId,
      "name": name,
      "email": email,
      "password": password,
      "is_editable": true,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to edit profile');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
