import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class OverDueTitleWidget extends StatelessWidget {
  const OverDueTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Invoice No",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.015),
        CustomText(
          text: "Issued Date",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.015),
        CustomText(
          text: "Due Date",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.015),
        CustomText(
          text: "Amount Pending",
          fontSize: 14,
          color: greyColor,
        ),
      ],
    );
  }
}
