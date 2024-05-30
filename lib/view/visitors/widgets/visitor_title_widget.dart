import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class VisitorsTitleWidget extends StatelessWidget {
  const VisitorsTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Unit No :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Issue Date :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Name :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Mobile No :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Address :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Floor No :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "In-Time :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Out-Time :",
          fontSize: 13,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Closed :",
          fontSize: 13,
          color: greyColor,
        ),
      ],
    );
  }
}
