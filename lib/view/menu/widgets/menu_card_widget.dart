import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/helper/helper.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/complaints/screens/complaint_screen.dart';
import 'package:esmartpms/view/contact_admin/screens/contact_admin_screen.dart';
import 'package:esmartpms/view/dependants/screens/dependants_screen.dart';
import 'package:esmartpms/view/event_list/screens/event_list_screen.dart';
import 'package:esmartpms/view/my_deals/screens/my_deals_screen.dart';
import 'package:esmartpms/view/notification/screens/notification_screen.dart';
import 'package:esmartpms/view/over_due_invoice.sdart/screens/over_due_invoice_screen.dart';
import 'package:esmartpms/view/parking_code/screens/parking_code_screen.dart';
import 'package:esmartpms/view/profile/screens/profile_screen.dart';
import 'package:esmartpms/view/visitors/screens/visitor_screen.dart';
import 'package:flutter/material.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({required this.choice, super.key});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        navigateToScreen(context, choice);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: primaryColor,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: size.height * 0.15,
          width: size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      choice.icon,
                      size: 36.0,
                      color: greyColor,
                    ),
                  ),
                  CustomText(
                    text: choice.title,
                    textAlign: TextAlign.center,
                    color: greyColor,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, Choice choice) {
    switch (choice.title) {
      case 'My Deals':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReservedDealsScreen()),
        );
        break;
      case 'Contact Admin':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactAdminScreen()),
        );
        break;

      case 'Over Due Invoices':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OverDueInvoiceScreen()),
        );
        break;
      // case 'Messages':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const MessageScreen()),
      //   );
      //   break;
      case 'Complaints':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ComplaintScreen()),
        );
        break;
      case 'Visitors':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VistorScreen()),
        );
        break;
      case 'Events':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventListScreen()),
        );
        break;
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
      case 'Notification':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
        break;
      case 'My Dependants':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DependantScreen()),
        );
        break;
      case 'Parking Code':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ParkingCodeScreen()),
        );
        break;
      default:
        break;
    }
  }
}
