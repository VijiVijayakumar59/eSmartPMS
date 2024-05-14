class ReceiptData {
  final String receiptId;
  final String receiptNo;
  final String leadId;
  final String dealId;
  final String receiptRefNo;
  final String receiptDate;
  final String receiptDueDate;
  final String receiptCustomerName;
  final String receiptCustomerAddress;
  final String receiptCustomerContact;
  final String receiptComplex;
  final String receiptSubDivision;
  final String receiptUnit;
  final String receiptPaymentMethod;
  final String receiptRemarks;
  final String status;
  final String receiptNetAmountPaid;
  final String isDelete;
  final String createdUserType;
  final String createdUser;
  final String createdAt;
  final String updatedAt;
  final String complex;
  final String flrNo;
  final String unitNo;

  ReceiptData({
    required this.receiptId,
    required this.receiptNo,
    required this.leadId,
    required this.dealId,
    required this.receiptRefNo,
    required this.receiptDate,
    required this.receiptDueDate,
    required this.receiptCustomerName,
    required this.receiptCustomerAddress,
    required this.receiptCustomerContact,
    required this.receiptComplex,
    required this.receiptSubDivision,
    required this.receiptUnit,
    required this.receiptPaymentMethod,
    required this.receiptRemarks,
    required this.status,
    required this.receiptNetAmountPaid,
    required this.isDelete,
    required this.createdUserType,
    required this.createdUser,
    required this.createdAt,
    required this.updatedAt,
    required this.complex,
    required this.flrNo,
    required this.unitNo,
  });

  factory ReceiptData.fromJson(Map<String, dynamic> json) {
    return ReceiptData(
      receiptId: json['receipt_id'],
      receiptNo: json['receipt_no'],
      leadId: json['lead_id'],
      dealId: json['deal_id'],
      receiptRefNo: json['receipt_ref_no'],
      receiptDate: json['receipt_date'],
      receiptDueDate: json['receipt_due_date'],
      receiptCustomerName: json['receipt_customer_name'],
      receiptCustomerAddress: json['receipt_customer_address'],
      receiptCustomerContact: json['receipt_customer_contact'],
      receiptComplex: json['receipt_complex'],
      receiptSubDivision: json['receipt_sub_division'],
      receiptUnit: json['receipt_unit'],
      receiptPaymentMethod: json['receipt_payment_method'],
      receiptRemarks: json['receipt_remarks'],
      status: json['status'],
      receiptNetAmountPaid: json['receipt_net_amount_paid'],
      isDelete: json['is_delete'],
      createdUserType: json['created_user_type'],
      createdUser: json['created_user'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      complex: json['complex'],
      flrNo: json['flr_no'],
      unitNo: json['unit_no'],
    );
  }
}
