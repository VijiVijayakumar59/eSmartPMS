// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:esmartpms/controller/invoice_controller/invoice_view_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/key_value/key_value_widget.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  final String invoiceId;
  const InvoiceScreen({super.key, required this.invoiceId});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  InvoiceViewController invoiceViewController = InvoiceViewController();

  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    InvoiceViewController().getSingleInvoice(widget.invoiceId).then((data) {
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
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: lightGreen,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: CustomText(
                          text: _data['data']['invoice']['invoice_no'],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: size.height * 0.65,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const KHeight(size: 0.04),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "Invoice",
                                        fontSize: 16,
                                        color: yellowColor,
                                      ),
                                      const KHeight(size: 0.007),
                                      Row(
                                        children: [
                                          const CustomText(
                                            text: "Invoice No",
                                            fontSize: 11,
                                            color: greyColor,
                                          ),
                                          CustomText(text: ": ${_data['data']['invoice']['invoice_no']}"),
                                        ],
                                      ),
                                      const KHeight(size: 0.007),
                                      Row(
                                        children: [
                                          const CustomText(
                                            text: "Issue Date",
                                            fontSize: 11,
                                            color: greyColor,
                                          ),
                                          CustomText(text: ": ${_data['data']['invoice']['invoice_date']}"),
                                        ],
                                      ),
                                      const KHeight(size: 0.007),
                                      Row(
                                        children: [
                                          const CustomText(
                                            text: "Period",
                                            fontSize: 11,
                                            color: greyColor,
                                          ),
                                          CustomText(text: ": ${_data['data']['invoice']['invoice_due_date']}"),
                                        ],
                                      ),
                                      const KHeight(size: 0.007),
                                      const Row(
                                        children: [
                                          CustomText(
                                            text: "Payment Period",
                                            fontSize: 11,
                                            color: greyColor,
                                          ),
                                          CustomText(text: " : 0 Days"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const CustomText(
                                        text: "Bill To",
                                        fontSize: 16,
                                        color: greenColor,
                                      ),
                                      const KHeight(size: 0.007),
                                      CustomText(
                                        text: _data['data']['invoice']['invoice_customer_name'],
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const KHeight(size: 0.007),
                                      SizedBox(
                                        height: 20,
                                        width: 130,
                                        child: Text(
                                          _data['data']['tbl_checklist_history']['complex'],
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            height: 1.4,
                                            fontSize: 13,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
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
                                      height: size.height * 0.2,
                                      width: double.infinity,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              KeyValueWidget(
                                                head: "Name",
                                                value: ": ${_data['data']['invoice']['invoice_customer_name']}",
                                              ),
                                              const KeyValueWidget(
                                                head: "Qty",
                                                value: ": 2",
                                              ),
                                              KeyValueWidget(
                                                head: "Price",
                                                value: ": ${_data['data']['invoice']['receipt_amount']}",
                                              ),
                                              KeyValueWidget(
                                                head: "Total",
                                                value: ": ${_data['data']['invoice']['invoice_net_total']}",
                                              ),
                                              KeyValueWidget(
                                                head: "Sub Total",
                                                value: ": ${_data['data']['invoice']['invoice_sub_total']}",
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              const KHeight(size: 0.05),
                              const Row(
                                children: [
                                  CustomText(
                                    text: "Available Credit Limit : ",
                                    fontSize: 11,
                                    color: greyColor,
                                  ),
                                  CustomText(text: "₹0.00"),
                                ],
                              ),
                              const KHeight(size: 0.01),
                              const CustomText(
                                text: "Remark / Payment Instructions : ",
                                fontSize: 11,
                                color: greyColor,
                              ),
                              const KHeight(size: 0.03),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: "Company Signature",
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
    ));
  }
}
