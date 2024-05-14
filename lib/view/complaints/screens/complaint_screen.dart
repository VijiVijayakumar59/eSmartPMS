// ignore_for_file: avoid_print

import 'package:esmartpms/controller/complaint_controller/complaint_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/add_complaints/screens/add_complaints_screen.dart';
import 'package:flutter/material.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  ComplaintController complaintController = ComplaintController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    complaintController.fetchComplaints().then((data) {
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
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(
                  text: "COMPLAINTS",
                  fontSize: 21,
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                ),
                const KHeight(size: 0.01),
                _data.isEmpty
                    ? const Center(child: CustomText(text: "No Data Available"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _data['data'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Color containerColor = index % 2 == 0 ? secondaryColor : lightGreen;

                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: containerColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Complaint Code :",
                                            fontSize: 13,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.008),
                                          CustomText(
                                            text: "Entity :",
                                            fontSize: 13,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.008),
                                          CustomText(
                                            text: "Date :",
                                            fontSize: 13,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.008),
                                          CustomText(
                                            text: "Title :",
                                            fontSize: 13,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.008),
                                          CustomText(
                                            text: "Descriptions :",
                                            fontSize: 13,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.008),
                                          CustomText(
                                            text: "Actions :",
                                            fontSize: 13,
                                            color: greyColor,
                                          ),
                                        ],
                                      ),
                                      const KWidth(size: 0.04),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            text: _data['data'][index]['complaint_code'],
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.006),
                                          CustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            text: _data['data'][index]['unit_nb'],
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.006),
                                          CustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            text: _data['data'][index]['c_date'],
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.006),
                                          CustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            text: _data['data'][index]['c_title'],
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.006),
                                          CustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            text: _data['data'][index]['c_description'],
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.006),
                                          CustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            text: _data['data'][index]['status'],
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      //   children: [
                                      //     IconButton(
                                      //       onPressed: () {},
                                      //       icon: const Icon(Icons.edit),
                                      //       color: Colors.blue,
                                      //     ),
                                      //     IconButton(
                                      //       onPressed: () {},
                                      //       icon: const Icon(Icons.delete),
                                      //       color: Colors.red,
                                      //     ),
                                      //     IconButton(
                                      //       onPressed: () {},
                                      //       icon: const Icon(Icons.archive),
                                      //       color: Colors.green,
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddComplaintScreen(),
            ));
          },
        ),
      ),
    );
  }
}
