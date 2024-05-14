class ComplaintData {
  String? id;
  String? complaintCode;
  String? title;
  String? description;
  String? image;
  String? date;
  String? userId;
  String? ownerId;
  String? cRe;
  String? floorId;
  String? complainDetails;
  String? assignedTo;
  String? solutionRemark;
  String? billingRemark;
  String? status;
  String? dateClosed;
  String? addedDate;
  String? complexId;
  String? unitNumber;

  ComplaintData({
    this.id,
    this.complaintCode,
    this.title,
    this.description,
    this.image,
    this.date,
    this.userId,
    this.ownerId,
    this.cRe,
    this.floorId,
    this.complainDetails,
    this.assignedTo,
    this.solutionRemark,
    this.billingRemark,
    this.status,
    this.dateClosed,
    this.addedDate,
    this.complexId,
    this.unitNumber,
  });

  factory ComplaintData.fromJson(Map<String, dynamic> json) {
    return ComplaintData(
      id: json['complain_id'],
      complaintCode: json['complaint_code'],
      title: json['c_title'],
      description: json['c_description'],
      image: json['c_image'],
      date: json['c_date'],
      userId: json['user_id'],
      ownerId: json['owner_id'],
      cRe: json['c_re'],
      floorId: json['c_floor_id'],
      complainDetails: json['complain_details'],
      assignedTo: json['assigned_to'],
      solutionRemark: json['solution_remark'],
      billingRemark: json['billing_remark'],
      status: json['status'],
      dateClosed: json['date_closed'],
      addedDate: json['added_date'],
      complexId: json['complex_id'],
      unitNumber: json['unit_nb'],
    );
  }
}
