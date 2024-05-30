import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:flutter/material.dart';

class MyContractInitialButtons extends StatelessWidget {
  const MyContractInitialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerTextWidget(
          padding: 1,
          fontSize: 10,
          text: "Contract Generated",
          bgColor: yellowColor,
          textColor: whiteColor,
        ),
        ContainerTextWidget(
          padding: 1,
          text: "Active",
          fontSize: 10,
          bgColor: greenColor,
          textColor: whiteColor,
        )
      ],
    );
  }
}
