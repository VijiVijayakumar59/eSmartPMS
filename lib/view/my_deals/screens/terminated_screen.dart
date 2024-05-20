// ignore_for_file: avoid_print

import 'package:esmartpms/controller/deals_controller/deals_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/manage_contracts/screens/manage_contracts_screen.dart';
import 'package:esmartpms/view/manage_contracts/widgets/container_text_widget.dart';
import 'package:flutter/material.dart';

class TerminatedDealsScreen extends StatefulWidget {
  const TerminatedDealsScreen({super.key});

  @override
  State<TerminatedDealsScreen> createState() => _TerminatedDealsScreenState();
}

class _TerminatedDealsScreenState extends State<TerminatedDealsScreen> {
  DealController dealController = DealController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    dealController.fetchData().then((data) {
      setState(() {
        _data = data;
        // print(_data);
      });
    }).catchError((error) {
      print('Error fetching data: $error');
      // Handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
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
                            height: size.height * 0.3,
                            width: size.width * 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Row(
                                  //       children: [
                                  //         const CustomText(
                                  //           text: "Start Date : ",
                                  //           fontSize: 12,
                                  //           color: greyColor,
                                  //         ),
                                  //         CustomText(
                                  //           text: _data['data'][index]['added_date'],
                                  //           fontSize: 12,
                                  //           color: greenColor,
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     TextWithIconWidget(
                                  //       bgColor: themeColor,
                                  //       height: 0.023,
                                  //       width: 0.24,
                                  //       onPressed: () {},
                                  //       fontSize: 12,
                                  //       text: "View ",
                                  //       icon: Icons.visibility_outlined,
                                  //       iconSize: 14,
                                  //       iconColor: whiteColor,
                                  //       textColor: whiteColor,
                                  //     )
                                  //   ],
                                  // ),
                                  // const KHeight(size: 0.01),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Row(
                                  //       children: [
                                  //         const CustomText(
                                  //           text: "End Date : ",
                                  //           fontSize: 12,
                                  //           color: greyColor,
                                  //         ),
                                  //         CustomText(
                                  //           text: _data['data'][index]['row_contract']['contract_date'],
                                  //           fontSize: 12,
                                  //           color: greenColor,
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "Deal ID :",
                                              fontSize: 13,
                                              color: greyColor,
                                            ),
                                            KHeight(size: 0.02),
                                            CustomText(
                                              text: "Lead ID :",
                                              fontSize: 13,
                                              color: greyColor,
                                            ),
                                            KHeight(size: 0.02),
                                            CustomText(
                                              text: "Complex :",
                                              fontSize: 13,
                                              color: greyColor,
                                            ),
                                            KHeight(size: 0.02),
                                            CustomText(
                                              text: "Sub Division :",
                                              fontSize: 13,
                                              color: greyColor,
                                            ),
                                            KHeight(size: 0.02),
                                            CustomText(
                                              text: "Unit  :",
                                              fontSize: 13,
                                              color: greyColor,
                                            ),
                                            // KHeight(size: 0.02),
                                            // CustomText(
                                            //   text: "Renter :",
                                            //   fontSize: 13,
                                            //   color: greyColor,
                                            // ),
                                            // KHeight(size: 0.02),
                                            // CustomText(
                                            //   text: "Status :",
                                            //   fontSize: 13,
                                            //   color: greyColor,
                                            // ),
                                            // KHeight(size: 0.02),
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
                                            CustomText(
                                              text: _data['data'][index]['call_checklist_id'],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: greyColor,
                                            ),
                                            const KHeight(size: 0.018),
                                            CustomText(
                                              text: _data['data'][index]['lead_id_no'],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: greyColor,
                                            ),
                                            const KHeight(size: 0.018),
                                            CustomText(
                                              text: _data['data'][index]['complex'],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: greyColor,
                                            ),
                                            const KHeight(size: 0.018),
                                            CustomText(
                                              text: _data['data'][index]['flr_no'],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: greyColor,
                                            ),
                                            const KHeight(size: 0.018),
                                            CustomText(
                                              text: _data['data'][index]['unit_no'],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: greyColor,
                                            ),
                                            const KHeight(size: 0.018),
                                            // CustomText(
                                            //   text: _data['data'][index]['renter_tbl_id'],
                                            //   fontSize: 14,
                                            //   fontWeight: FontWeight.w600,
                                            //   color: greyColor,
                                            // ),
                                            // const KHeight(size: 0.018),
                                            // const ContainerTextWidget(
                                            //   padding: 3,
                                            //   text: "334 - 302 days",
                                            //   bgColor: greenColor,
                                            //   textColor: whiteColor,
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
                                  const KHeight(size: 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      // const ContainerTextWidget(
                                      //   padding: 4,
                                      //   text: "Documents",
                                      //   fontSize: 16,
                                      //   bgColor: yellowColor,
                                      //   textColor: whiteColor,
                                      // ),
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
                                      //   const ContainerTextWidget(
                                      //     padding: 4,
                                      //     text: "Receipts",
                                      //     fontSize: 16,
                                      //     bgColor: yellowColor,
                                      //     textColor: whiteColor,
                                      //   ),
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
    );
  }
}
