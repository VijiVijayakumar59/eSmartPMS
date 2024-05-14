// ignore_for_file: avoid_print

import 'package:esmartpms/controller/receipt_controller/receipt_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/manage_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/receipt_invoice/screens/receipt_screen.dart';
import 'package:flutter/material.dart';

class ReceiptListingScreen extends StatefulWidget {
  const ReceiptListingScreen({super.key});

  @override
  State<ReceiptListingScreen> createState() => _ReceiptListingScreenState();
}

class _ReceiptListingScreenState extends State<ReceiptListingScreen> {
  ReceiptController receiptController = ReceiptController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    receiptController.fetchReceipt().then((data) {
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomText(
                text: "RECEIPT",
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: themeColor,
              ),
              const KHeight(size: 0.02),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: "Mr.Wang Weidong, S-CON/2021-006",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: "01/07/2021 - 30/06/2022",
                        fontSize: 18,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                                    height: size.height * 0.4,
                                    width: size.width * 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              ContainerTextWidget(
                                                padding: 3,
                                                text: "Paid",
                                                fontSize: 12,
                                                bgColor: greenColor,
                                                textColor: whiteColor,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: "Receipt No :",
                                                      fontSize: 13,
                                                      color: greyColor,
                                                    ),
                                                    KHeight(size: 0.02),
                                                    CustomText(
                                                      text: "Receipt Date :",
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
                                                      text: "Unit :",
                                                      fontSize: 13,
                                                      color: greyColor,
                                                    ),
                                                    KHeight(size: 0.02),
                                                    CustomText(
                                                      text: "Payment Method :",
                                                      fontSize: 13,
                                                      color: greyColor,
                                                    ),
                                                    // KHeight(size: 0.02),
                                                    // CustomText(
                                                    //   text: "Remarks :",
                                                    //   fontSize: 13,
                                                    //   color: greyColor,
                                                    // ),
                                                    KHeight(size: 0.02),
                                                    CustomText(
                                                      text: "Amount :",
                                                      fontSize: 13,
                                                      color: greyColor,
                                                    ),
                                                    KHeight(size: 0.02),
                                                    // CustomText(
                                                    //   text: "Status :",
                                                    //   fontSize: 13,
                                                    //   color: greyColor,
                                                    // ),
                                                  ],
                                                ),
                                                const KWidth(size: 0.04),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['receipt_no'],
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0126),
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['receipt_date'],
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0126),
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['complex'],
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0126),
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['flr_no'],
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0126),
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['unit_no'],
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0126),
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['receipt_payment_method'],
                                                      color: greyColor,
                                                    ),
                                                    // const KHeight(size: 0.0126),
                                                    // CustomText(
                                                    //   fontSize: 17,
                                                    //   fontWeight: FontWeight.w600,
                                                    //   text: _data['data'][index]['unit_no'],
                                                    //   color: greyColor,
                                                    // ),
                                                    const KHeight(size: 0.0126),
                                                    CustomText(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                      text: _data['data'][index]['receipt_net_amount_paid'],
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.026),
                                                    // CustomText(
                                                    //   fontSize: 17,
                                                    //   fontWeight: FontWeight.w600,
                                                    //   text: _data['data'][index]['unit_no'],
                                                    //   color: greyColor,
                                                    // ),
                                                    // const KHeight(size: 0.0126),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.2,
                                                height: size.height * 0.03,
                                                child: ContainerTextWidget(
                                                  onTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => const ReceiptScreen(),
                                                    ));
                                                  },
                                                  padding: 4,
                                                  text: "    View",
                                                  fontSize: 16,
                                                  bgColor: yellowColor,
                                                  textColor: whiteColor,
                                                ),
                                              ),
                                              const ContainerTextWidget(
                                                padding: 4,
                                                text: "Generate PDF",
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}
