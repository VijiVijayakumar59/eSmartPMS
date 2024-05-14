import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/contact_admin/screens/feedback_screen.dart';
import 'package:flutter/material.dart';

class ContactAdminScreen extends StatelessWidget {
  const ContactAdminScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomText(
                  text: "CONTACT ADMIN",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
              ),
              const KHeight(size: 0.01),
              const CustomText(
                text: "Type",
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: themeColor,
              ),
              const KHeight(size: 0.02),
              SizedBox(
                height: size.height * 0.05,
                child: const SegmentedTabControl(
                  indicatorPadding: EdgeInsets.all(4),
                  tabTextColor: Colors.black,
                  selectedTabTextColor: whiteColor,
                  indicatorDecoration: BoxDecoration(color: lightYellow, borderRadius: BorderRadius.all(Radius.circular(20))),
                  barDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                  tabs: [
                    SegmentTab(
                      label: 'Sale',
                      backgroundColor: Color.fromARGB(255, 193, 226, 195),
                      selectedTextColor: whiteColor,
                    ),
                    SegmentTab(
                      label: 'Support',
                      backgroundColor: Color.fromARGB(255, 193, 226, 195),
                    ),
                    SegmentTab(
                      label: 'Feedback',
                      backgroundColor: Color.fromARGB(255, 193, 226, 195),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(
                  child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  FeedbackScreen(),
                  FeedbackScreen(),
                  FeedbackScreen(),
                ],
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
