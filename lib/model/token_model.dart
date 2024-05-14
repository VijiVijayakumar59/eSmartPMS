import 'dart:convert';

class TokenModel {
  final String userId;
  final String checklistName;
  final String checklistEmail;

  TokenModel({
    required this.userId,
    required this.checklistName,
    required this.checklistEmail,
  });

  factory TokenModel.fromString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return TokenModel(
      userId: json['user_id'],
      checklistName: json['checklist_name'],
      checklistEmail: json['checklist_email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'checklist_name': checklistName,
      'checklist_email': checklistEmail,
    };
  }
}
