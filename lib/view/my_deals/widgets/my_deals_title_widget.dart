import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MyDealsTitleWidget extends StatelessWidget {
  const MyDealsTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Tenant Name",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Deal ID",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Lead ID",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Complex",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Sub Division",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Unit No",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Contact No",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Duration",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.01),
      ],
    );
  }
}
