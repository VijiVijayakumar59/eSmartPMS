import 'dart:convert';

class AddComplaintModel {
  String floorNo;
  int complexNo;
  String unitNumber;
  AddComplaintModel({
    required this.complexNo,
    required this.floorNo,
    required this.unitNumber,
  });
  factory AddComplaintModel.fromString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return AddComplaintModel(
      complexNo: json['complex'],
      unitNumber: json['unit_no'],
      floorNo: json['flr_no'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'complex': complexNo,
      'unit_no': unitNumber,
      'flr_no': floorNo,
    };
  }
}
