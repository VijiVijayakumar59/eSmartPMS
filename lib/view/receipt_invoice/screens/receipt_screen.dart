import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/contract_details/widgets/key_value_widget.dart';
import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

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
                padding: const EdgeInsets.all(14.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: size.height * 0.71,
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "The Bridge Club Residence & Office Oxley Worldbridge Asset Management(Cambodia)Co.Ltd",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                                textAlign: TextAlign.end,
                              ),
                              KHeight(size: 0.007),
                              CustomText(
                                text: "No:1 Street 278,Sangkat Boeung Keng Kang 1, Khan Chamkarmon Phnom Penh, Cambodia",
                                fontSize: 13,
                                height: 1.5,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          const KHeight(size: 0.03),
                          const CustomText(
                            text: "Payment Receipt",
                            fontSize: 16,
                            color: yellowColor,
                          ),
                          const KHeight(size: 0.007),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Tenant Name",
                                        fontSize: 10,
                                        color: greyColor,
                                      ),
                                      CustomText(
                                        text: " : Mr. anxol",
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                  KHeight(size: 0.007),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Premises",
                                        fontSize: 10,
                                        color: greyColor,
                                      ),
                                      CustomText(
                                        text: " : SSM Resort",
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                  KHeight(size: 0.007),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Unit No",
                                        fontSize: 10,
                                        color: greyColor,
                                      ),
                                      CustomText(
                                        text: " : 04",
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
                                          CustomText(
                                            text: "Payment Receipt No",
                                            fontSize: 9,
                                            color: greyColor,
                                          ),
                                          CustomText(
                                            text: " : Pay/2023-000002",
                                            fontSize: 10,
                                          ),
                                        ],
                                      ),
                                      KHeight(size: 0.007),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: "Payment Date",
                                            fontSize: 9,
                                            color: greyColor,
                                          ),
                                          CustomText(
                                            text: " : 10-06-2023",
                                            fontSize: 10,
                                          ),
                                        ],
                                      ),
                                      KHeight(size: 0.007),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: "Period",
                                            fontSize: 9,
                                            color: greyColor,
                                          ),
                                          CustomText(
                                            text: " : 10-06-23 - 10-06-23",
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
                                  child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          KeyValueWidget(
                                            head: "NO",
                                            value: ": 1",
                                          ),
                                          KeyValueWidget(
                                            head: "MODE",
                                            value: ": Cash",
                                          ),
                                          KeyValueWidget(
                                            head: "Description",
                                            value: ": ",
                                          ),
                                          KeyValueWidget(
                                            head: "Amount",
                                            value: ": ₹50,000",
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const KHeight(size: 0.02),
                          const Row(
                            children: [
                              CustomText(
                                text: "Being payment for : ",
                                fontSize: 11,
                                color: greyColor,
                              ),
                              CustomText(text: "INV NO.INVKCU/2023-003"),
                            ],
                          ),
                          const KHeight(size: 0.01),
                          const Row(
                            children: [
                              CustomText(
                                text: "Total Amount Received : ",
                                fontSize: 11,
                                color: greyColor,
                              ),
                              CustomText(text: "₹500,000"),
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
