import 'package:esmartpms/controller/invoice_controller/invoice_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:esmartpms/view/invoice/screens/invoice_screen.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:flutter/material.dart';

class InvoiceListingScreen extends StatefulWidget {
  const InvoiceListingScreen({super.key});

  @override
  State<InvoiceListingScreen> createState() => _InvoiceListingScreenState();
}

class _InvoiceListingScreenState extends State<InvoiceListingScreen> {
  InvoiceController invoiceController = InvoiceController();
  Map<String, dynamic> _data = {};
  String? invoiceId;

  @override
  void initState() {
    super.initState();
    invoiceController.fetchInvoices().then((data) {
      setState(() {
        // Sort the invoices by the latest date first
        data['data'].sort((a, b) => DateTime.parse(b['invoice_date']).compareTo(DateTime.parse(a['invoice_date'])));
        _data = data;
        invoiceId = data['invoice_id'];
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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text: "MY INVOICES",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                  textDecoration: TextDecoration.underline,
                ),
                const KHeight(size: 0.004),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: CustomText(
                            text: "Total Invoices : ${_data['data'] != null ? _data['data'].length : 0}",
                            color: blackColor,
                          ),
                        ),
                      ),
                      const KHeight(size: 0.01),
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
                                      height: size.height * 0.36,
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
                                                        text: "Invoice No",
                                                        fontSize: 14,
                                                        color: greyColor,
                                                      ),
                                                      KHeight(size: 0.02),
                                                      CustomText(
                                                        text: "Issue Date",
                                                        fontSize: 14,
                                                        color: greyColor,
                                                      ),
                                                      KHeight(size: 0.02),
                                                      CustomText(
                                                        text: "Complex No",
                                                        fontSize: 14,
                                                        color: greyColor,
                                                      ),
                                                      KHeight(size: 0.02),
                                                      CustomText(
                                                        text: "Sub Division",
                                                        fontSize: 14,
                                                        color: greyColor,
                                                      ),
                                                      KHeight(size: 0.02),
                                                      CustomText(
                                                        text: "Unit No",
                                                        fontSize: 14,
                                                        color: greyColor,
                                                      ),
                                                      KHeight(size: 0.02),
                                                      CustomText(
                                                        text: "Invoice Amount",
                                                        fontSize: 14,
                                                        color: greyColor,
                                                      ),
                                                      // KHeight(size: 0.02),
                                                    ],
                                                  ),
                                                  const KWidth(size: 0.04),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                        text: ": ${_data['data'][index]['invoice_no']}",
                                                        color: greyColor,
                                                      ),
                                                      const KHeight(size: 0.017),
                                                      CustomText(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                        text: ": ${_data['data'][index]['invoice_date']}",
                                                        color: greyColor,
                                                      ),
                                                      const KHeight(size: 0.017),
                                                      CustomText(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                        text: ": ${_data['data'][index]['complex']}",
                                                        color: greyColor,
                                                      ),
                                                      const KHeight(size: 0.017),
                                                      CustomText(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                        text: ": ${_data['data'][index]['flr_no']}",
                                                        color: greyColor,
                                                      ),
                                                      const KHeight(size: 0.017),
                                                      CustomText(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                        text: ": ${_data['data'][index]['unit_no']}",
                                                        color: greyColor,
                                                      ),
                                                      const KHeight(size: 0.017),
                                                      CustomText(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                        text: ": ${_data['data'][index]['invoice_net_total']}",
                                                        color: greyColor,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const KHeight(size: 0.01),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                const ContainerTextWidget(
                                                  padding: 4,
                                                  text: "Generate PDF",
                                                  fontSize: 16,
                                                  bgColor: yellowColor,
                                                  textColor: whiteColor,
                                                ),
                                                ContainerTextWidget(
                                                  onTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => InvoiceScreen(
                                                        invoiceId: _data['data'][index]['invoice_id'],
                                                      ),
                                                    ));
                                                  },
                                                  padding: 4,
                                                  text: "   View Invoice  ",
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
      ),
    );
  }
}
