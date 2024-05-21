import 'package:esmartpms/controller/over_due_invoices/over_due_invoices.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class OverDueInvoiceScreen extends StatefulWidget {
  const OverDueInvoiceScreen({super.key});

  @override
  State<OverDueInvoiceScreen> createState() => _OverDueInvoiceScreenState();
}

class _OverDueInvoiceScreenState extends State<OverDueInvoiceScreen> {
  OverDueInvoicesController overDueInvoicesController = OverDueInvoicesController();
  Map<String, dynamic> _data = {};
  double _totalOverdueAmount = 0.0;

  @override
  void initState() {
    super.initState();
    overDueInvoicesController.fetchOverDueInvoices().then((data) {
      setState(() {
        data['data'].sort((a, b) => DateTime.parse(b['added_date']).compareTo(DateTime.parse(a['added_date'])));

        _data = data;
        _totalOverdueAmount = data['data'].fold(0.0, (sum, item) {
          double invoiceAmount = 0.0;
          try {
            invoiceAmount = double.parse(item['invoice_sub_total'].toString());
          } catch (e) {
            print('Error parsing invoice_sub_total: $e');
          }
          return sum + invoiceAmount;
        });
      });
    }).catchError((error) {
      print('Error fetching data: $error');
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
            ),
          ),
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
                  text: "OVER DUE INVOICES",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
                const KHeight(size: 0.01),
                CustomText(
                  text: "Over Due Invoice Amount : ₹${_totalOverdueAmount.toStringAsFixed(2)}",
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 241, 16, 0),
                ),
                _data.isEmpty
                    ? const Center(child: CircularProgressIndicator())
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
                                height: size.height * 0.16,
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
                                            text: "Invoice No",
                                            fontSize: 14,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.015),
                                          CustomText(
                                            text: "Issued Date",
                                            fontSize: 14,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.015),
                                          CustomText(
                                            text: "Due Date",
                                            fontSize: 14,
                                            color: greyColor,
                                          ),
                                          KHeight(size: 0.015),
                                          CustomText(
                                            text: "Amount Pending",
                                            fontSize: 14,
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
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            text: ": ${_data['data'][index]['invoice_no']}",
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.012),
                                          CustomText(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            text: ": ${_data['data'][index]['invoice_date']}",
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.012),
                                          CustomText(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            text: ": ${_data['data'][index]['invoice_due_date']}",
                                            color: greyColor,
                                          ),
                                          const KHeight(size: 0.012),
                                          CustomText(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            text: ": ${_data['data'][index]['invoice_sub_total']}",
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
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
