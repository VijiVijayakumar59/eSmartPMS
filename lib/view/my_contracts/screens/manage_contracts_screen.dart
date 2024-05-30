// ignore_for_file: avoid_print

import 'package:esmartpms/controller/contract_controller/contract_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/my_contracts/widgets/my_contract_button_widget.dart';
import 'package:esmartpms/view/my_contracts/widgets/my_contract_initial_button_widget.dart';
import 'package:esmartpms/view/my_contracts/widgets/my_contract_title_widget.dart';
import 'package:flutter/material.dart';

class ManageContractScreen extends StatefulWidget {
  const ManageContractScreen({super.key});

  @override
  State<ManageContractScreen> createState() => _ManageContractScreenState();
}

class _ManageContractScreenState extends State<ManageContractScreen> {
  ContractController contractController = ContractController();
  Map<String, dynamic> _data = {};
  @override
  void initState() {
    super.initState();
    contractController.fetchData().then((data) {
      setState(() {
        _data = data;
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
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                    child: Column(children: [
                  const CustomText(
                    text: "MY CONTRACTS",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: themeColor,
                    textDecoration: TextDecoration.underline,
                  ),
                  const KHeight(size: 0.014),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
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
                                          elevation: 6,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                          color: primaryColor,
                                          child: SizedBox(
                                              height: size.height * 0.43,
                                              width: size.width * 1,
                                              child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children: [
                                                    const MyContractInitialButtons(),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          const MyContractsTitleWidget(),
                                                          const KWidth(size: 0.04),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const KHeight(size: 0.02),
                                                              CustomText(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                text: ": ${_data['data'][index]['row_contract']['contreact_ref_no']}",
                                                                color: greyColor,
                                                              ),
                                                              const KHeight(size: 0.017),
                                                              CustomText(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                text: ": ${_data['data'][index]['complex']}",
                                                                color: greyColor,
                                                              ),
                                                              const KHeight(size: 0.017),
                                                              CustomText(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                text: ": ${_data['data'][index]['unit_no']}",
                                                                color: greyColor,
                                                              ),
                                                              const KHeight(size: 0.017),
                                                              CustomText(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                text: ": ${_data['data'][index]['lead_id_no']}",
                                                                color: greyColor,
                                                              ),
                                                              const KHeight(size: 0.017),
                                                              CustomText(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                text: ": ${_data['data'][index]['flr_no']}",
                                                                color: greyColor,
                                                              ),
                                                              const KHeight(size: 0.017),
                                                              const CustomText(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                text: ": Mr. Lost and Found Office",
                                                                color: greyColor,
                                                              ),
                                                              const KHeight(size: 0.017),
                                                              const ContainerTextWidget(
                                                                padding: 0,
                                                                text: "  OPEN",
                                                                fontSize: 10,
                                                                bgColor: greenColor,
                                                                textColor: whiteColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const KHeight(size: 0.015),
                                                    MyContractButtonWidget(size: size)
                                                  ])))));
                                })
                      ]))
                ])))));
  }
}
