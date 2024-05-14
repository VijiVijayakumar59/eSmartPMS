import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: SafeArea(
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "NOTIFICATION",
                    fontSize: 21,
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const KHeight(size: 0.01),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Color containerColor = index % 2 == 0 ? lightGreen : secondaryColor;

                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "7th April 2024",
                                      fontSize: 10,
                                      color: greyColor,
                                    ),
                                    CustomText(
                                      text: "Kris",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: "Invoice Payment is in due for the last 20 days",
                                      color: greyColor,
                                      fontSize: 14,
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
      ),
    );
  }
}
