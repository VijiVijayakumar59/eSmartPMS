import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/my_deals/widgets/text_with_icon_widget.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const KHeight(size: 0.02),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
            ),
            height: size.height * 0.1,
            width: double.infinity,
            child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Subject",
                  color: Colors.grey,
                )),
          ),
        ),
        const KHeight(size: 0.02),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
            ),
            height: size.height * 0.26,
            width: double.infinity,
            child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Message",
                  color: Colors.grey,
                )),
          ),
        ),
        const KHeight(size: 0.06),
        TextWithIconWidget(
          text: "Submit ",
          bgColor: yellowColor,
          icon: Icons.arrow_forward_outlined,
          iconColor: whiteColor,
          iconSize: 18,
          textColor: whiteColor,
          fontSize: 16,
          width: 0.3,
          height: 0.046,
          onPressed: () {},
        )
      ],
    );
  }
}
