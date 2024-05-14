import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      // backgroundColor: const Color.fromRGBO(213, 230, 255, 0.902),
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
                  text: "EVENT LIST",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
                const KHeight(size: 0.01),
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
                            height: size.height * 0.12,
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
                                        text: "Title",
                                        fontSize: 13,
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.007),
                                      CustomText(
                                        text: "Venue",
                                        fontSize: 13,
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.007),
                                      CustomText(
                                        text: "Status",
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
                                        text: ": First Event",
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.003),
                                      CustomText(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        text: ": India",
                                        color: greyColor,
                                      ),
                                      KHeight(size: 0.003),
                                      CustomText(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        text: ": Expired",
                                        color: yellowColor,
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
