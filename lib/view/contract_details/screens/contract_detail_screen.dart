// ignore_for_file: library_private_types_in_public_api

import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/contract_details/widgets/key_value_widget.dart';
import 'package:flutter/material.dart';

class ContractDetailScreen extends StatefulWidget {
  const ContractDetailScreen({super.key});

  @override
  _ContractDetailScreenState createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<ContractDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
          child: Center(
            child: Column(
              children: [
                const CustomText(
                  text: "CONTRACT DETAILS",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
                const KHeight(size: 0.01),
                const CustomText(
                  text: "P.P Ramesh, S-CON/2021-006",
                  fontSize: 24,
                ),
                const KHeight(size: 0.01),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const ExpansionTile(
                            visualDensity: VisualDensity.comfortable,
                            collapsedBackgroundColor: Color.fromARGB(255, 245, 208, 140),
                            backgroundColor: Color.fromARGB(255, 253, 230, 194),
                            textColor: themeColor,
                            iconColor: themeColor,
                            title: CustomText(
                              text: "Reserved Details",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              Divider(
                                thickness: 2,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    KeyValueWidget(
                                      head: "Reservation No",
                                      value: ":123456",
                                    ),
                                    KeyValueWidget(
                                      head: "Name",
                                      value: "Ramesh",
                                    ),
                                    KeyValueWidget(
                                      head: "Company Name",
                                      value: ":Axnol",
                                    ),
                                    KeyValueWidget(
                                      head: "Type",
                                      value: ":Base",
                                    ),
                                    KeyValueWidget(
                                      head: "From Date",
                                      value: ":10-10-1998",
                                    ),
                                    KeyValueWidget(
                                      head: "To Date",
                                      value: ":10-10-1998",
                                    ),
                                    KeyValueWidget(
                                      head: "Complex",
                                      value: ":123ilcom",
                                    ),
                                    KeyValueWidget(
                                      head: "Sub Division",
                                      value: ":Combodia",
                                    ),
                                    KeyValueWidget(
                                      head: "Unit",
                                      value: ":1",
                                    ),
                                    KeyValueWidget(
                                      head: "Status",
                                      value: ":Active",
                                    ),
                                    KeyValueWidget(
                                      head: "Remark",
                                      value: ":Done",
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
