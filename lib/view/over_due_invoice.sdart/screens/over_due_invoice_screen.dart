import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class OverDueInvoiceScreen extends StatelessWidget {
  const OverDueInvoiceScreen({super.key});

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text: "OVER DUE INVOICES",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
                const KHeight(size: 0.01),
                const CustomText(
                  text: "Over Due Invoice Amount : ₹2000.00",
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 241, 16, 0),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 12,
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
                            height: size.height * 0.13,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Invoice No",
                                        fontSize: 13,
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.007),
                                      CustomText(
                                        text: "Issued Date",
                                        fontSize: 13,
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.007),
                                      CustomText(
                                        text: "Due Date",
                                        fontSize: 13,
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.007),
                                      CustomText(
                                        text: "Amount Pending",
                                        fontSize: 13,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                  KWidth(size: 0.04),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        text: ": INV/2022-000001",
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.003),
                                      CustomText(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        text: ": 16/02/2022",
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.003),
                                      CustomText(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        text: ": 17/02/2022",
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.003),
                                      CustomText(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        text: ": ₹ 976.00",
                                        color: Colors.red,
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
      ),
    ));
  }
}
