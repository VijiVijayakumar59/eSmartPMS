import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class ComplaintTitleWidget extends StatelessWidget {
  const ComplaintTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Complaint Code",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.016),
        CustomText(
          text: "Entity",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.016),
        CustomText(
          text: "Date",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.016),
        CustomText(
          text: "Title",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.016),
        CustomText(
          text: "Descriptions",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.016),
        CustomText(
          text: "Actions",
          fontSize: 14,
          color: greyColor,
        ),
      ],
    );
  }
}
