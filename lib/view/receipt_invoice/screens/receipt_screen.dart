// ignore_for_file: avoid_print

import 'package:esmartpms/controller/receipt_controller/receipt_view_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/contract_details/widgets/key_value_widget.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ReceiptScreen extends StatefulWidget {
  final String receiptId;

  const ReceiptScreen({
    super.key,
    required this.receiptId,
  });

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  ReceiptViewController receiptViewController = ReceiptViewController();

  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    ReceiptViewController().getSingleReceipt(widget.receiptId).then((data) {
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
      body: _data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: lightGreen,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Center(
                          child: CustomText(
                            text: "PAYMENT RECEIPT",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: size.height * 0.6,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Column(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     CustomText(
                                //       text: "The Bridge Club Residence & Office Oxley Worldbridge Asset Management(Cambodia)Co.Ltd",
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w500,
                                //       height: 1.4,
                                //       textAlign: TextAlign.end,
                                //     ),
                                //     KHeight(size: 0.007),
                                //     CustomText(
                                //       text: "No:1 Street 278,Sangkat Boeung Keng Kang 1, Khan Chamkarmon Phnom Penh, Cambodia",
                                //       fontSize: 13,
                                //       height: 1.5,
                                //       textAlign: TextAlign.end,
                                //     ),
                                //   ],
                                // ),
                                const KHeight(size: 0.03),
                                const CustomText(
                                  text: "Payment Receipt",
                                  fontSize: 16,
                                  color: yellowColor,
                                ),
                                const KHeight(size: 0.007),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "Tenant Name :",
                                              fontSize: 10,
                                              color: greyColor,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.04,
                                              width: size.width * 0.28,
                                              child: CustomText(
                                                text: "${_data['data']['receipt']['receipt_customer_name']}",
                                                fontSize: 11,
                                                maxLines: 3,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const KHeight(size: 0.007),
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "Premises",
                                              fontSize: 10,
                                              color: greyColor,
                                            ),
                                            CustomText(
                                              text: ": ${_data['data']['tbl_checklist_history']['complex']}",
                                              fontSize: 11,
                                            ),
                                          ],
                                        ),
                                        const KHeight(size: 0.007),
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "Unit No",
                                              fontSize: 10,
                                              color: greyColor,
                                            ),
                                            CustomText(
                                              text: ": ${_data['data']['tbl_checklist_history']['unit_no']}",
                                              fontSize: 11,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const CustomText(
                                                  text: "Payment Receipt No",
                                                  fontSize: 9,
                                                  color: greyColor,
                                                ),
                                                CustomText(
                                                  text: ": ${_data['data']['receipt']['receipt_no']}",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                            const KHeight(size: 0.007),
                                            Row(
                                              children: [
                                                const CustomText(
                                                  text: "Payment Date",
                                                  fontSize: 9,
                                                  color: greyColor,
                                                ),
                                                CustomText(
                                                  text: ": ${_data['data']['receipt']['receipt_date']}",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                            const KHeight(size: 0.007),
                                            Row(
                                              children: [
                                                const CustomText(
                                                  text: "Period",
                                                  fontSize: 9,
                                                  color: greyColor,
                                                ),
                                                CustomText(
                                                  text: ": ${_data['data']['receipt']['receipt_date']} - ${_data['data']['receipt']['receipt_date']} ",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const KHeight(size: 0.02),
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  elevation: 4,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: const Color.fromRGBO(171, 198, 235, 0.902),
                                        ),
                                        height: size.height * 0.15,
                                        width: double.infinity,
                                        child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const KeyValueWidget(
                                                  head: "NO",
                                                  value: ": 1",
                                                ),
                                                KeyValueWidget(
                                                  head: "MODE",
                                                  value: ": ${_data['data']['receipt']['receipt_payment_method']}",
                                                ),
                                                const KeyValueWidget(
                                                  head: "Description",
                                                  value: ": N/A",
                                                ),
                                                KeyValueWidget(
                                                  head: "Amount",
                                                  value: ": ${_data['data']['receipt']['receipt_net_amount_paid']}",
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                const KHeight(size: 0.02),
                                Row(
                                  children: [
                                    const CustomText(
                                      text: "Being payment for ",
                                      fontSize: 11,
                                      color: greyColor,
                                    ),
                                    CustomText(text: ": ${_data['data']['invoice_no']}"),
                                  ],
                                ),
                                const KHeight(size: 0.01),
                                Row(
                                  children: [
                                    const CustomText(
                                      text: "Total Amount Received",
                                      fontSize: 11,
                                      color: greyColor,
                                    ),
                                    CustomText(text: ": ${_data['data']['receipt']['receipt_net_amount_paid']}"),
                                  ],
                                ),
                                const KHeight(size: 0.01),
                                const CustomText(
                                  text: "Attention : This receipt must be validated with an authorized signature",
                                  fontSize: 12,
                                ),
                                const KHeight(size: 0.01),
                                const CustomText(
                                  text: "For cheque payment, this receipt will only be valid after the cheque clearance by bank",
                                  fontSize: 12,
                                ),
                                const KHeight(size: 0.02),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: "Issued By",
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    ));
  }
}
