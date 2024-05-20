import 'package:esmartpms/model/visitor_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AddVisitorController {
  addVisitor(VisitorModel visitorModel) async {
    final url = Uri.parse('https://epenhasia.com/api/add_visitor.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(visitorModel.toJson()),
      );

      if (response.statusCode == 200) {
        // Successfully posted the complaint

        log('Visitor Added');
        print('Visitor Added successfully');
      } else {
        // Handle the error
        print('Failed to post visitor: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception occurred: $e');
    }
  }
}
