import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MyContractsTitleWidget extends StatelessWidget {
  const MyContractsTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KHeight(size: 0.01),
        CustomText(
          text: "Contract ID",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.021),
        CustomText(
          text: "Complex No",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.021),
        CustomText(
          text: "Unit N",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.021),
        CustomText(
          text: "Lead ID",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.021),
        CustomText(
          text: "Sub Division",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.019),
        CustomText(
          text: "Developer Name ",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.019),
        CustomText(
          text: "Rent Status ",
          fontSize: 14,
          color: greyColor,
        ),
      ],
    );
  }
}
