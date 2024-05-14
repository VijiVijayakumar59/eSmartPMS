import 'package:esmartpms/controller/deals_controller/deal_view_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomText(
                text: "DEAL VIEW",
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: themeColor,
              ),
              _data.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: primaryColor,
                      child: SizedBox(
                        height: size.height * 1,
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
                                          text: "Owner Name :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Agent :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Contact Number :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Alternate Mobile :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Email :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Date Of Birth :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Company Name :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),

                                        CustomText(
                                          text: "Nationality :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Id Type :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Id No :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Address :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "City :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "State/Province :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Country :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Pin Code :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Bank Name :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Bank Account No :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Assigned Sales Person :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),

                                        // choose plan
                                        KHeight(size: 0.018),
                                        CustomText(
                                          text: "Status/Remark :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                      ],
                                    ),
                                    const KWidth(size: 0.04),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['checklist_name'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['checklist_name'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['checklist_contact_no'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['checklist_alter_mobile'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['checklist__email'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_dob'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_company_name'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_nationality'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_id_type'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_id_no'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_address'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_city'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_state'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_country'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_pincode'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_bank'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_account_no'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['lead_assigned_by'] ?? 'N/A',
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.017),
                                        CustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data']['status_remark'] ?? 'N/A',
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
