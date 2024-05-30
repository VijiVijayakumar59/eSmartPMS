import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/view/deal_view/screens/deals_view_screen.dart';
import 'package:esmartpms/view/my_contracts/screens/manage_contracts_screen.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/my_deals/widgets/text_with_icon_widget.dart';
import 'package:flutter/material.dart';

class MyDealsButtonWidget extends StatelessWidget {
  const MyDealsButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextWithIconWidget(
          bgColor: yellowColor,
          height: 0.039,
          width: 0.29,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const DealsViewScreen(),
            ));
          },
          fontSize: 16,
          text: "View ",
          icon: Icons.visibility_outlined,
          iconSize: 16,
          iconColor: whiteColor,
          textColor: whiteColor,
        ),
        ContainerTextWidget(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ManageContractScreen(),
            ));
          },
          padding: 4,
          text: "View Contract",
          fontSize: 16,
          bgColor: yellowColor,
          textColor: whiteColor,
        ),
      ],
    );
  }
}
