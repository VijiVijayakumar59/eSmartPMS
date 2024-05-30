import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class EventListTitleWidget extends StatelessWidget {
  const EventListTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Title",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Venue",
          fontSize: 14,
          color: greyColor,
        ),
        KHeight(size: 0.01),
        CustomText(
          text: "Status",
          fontSize: 14,
          color: greyColor,
        ),
      ],
    );
  }
}
