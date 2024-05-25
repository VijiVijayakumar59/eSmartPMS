import 'dart:convert';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;

class DealController {
  Future<Map<String, dynamic>> fetchData() async {
    final token = await SharedPrefController().getUserId();
    final url = Uri.parse('https://epenhasia.com/api/deal.php');

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
        print(jsonResponse);
        // final savingData = AddComplaintModel(
        //   complexNo: jsonResponse['data'][0]['complex'],
        //   floorNo: jsonResponse['data'][0]['flr_no'],
        //   unitNumber: jsonResponse['data'][0]['unit_no'],
        // );
        // await SharedPrefController().saveData(savingData);
        return jsonResponse;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }
}
