class ContractModel {
  final String title;
  final Map<String, String> data;

  ContractModel({
    required this.title,
    required this.data,
  });
}

List<ContractModel> contractData = [
  ContractModel(title: 'Lead Plan Details', data: {
    'Contract Id': 'CON/2024-001',
    'Lead Id': 'LEAD/2022-000001',
    'Employee Name': 'Axnol Employee',
    'Person Name': 'Mr Axnol',
    'Contact No': '9895658923',
    'Email': 'axnol@gmail.com',
    'Contract Type': 'rental',
  }),
  ContractModel(title: 'Unit Details', data: {
    'Complex Name': 'Gateway phnom penh',
    'Sub Division': 'Floor - 13A',
    'Unit': 'Office - 13A-49',
    'Owner': '',
    'Secretary Name': 'Office - 13A-49',
    'Secretary Mobile': 'Gateway phnom penh',
    'Moderator Name': 'Floor - 13A',
    'Moderator Mobile': 'Office - 13A-49',
    'Security Mobile': 'Office - 13A-49',
    'Address': 'Office - 13A-49',
  }),
  ContractModel(title: 'Contract Unit History', data: {
    'Complex Name': 'Gateway phnom penh',
    'Sub Division': 'Floor - 13A',
    'Unit': 'Office - 13A-49',
    'From Date': '09-05-2024',
    'To Date': '09-07-2024',
    'Is Active': 'Yes',
  }),
  ContractModel(title: 'General Information', data: {
    'Deposit': 'No',
    'Deposit Amount': '0.00',
    'Contract Date': '09-05-2024',
    'Contract Place': 'lucknow',
    'Contract Status': 'Active',
    'Status': 'Open',
    'Deposit Return': 'No',
    'Name of the Guest': '',
    'RRM-Room Remark': 'Select RRM',
  }),
  ContractModel(title: 'Auto Invoice', data: {
    'Payment type': 'Gateway phnom penh',
    'Issue Date': 'Floor - 13A',
    'Payment Name': 'Office - 13A-49',
    'Amount': '09-05-2024',
    'Staus': '09-07-2024',
    'Description': 'Yes',
  }),
  ContractModel(title: 'Other Charges', data: {
    'utility': '09-05-2024',
    'Amount per Unit': '09-07-2024',
    'Pay Period': 'Yes',
  }),
  ContractModel(title: 'Variable Utitlity Service', data: {
    'utility': '09-05-2024',
    'Meter No': '09-07-2024',
    'Amount': 'Yes',
  }),
  ContractModel(title: 'OCRM', data: {
    'Number of Guest': '0',
    'Number of Adult': '0',
    'Number of Children': '0',
    'Number of Pets': '0',
  }),
  ContractModel(title: 'Room Occupants', data: {
    'Name': '0',
    'Relation': '0',
    'Nationality': '0',
    'Gender': '0',
    'Telephone No': '0',
    'DOB': '0',
  }),
  ContractModel(title: 'Witness', data: {
    'Witness Name': '0',
    'Witness Tel No': '0',
    'Witness Document Details': '0',
  }),
  ContractModel(title: 'Meter Reading', data: {
    'Meter No': 'No',
    'Meter Type': '0.00',
    'Reading Start Unit': '09',
    'Meter Rate in ₹': 'lucknow',
    'Due Date': 'Active',
    'Billing Type': 'Open',
    'Billing Option': 'No',
  }),
];

Map<String, String> leadPlanDetails = {
  'Contract Id': 'CON/2024-001',
  'Lead Id': 'LEAD/2022-000001',
  'Employee Name': 'Axnol Employee',
  'Person Name': 'Mr Axnol',
  'Contact No': '9895658923',
  'Email': 'axnol@gmail.com',
  'Contract Type': 'rental',
};
Map<String, String> unitDetails = {
  'Complex Name': 'Gateway phnom penh',
  'Sub Division': 'Floor - 13A',
  'Unit': 'Office - 13A-49',
  'Owner': '',
  'Secretary Name': 'Office - 13A-49',
  'Secretary Mobile': 'Gateway phnom penh',
  'Moderator Name': 'Floor - 13A',
  'Moderator Mobile': 'Office - 13A-49',
  'Security Mobile': 'Office - 13A-49',
  'Address': 'Office - 13A-49',
};

Map<String, String> unitHistory = {
  'Complex Name': 'Gateway phnom penh',
  'Sub Division': 'Floor - 13A',
  'Unit': 'Office - 13A-49',
  'From Date': '09-05-2024',
  'To Date': '09-07-2024',
  'Is Active': 'Yes',
};
Map<String, String> generalInformation = {
  'Deposit': 'No',
  'Deposit Amount': '0.00',
  'Contract Date': '09-05-2024',
  'Contract Place': 'lucknow',
  'Contract Status': 'Active',
  'Status': 'Open',
  'Deposit Return': 'No',
  'Name of the Guest': '',
  'RRM-Room Remark': 'Select RRM',
};
Map<String, String> autoInvoice = {
  'Payment type': 'Gateway phnom penh',
  'Issue Date': 'Floor - 13A',
  'Payment Name': 'Office - 13A-49',
  'Amount': '09-05-2024',
  'Staus': '09-07-2024',
  'Description': 'Yes',
};

Map<String, String> otherCharges = {
  'utility': '09-05-2024',
  'Amount per Unit': '09-07-2024',
  'Pay Period': 'Yes',
};

Map<String, String> variableUtilityServices = {
  'utility': '09-05-2024',
  'Meter No': '09-07-2024',
  'Amount': 'Yes',
};

Map<String, String> ocrm = {
  'Number of Guest': '0',
  'Number of Adult': '0',
  'Number of Children': '0',
  'Number of Pets': '0',
};
Map<String, String> roomOccupants = {
  'Name': '0',
  'Relation': '0',
  'Nationality': '0',
  'Gender': '0',
  'Telephone No': '0',
  'DOB': '0',
};
Map<String, String> witness = {
  'Witness Name': '0',
  'Witness Tel No': '0',
  'Witness Document Details': '0',
};
Map<String, String> meterReading = {
  'Meter No': 'No',
  'Meter Type': '0.00',
  'Reading Start Unit': '09',
  'Meter Rate in ₹': 'lucknow',
  'Due Date': 'Active',
  'Billing Type': 'Open',
  'Billing Option': 'No',
};
// List<Map<String, String>> contract = [
//   leadPlanDetails,
//   unitDetails,
// ];
