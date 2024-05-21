// ignore_for_file: avoid_print
import 'package:esmartpms/controller/deals_controller/deals_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/deal_view/screens/deals_view_screen.dart';
import 'package:esmartpms/view/manage_contracts/screens/manage_contracts_screen.dart';
import 'package:esmartpms/view/manage_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/my_deals/widgets/text_with_icon_widget.dart';
import 'package:flutter/material.dart';

class ReservedDealsScreen extends StatefulWidget {
  const ReservedDealsScreen({super.key});

  @override
  State<ReservedDealsScreen> createState() => _ReservedDealsWidgetState();
}

class _ReservedDealsWidgetState extends State<ReservedDealsScreen> {
  DealController dealController = DealController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    dealController.fetchData().then((data) {
      setState(() {
        data['data'].sort((a, b) => DateTime.parse(b['added_date']).compareTo(DateTime.parse(a['added_date'])));

        _data = data;
      });
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const CustomText(
                text: "MY DEALS",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeColor,
                textDecoration: TextDecoration.underline,
              ),
              const KHeight(size: 0.01),
              _data.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _data['data'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            color: primaryColor,
                            child: SizedBox(
                              height: size.height * 0.46,
                              width: size.width * 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "Start Date : ",
                                              fontSize: 12,
                                              color: greyColor,
                                            ),
                                            const KWidth(size: 0.03),
                                            CustomText(
                                              text: _data['data'][index]['added_date'],
                                              fontSize: 12,
                                              color: greenColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const KHeight(size: 0.01),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "End Date : ",
                                              fontSize: 12,
                                              color: greyColor,
                                            ),
                                            const KWidth(size: 0.044),
                                            CustomText(
                                              text: _data['data'][index]['row_contract']['contract_date'],
                                              fontSize: 12,
                                              color: greenColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const KHeight(size: 0.01),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: "Tenant Name",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Deal ID",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Lead ID",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Complex",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Sub Division",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Unit No",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Contact No",
                                                fontSize: 14,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.02),
                                              CustomText(
                                                text: "Duration",
                                                fontSize: 13,
                                                color: greyColor,
                                              ),
                                              KHeight(size: 0.01),
                                              // CustomText(
                                              //   text: "Type :",
                                              //   fontSize: 13,
                                              //   color: greyColor,
                                              // ),
                                              // KHeight(size: 0.02),
                                              // CustomText(
                                              //   text: "Active/Inactive :",
                                              //   fontSize: 13,
                                              //   color: greyColor,
                                              // ),
                                              // KHeight(size: 0.02),
                                              // CustomText(
                                              //   text: "Action :",
                                              //   fontSize: 13,
                                              //   color: greyColor,
                                              // ),
                                            ],
                                          ),
                                          const KWidth(size: 0.04),
                                          const KHeight(size: 0.04),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const CustomText(
                                                text: ": P.P. Ramesh",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ": ${_data['data'][index]['call_checklist_id']}",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ": ${_data['data'][index]['lead_id_no']}",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ": ${_data['data'][index]['complex']}",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ': ${_data['data'][index]['flr_no']}',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ': ${_data['data'][index]['unit_no']}',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ': ${_data['data'][index]['checklist_contact_no']}',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.018),
                                              const ContainerTextWidget(
                                                padding: 1,
                                                fontSize: 12,
                                                text: "334 - 302 days",
                                                bgColor: greenColor,
                                                textColor: whiteColor,
                                              ),
                                              // const KHeight(size: 0.018),
                                              // const CustomText(
                                              //   text: "Null",
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w600,
                                              //   color: greyColor,
                                              // ),
                                              // const KHeight(size: 0.018),
                                              // const CustomText(
                                              //   text: "Null",
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w600,
                                              //   color: greyColor,
                                              // ),
                                              // const KHeight(size: 0.018),
                                              // const CustomText(
                                              //   text: "Null",
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w600,
                                              //   color: greyColor,
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const KHeight(size: 0.003),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // const ContainerTextWidget(
                                        //   padding: 4,
                                        //   text: "Documents",
                                        //   fontSize: 16,
                                        //   bgColor: yellowColor,
                                        //   textColor: whiteColor,
                                        // ),
                                        TextWithIconWidget(
                                          bgColor: yellowColor,
                                          height: 0.039,
                                          width: 0.29,
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => const DealsViewScreen(),
                                            ));
                                          },
                                          fontSize: 16,
                                          text: "View ",
                                          icon: Icons.visibility_outlined,
                                          iconSize: 16,
                                          iconColor: whiteColor,
                                          textColor: whiteColor,
                                        ),
                                        ContainerTextWidget(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => const ManageContractScreen(),
                                            ));
                                          },
                                          padding: 4,
                                          text: "View Contract",
                                          fontSize: 16,
                                          bgColor: yellowColor,
                                          textColor: whiteColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
