// ignore_for_file: avoid_print
import 'package:esmartpms/controller/deals_controller/deals_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/my_deals/widgets/my_deals_button_widget.dart';
import 'package:esmartpms/view/my_deals/widgets/my_deals_title_widget.dart';
import 'package:flutter/material.dart';

class MyDealsScreen extends StatefulWidget {
  const MyDealsScreen({super.key});

  @override
  State<MyDealsScreen> createState() => _ReservedDealsWidgetState();
}

class _ReservedDealsWidgetState extends State<MyDealsScreen> {
  DealController dealController = DealController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    dealController.fetchData().then((data) {
      setState(() {
        data['data'].sort((a, b) => DateTime.parse(b['added_date']).compareTo(DateTime.parse(a['added_date'])));

        _data = data;
      });
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const CustomText(
                text: "MY DEALS",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeColor,
                textDecoration: TextDecoration.underline,
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
                              height: size.height * 0.46,
                              width: size.width * 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "Start Date : ",
                                              fontSize: 12,
                                              color: greyColor,
                                            ),
                                            const KWidth(size: 0.03),
                                            CustomText(
                                              text: _data['data'][index]['added_date'],
                                              fontSize: 12,
                                              color: greenColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const KHeight(size: 0.01),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomText(
                                              text: "End Date : ",
                                              fontSize: 12,
                                              color: greyColor,
                                            ),
                                            const KWidth(size: 0.044),
                                            CustomText(
                                              text: _data['data'][index]['row_contract']['contract_date'],
                                              fontSize: 12,
                                              color: greenColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const KHeight(size: 0.01),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const MyDealsTitleWidget(),
                                          const KWidth(size: 0.04),
                                          const KHeight(size: 0.04),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const CustomText(
                                                text: ": P.P. Ramesh",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ": ${_data['data'][index]['call_checklist_id']}",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ": ${_data['data'][index]['lead_id_no']}",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ": ${_data['data'][index]['complex']}",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ': ${_data['data'][index]['flr_no']}',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ': ${_data['data'][index]['unit_no']}',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.0146),
                                              CustomText(
                                                text: ': ${_data['data'][index]['checklist_contact_no']}',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: greyColor,
                                              ),
                                              // const KHeight(size: 0.018),
                                              const KHeight(size: 0.018),
                                              const ContainerTextWidget(
                                                padding: 1,
                                                fontSize: 12,
                                                text: "334 - 302 days",
                                                bgColor: greenColor,
                                                textColor: whiteColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const KHeight(size: 0.003),
                                    const MyDealsButtonWidget(),
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
    );
  }
}
