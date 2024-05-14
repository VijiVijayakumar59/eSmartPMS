import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/login/screens/login_screen.dart';
import 'package:esmartpms/view/my_deals/widgets/text_with_icon_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/splash.png",
            height: size.height * 0.68,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const KHeight(size: 0.01),
          Image.asset(
            "assets/images/PMSlogo.png",
            height: size.height * 0.077,
            width: size.width * 0.6,
            fit: BoxFit.contain,
          ),
          const KHeight(size: 0.02),
          const CustomText(
            text: "Find your dream properties with advance search and personal recommendations",
            textAlign: TextAlign.center,
            fontSize: 12,
          ),
          const KHeight(size: 0.02),
          TextWithIconWidget(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            },
            height: 0.04,
            width: 0.36,
            icon: Icons.arrow_forward,
            text: "Continue  ",
            fontSize: 12,
            iconColor: whiteColor,
            textColor: whiteColor,
            iconSize: 20,
            bgColor: themeColor,
          ),
        ],
      ),
    ));
  }
}
