import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class ReceiptListingTitleWidget extends StatelessWidget {
  const ReceiptListingTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Receipt No",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Receipt Date",
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
          text: "Unit",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Payment Method",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Amount",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
      ],
    );
  }
}
