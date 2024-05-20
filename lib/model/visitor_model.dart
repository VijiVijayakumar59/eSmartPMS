class VisitorModel {
  String issueDate;
  String name;
  String mobile;
  String address;
  String floorNo;
  String unitNo;
  String inTime;
  String outTime;
  String description;
  String type;
  String remarks;
  String request;
  String passNo;
  String closed;
  String complex;
  List<String> idPhoto;
  List<String> visPhoto;
  String passReturn;
  String otherInfo;
  String owner;

  VisitorModel({
    required this.issueDate,
    required this.name,
    required this.mobile,
    required this.address,
    required this.floorNo,
    required this.unitNo,
    required this.inTime,
    required this.outTime,
    required this.description,
    required this.type,
    required this.remarks,
    required this.request,
    required this.passNo,
    required this.closed,
    required this.complex,
    required this.idPhoto,
    required this.visPhoto,
    required this.passReturn,
    required this.otherInfo,
    required this.owner,
  });

  Map<String, dynamic> toJson() {
    return {
      'txtIssueDate': issueDate,
      'txtName': name,
      'txtMobile': mobile,
      'txtAddress': address,
      'ddlFloorNo': floorNo,
      'ddlUnitNo': unitNo,
      'txtInTime': inTime,
      'txtOutTime': outTime,
      'visitor_description': description,
      'visitor_type': type,
      'visitor_remarks': remarks,
      'visitor_request': request,
      'pass_no': passNo,
      'closed': closed,
      'complex': complex,
      'id_photo': idPhoto,
      'vis_photo': visPhoto,
      'pass_return': passReturn,
      'vis_other_inf': otherInfo,
      'owner': owner,
    };
  }

  factory VisitorModel.fromJson(Map<String, dynamic> json) {
    return VisitorModel(
      issueDate: json['txtIssueDate'],
      name: json['txtName'],
      mobile: json['txtMobile'],
      address: json['txtAddress'],
      floorNo: json['ddlFloorNo'],
      unitNo: json['ddlUnitNo'],
      inTime: json['txtInTime'],
      outTime: json['txtOutTime'],
      description: json['visitor_description'],
      type: json['visitor_type'],
      remarks: json['visitor_remarks'],
      request: json['visitor_request'],
      passNo: json['pass_no'],
      closed: json['closed'],
      complex: json['complex'],
      idPhoto: json['id_photo'],
      visPhoto: json['vis_photo'],
      passReturn: json['pass_return'],
      otherInfo: json['vis_other_inf'],
      owner: json['owner'],
    );
  }
}
