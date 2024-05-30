// ignore_for_file: avoid_print

import 'package:esmartpms/controller/receipt_controller/receipt_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/receipt_invoice/screens/receipt_screen.dart';
import 'package:esmartpms/view/receipt_listing/widgets/receipt_listing_title_widget.dart';
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
        setState(() {
          data['data'].sort((a, b) => DateTime.parse(b['receipt_date']).compareTo(DateTime.parse(a['receipt_date'])));

          _data = data;
        });
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomText(
                text: "RECEIPT",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeColor,
                textDecoration: TextDecoration.underline,
              ),
              const KHeight(size: 0.01),
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
                                    height: size.height * 0.41,
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
                                                const ReceiptListingTitleWidget(),
                                                const KWidth(size: 0.04),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['receipt_no']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0176),
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['receipt_date']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0176),
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['complex']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0176),
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['flr_no']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0176),
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['unit_no']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0176),
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['receipt_payment_method']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.0176),
                                                    CustomText(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      text: ": ${_data['data'][index]['receipt_net_amount_paid']}",
                                                      color: greyColor,
                                                    ),
                                                    const KHeight(size: 0.027),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.3,
                                                height: size.height * 0.038,
                                                child: ContainerTextWidget(
                                                  onTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => ReceiptScreen(
                                                        receiptId: _data['data'][index]['receipt_id'],
                                                      ),
                                                    ));
                                                  },
                                                  padding: 4,
                                                  text: "View Receipt",
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
