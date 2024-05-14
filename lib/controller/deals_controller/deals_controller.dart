// import 'dart:convert';
// import 'dart:developer';
// import 'package:esmartpms/model/deals_listing_model.dart';
// import 'package:http/http.dart' as http;

// class DealController {
//   Future<DealsModel> fetchData() async {
//     try {
//       final url = Uri.parse('https://epenhasia.com/api/deal.php');

//       final params = {
//         'call_checklist_id': '442', // Change the checklist ID here
//       };

//       final uriWithParams = Uri.http(url.authority, url.path, params);

//       // log('Request URL: $uriWithParams');

//       final response = await http.get(
//         uriWithParams,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);

//         log('Response Data: $responseData');
//         DealsModel dealsModel = DealsModel(
//             callChecklistId: responseData['data']['call_checklist_id'],
//             checklistSalutation: responseData['data']['checklist_salutation'],
//             checklistName: responseData['data']['checklist_name'],
//             guestName: responseData['data']['guest_name'],
//             agency: responseData['data']['agency'],
//             address: responseData['data']['address'],
//             employee: responseData['data']['employee'],
//             userId: responseData['data']['user_id'],
//             checklistPosition: responseData['data']['checklist_position'],
//             checklistContactNo: responseData['data']['checklist_contact_no'],
//             checklistAlterMobile: responseData['data']['checklist_alter_mobile'],
//             checklistEmail: responseData['data']['checklist__email'],
//             checklistPassword: responseData['data']['checklist_password'],
//             addedDate: responseData['data']['added_date'],
//             checklistStatus: responseData['data']['checklist_status'],
//             leadDob: responseData['data']['lead_dob'],
//             leadCompanyName: responseData['data']['lead_company_name'],
//             leadNationality: responseData['data']['lead_nationality'],
//             leadIdType: responseData['data']['lead_id_type'],
//             leadIdNo: responseData['data']['lead_id_no'],
//             leadAddress: responseData['data']['lead_id_no'],
//             leadCity: responseData['data']['lead_city'],
//             leadState: responseData['data']['lead_state'],
//             leadCountry: responseData['data']['lead_country'],
//             leadPincode: responseData['data']['lead_pincode'],
//             leadBank: responseData['data']['lead_bank'],
//             leadAccountNo: responseData['data']['lead_account_no'],
//             leadAssignedBy: responseData['data']['lead_assigned_by'],
//             statusRemark: responseData['data']['status_remark'],
//             checklistHotColdWarm: responseData['data']['checklist_hot_cold_warm'],
//             ownerTblId: responseData['data']['owner_tbl_id'],
//             renterTblId: responseData['data']['renter_tbl_id'],
//             checklistContactType: responseData['data']['checklist_contact_type'],
//             checklistSource: responseData['data']['checklist_source'],
//             agencyRepresentativeId: responseData['data']['agency_representative_id'],
//             directDeal: responseData['data']['direct_deal'],
//             directLead: responseData['data']['direct_lead'],
//             isDelete: responseData['data']['is_delete'],
//             groupName: responseData['data']['group_name'],
//             floorNo: responseData['data']['floor_no'],
//             fid: responseData['data']['fid'],
//             unitNo: responseData['data']['unit_no'],
//             complex: responseData['data']['complex'],
//             flrNo: responseData['data']['flr_no']);
//         return dealsModel;
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         throw Exception('Failed to fetch data: ${response.statusCode}');
//       }
//     } catch (e) {
//       // log(e.toString());
//       throw e.toString();
//     }
//   }
// }

// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'dart:convert';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;

class DealController {
  Future<Map<String, dynamic>> fetchData() async {
    final token = await SharedPrefController().getUserId();

    final url = Uri.parse('https://epenhasia.com/api/deal.php');

    final params = {
      'call_checklist_id': token, // Change the checklist ID here
    };

    final uriWithParams = Uri.http(url.authority, url.path, params);

    try {
      final response = await http.get(
        uriWithParams,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final jsonResponse = json.decode(response.body);
        // log(jsonResponse.toString());
        return jsonResponse;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
      throw error; // Rethrow the error to handle it in the calling function
    }
  }
}
