import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AddComplaintController {
  addComplaint(String title, String description, String date) async {
    // final data = await SharedPrefController().getData();
    // final token = await SharedPrefController().getUserId();
    // print(data?.unitNumber.toString());
    // print(token.toString());
    final url = Uri.parse('https://epenhasia.com/api/add_complain.php');

    try {
      final response = await http.post(
        url,
        // headers: {'Content-Type': 'application/json'},
        body: {
          "lead_id": "442",
          //  token,
          "title": title,
          "description": description,
          "date": date,
          "owner_id": "442",
          "complex": "1",
          // data?.complexNo,
          "unit": " data?.unitNumber",
          "floor": " data?.floorNo",
          "images": "",
        },
      );

      if (response.statusCode == 200) {
        log('added complaint');
        print(jsonDecode(response.body));
        print('Complaint posted successfully');
      } else {
        print('Failed to post complaint: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
}

class ComplaintModel {
  String leadId;
  String title;
  String description;
  String date;
  String ownerId;
  String complex;
  String unit;
  String floor;
  String images;

  ComplaintModel({
    required this.leadId,
    required this.title,
    required this.description,
    required this.date,
    required this.ownerId,
    required this.complex,
    required this.unit,
    required this.floor,
    required this.images,
  });

  // Convert a ComplaintModel object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'lead_id': leadId,
      'title': title,
      'description': description,
      'date': date,
      'owner_id': ownerId,
      'complex': complex,
      'unit': unit,
      'floor': floor,
      'images': images,
    };
  }

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      leadId: json['lead_id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      ownerId: json['owner_id'],
      complex: json['complex'],
      unit: json['unit'],
      floor: json['floor'],
      images: json['images'],
    );
  }
}
