// ignore_for_file: avoid_print

import 'package:esmartpms/controller/deals_controller/deal_view_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DealsViewScreen extends StatefulWidget {
  const DealsViewScreen({super.key});

  @override
  State<DealsViewScreen> createState() => _DealsViewScreenState();
}

class _DealsViewScreenState extends State<DealsViewScreen> {
  DealViewController dealViewController = DealViewController();

  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    DealViewController().dealView().then((data) {
      setState(() {
        _data = data;
        debugPrint(_data.toString());
      });
    }).catchError((error) {
      print('Error fetching data: $error');
      // Handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: blackColor,
            )),
        backgroundColor: whiteColor,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            "assets/images/PMSlogo.png",
            fit: BoxFit.contain,
            height: size.height * 0.064,
            width: double.infinity,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false);
            },
            icon: const Icon(
              Icons.home,
              color: greyColor,
              size: 26,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomText(
                text: "DEAL VIEW",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeColor,
                textDecoration: TextDecoration.underline,
              ),
              const KHeight(size: 0.008),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: secondaryColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     child: const CustomText(
              //       text: "Deal Id :",
              //       color: blackColor,
              //     ),
              //   ),
              // ),
              _data.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: primaryColor,
                      child: SizedBox(
                        height: size.height * 0.78,
                        // width: size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  children: [
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Owner Name",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Agent",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Contact Number",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Alternate Mobile",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Email",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Date Of Birth",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Company Name",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),

                                        CustomText(
                                          text: "Nationality",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Id Type",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Id No",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Address",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "City",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "State/Province",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Country",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Pin Code",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Bank Name",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Bank Account No",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Assigned Sales Person",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),

                                        // choose plan
                                        KHeight(size: 0.021),
                                        CustomText(
                                          text: "Status/Remark",
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                      ],
                                    ),
                                    const KWidth(size: 0.04),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['checklist_name']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['guest_name']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['checklist_contact_no']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['checklist_alter_mobile']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        SizedBox(
                                          width: size.width * 0.45,
                                          child: CustomText(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            text: ": ${_data['data']['checklist__email']}",
                                            color: greyColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_dob']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_company_name']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_nationality']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_id_type']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_id_no']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_address']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_city']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_state']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_country']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_pincode']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_bank']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_account_no']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['lead_assigned_by']}",
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: ": ${_data['data']['status_remark']}",
                                          color: greyColor,
                                        ),
                                        // const KHeight(size: 0.017),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const KHeight(size: 0.014),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    ));
  }
}
