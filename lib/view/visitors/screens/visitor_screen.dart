// ignore_for_file: avoid_print

import 'package:esmartpms/controller/visitor_controller/visitor_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/add_visitor/screens/add_visitor_screen.dart';
import 'package:flutter/material.dart';

class VistorScreen extends StatefulWidget {
  const VistorScreen({super.key});

  @override
  State<VistorScreen> createState() => _VistorScreenState();
}

class _VistorScreenState extends State<VistorScreen> {
  VisitorListController visitorListController = VisitorListController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    visitorListController.fetchVisitorList().then((data) {
      setState(() {
        data['data'].sort((a, b) => DateTime.parse(b['issue_date']).compareTo(DateTime.parse(a['issue_date'])));
        _data = data;
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
                text: "VISITORS LIST",
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: themeColor,
              ),
              const KHeight(size: 0.01),
              _data.isEmpty
                  ? const Center(
                      child: CustomText(text: "No Data Available"),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _data['data'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: size.height * 0.32,
                              decoration: BoxDecoration(
                                color: primaryColor,
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
                                          text: "Unit No :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Issue Date :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Name :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Mobile No :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Address :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Floor No :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "In-Time :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Out-Time :",
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                        KHeight(size: 0.01),
                                        CustomText(
                                          text: "Closed :",
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['unit_nb'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['issue_date'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['name'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['mobile'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['address'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['floor_nb'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['intime'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: _data['data'][index]['outtime'],
                                          color: greyColor,
                                        ),
                                        const KHeight(size: 0.007),
                                        const CustomText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          text: "No",
                                          color: greyColor,
                                        ),
                                      ],
                                    ),
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
            builder: (context) => const AddVisitorScreen(),
          ));
        },
      ),
    ));
  }
}
