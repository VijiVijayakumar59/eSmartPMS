import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/contract_details/widgets/key_value_widget.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

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
        padding: const EdgeInsets.only(top: 20),
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
                    text: "INV/2022-000001",
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
                  height: size.height * 0.75,
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
                        const KHeight(size: 0.04),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Invoice",
                                  fontSize: 16,
                                  color: yellowColor,
                                ),
                                KHeight(size: 0.007),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Invoice No",
                                      fontSize: 11,
                                      color: greyColor,
                                    ),
                                    CustomText(text: " : INV/2022-000001"),
                                  ],
                                ),
                                KHeight(size: 0.007),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Issue Date",
                                      fontSize: 11,
                                      color: greyColor,
                                    ),
                                    CustomText(text: " : 04/02/2022"),
                                  ],
                                ),
                                KHeight(size: 0.007),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Period",
                                      fontSize: 11,
                                      color: greyColor,
                                    ),
                                    CustomText(text: " : 04/02/2022"),
                                  ],
                                ),
                                KHeight(size: 0.007),
                                Row(
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
                                CustomText(
                                  text: "Bill To",
                                  fontSize: 16,
                                  color: greenColor,
                                ),
                                KHeight(size: 0.007),
                                CustomText(
                                  text: "Mr. Wang Weidong",
                                  fontWeight: FontWeight.bold,
                                ),
                                KHeight(size: 0.007),
                                SizedBox(
                                  height: 20,
                                  width: 130,
                                  child: Text(
                                    "The Bridge SOHO Office 20 - 42",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
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
                                child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        KeyValueWidget(
                                          head: "Name",
                                          value: ": Mr.Axnol",
                                        ),
                                        KeyValueWidget(
                                          head: "Qty",
                                          value: ": 2",
                                        ),
                                        KeyValueWidget(
                                          head: "Price",
                                          value: ": ₹50,000",
                                        ),
                                        KeyValueWidget(
                                          head: "Total",
                                          value: ": ₹50,000",
                                        ),
                                        KeyValueWidget(
                                          head: "Sub Total",
                                          value: ": ₹50,000",
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
