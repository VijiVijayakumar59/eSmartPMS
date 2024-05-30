import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/view/contract/screens/contract_screen.dart';
import 'package:esmartpms/view/invoice_listing/screens/invoice_listing_screen.dart';
import 'package:esmartpms/view/my_contracts/widgets/container_text_widget.dart';
import 'package:esmartpms/view/receipt_listing/screens/receipt_listing_screen.dart';
import 'package:flutter/material.dart';

class MyContractButtonWidget extends StatelessWidget {
  const MyContractButtonWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              )),
          width: size.width * 0.20,
          height: size.height * 0.04,
          child: Center(
            child: ContainerTextWidget(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ContractScreen(),
                ));
              },
              padding: 4,
              text: "View",
              fontSize: 16,
              bgColor: themeColor,
              textColor: whiteColor,
            ),
          ),
        ),
        ContainerTextWidget(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const InvoiceListingScreen(),
            ));
          },
          padding: 4,
          text: "Invoices",
          fontSize: 16,
          bgColor: themeColor,
          textColor: whiteColor,
        ),
        ContainerTextWidget(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ReceiptListingScreen(),
            ));
          },
          padding: 4,
          text: "Receipts",
          fontSize: 16,
          bgColor: themeColor,
          textColor: whiteColor,
        ),
      ],
    );
  }
}
