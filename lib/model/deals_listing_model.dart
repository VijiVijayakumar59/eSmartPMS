class ChecklistData {
  final String checklistName;
  final String checklistContactNo;
  final String addedDate;
  final String unitNo;
  final int callChecklistId;
  final String address;

  ChecklistData({
    required this.checklistName,
    required this.checklistContactNo,
    required this.addedDate,
    required this.unitNo,
    required this.callChecklistId,
    required this.address,
  });

  factory ChecklistData.fromJson(Map<String, dynamic> json) {
    return ChecklistData(
      checklistName: json['checklist_name'] ?? '',
      checklistContactNo: json['checklist_contact_no'] ?? '',
      addedDate: json['added_date'] ?? '',
      unitNo: json['unit_no'] ?? '',
      callChecklistId: json['call_checklist_id'] ?? 0,
      address: json['address'] ?? '',
    );
  }
}
