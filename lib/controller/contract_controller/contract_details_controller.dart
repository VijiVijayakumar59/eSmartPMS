// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:esmartpms/model/contract_model.dart';
import 'package:http/http.dart' as http;

class ContractDetailsController {
  Future<List<ContractModel>> fetchDetails() async {
    final url = Uri.parse('https://epenhasia.com/api/edit_contract.php');
    final Map<String, dynamic> payload = {
      "checlist_his_id": "365",
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final data = jsonResponse['data']['lead_plan_details'];
        final unitData = jsonResponse['data']['unit_details'];
        final contractUnitHistory = jsonResponse['data']['contract_unit_history'];
        // final generalInfo = jsonResponse['data']['general_information'];
        log(jsonEncode(contractUnitHistory)); // Ensure the data is a String

        // Create ContractModel instances
        List<ContractModel> contractData = [
          ContractModel(
            title: 'Lead Plan Details',
            data: {
              'Contract Id': data['contract_id'] ?? '',
              'Lead Id': data['checklist_lead_id'] ?? '',
              'Employee Name': data['e_name'] ?? '',
              'Person Name': '${data['checklist_salutation'] ?? ''} ${data['checklist_name'] ?? ''}',
              'Contact No': data['e_contact'],
              'Email': data['e_email'],
              'Contract Type': data['contract_type'],
            },
          ),
          ContractModel(title: 'Unit Details', data: {
            'Complex Name': unitData['name'] ?? '',
            'Sub Division': unitData['floor_no'] ?? '',
            'Unit': unitData['unit_no'] ?? '',
            'Owner': unitData['ownername'] ?? '',
            'Secretary Name': unitData['name'] ?? '',
            'Secretary Mobile': unitData['secrataty_mobile'] ?? '',
            'Moderator Name': unitData['secretaryname'] ?? '',
            'Moderator Mobile': unitData['moderator_mobile'] ?? '',
            'Security Mobile': unitData['security_guard_mobile'] ?? '',
            'Address': unitData['address'] ?? '',
          }),
          // ContractModel(title: 'Contract Unit History', data: {
          //   'Complex Name': contractUnitHistory['complex'] ?? '',
          //   'Sub Division': contractUnitHistory['sub_division'] ?? '',
          //   'Unit': contractUnitHistory['unit'] ?? '',
          //   'From Date': contractUnitHistory['date_from'] ?? '',
          //   'To Date': contractUnitHistory['date_to'] ?? '',
          //   'Is Active': contractUnitHistory['active_unit'] ?? '',
          // }),
          // ContractModel(title: 'General Information', data: {
          //   'Deposit': generalInfo[''] ?? '',
          //   'Deposit Amount': generalInfo[''] ?? '',
          //   'Contract Date': generalInfo[''] ?? '',
          //   'Contract Place': generalInfo[''] ?? '',
          //   'Contract Status': generalInfo[''] ?? '',
          //   'Status': generalInfo[''] ?? '',
          //   'Deposit Return': generalInfo[''] ?? '',
          //   'Name of the Guest': generalInfo[''] ?? '',
          //   'RRM-Room Remark': generalInfo[''] ?? '',
          // }),
        ];

        return contractData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
      rethrow;
    }
  }
}
