// class ChecklistData {
//   final String checklistName;
//   final String checklistContactNo;
//   final String addedDate;
//   final String unitNo;
//   final int callChecklistId;
//   final String address;
//   final String contractDate;
//   final String leadId;
//   final String complex;
//   final String floorNo;
//   ChecklistData({
//     required this.checklistName,
//     required this.checklistContactNo,
//     required this.addedDate,
//     required this.unitNo,
//     required this.callChecklistId,
//     required this.address,
//     required this.contractDate,
//     required this.leadId,
//     required this.complex,
//     required this.floorNo,
//   });

//   factory ChecklistData.fromJson(Map<String, dynamic> json) {
//     return ChecklistData(
//       checklistName: json['checklist_name'] ?? '',
//       checklistContactNo: json['checklist_contact_no'] ?? '',
//       addedDate: json['added_date'] ?? '',
//       unitNo: json['unit_no'] ?? '',
//       callChecklistId: json['call_checklist_id'] ?? '',
//       address: json['address'] ?? '',
//       contractDate: json['contract_date'] ?? '',
//       leadId: json['lead_id'] ?? '',
//       complex: json['complex'] ?? 0,
//       floorNo: json['flr_no'] ?? '',
//     );
//   }
// }
