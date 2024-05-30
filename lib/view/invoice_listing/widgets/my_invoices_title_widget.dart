import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MyInvoicesTitleWidget extends StatelessWidget {
  const MyInvoicesTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Invoice No",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Issue Date",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.02),
        CustomText(
          text: "Complex No",
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
          text: "Invoice Amount",
          fontSize: 14,
          color: greyColor,
        ),
      ],
    );
  }
}
