import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class ParkingCodeScreen extends StatelessWidget {
  const ParkingCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 231, 201),
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
          child: Column(
            children: [
              const CustomText(
                text: "VIEW PARKING QR CODE",
                fontSize: 20,
                color: themeColor,
                fontWeight: FontWeight.w500,
              ),
              const KHeight(size: 0.06),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CustomText(text: "Complex No "),
                      KHeight(size: 0.04),
                      CustomText(text: "Complex No "),
                      KHeight(size: 0.04),
                      CustomText(text: "Complex No "),
                      KHeight(size: 0.04),
                      CustomText(text: "Complex No "),
                      KHeight(size: 0.04),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: ": Gateway Complex",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      KHeight(size: 0.04),
                      CustomText(
                        text: ": 12th Floor",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      KHeight(size: 0.04),
                      CustomText(
                        text: ": 112",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      KHeight(size: 0.04),
                      CustomText(
                        text: ": A2039",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      KHeight(size: 0.04),
                    ],
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.2,
                  child: Image.network(
                      "https://media.istockphoto.com/id/828088276/vector/qr-code-illustration.jpg?s=612x612&w=0&k=20&c=FnA7agr57XpFi081ZT5sEmxhLytMBlK4vzdQxt8A70M=")),
            ],
          ),
        ),
      ),
    ));
  }
}
