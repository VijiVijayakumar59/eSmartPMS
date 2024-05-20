// import 'package:esmartpms/utils/color/colors.dart';
// import 'package:esmartpms/utils/size/constant_height.dart';
// import 'package:esmartpms/utils/text/custom_text.dart';
// import 'package:esmartpms/view/my_deals/screens/active_screen.dart';
// import 'package:esmartpms/view/my_deals/screens/closed_screen.dart';
// import 'package:esmartpms/view/my_deals/screens/expired_screen.dart';
// import 'package:esmartpms/view/my_deals/screens/reserved_screen.dart';
// import 'package:esmartpms/view/my_deals/screens/terminated_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

// class ManageDealsScreen extends StatelessWidget {
//   const ManageDealsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//               color: blackColor,
//             )),
//         backgroundColor: whiteColor,
//         elevation: 2,
//         automaticallyImplyLeading: false,
//         title: Center(
//           child: Image.asset(
//             "assets/images/PMSlogo.png",
//             fit: BoxFit.contain,
//             height: size.height * 0.064,
//             width: double.infinity,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: DefaultTabController(
//           length: 5,
//           child: Column(
//             children: [
//               const CustomText(
//                 text: "MANAGE DEALS",
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: themeColor,
//                 textDecoration: TextDecoration.underline,
//               ),
//               const KHeight(size: 0.02),
//               SizedBox(
//                 height: size.height * 0.05,
//                 child: const SegmentedTabControl(
//                   indicatorPadding: EdgeInsets.all(4),
//                   tabPadding: EdgeInsets.all(3),
//                   tabTextColor: Colors.black,
//                   selectedTabTextColor: whiteColor,
//                   indicatorDecoration: BoxDecoration(color: lightYellow, borderRadius: BorderRadius.all(Radius.circular(20))),
//                   barDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
//                   tabs: [
//                     SegmentTab(
//                       label: 'Reserved',
//                       backgroundColor: Color.fromARGB(255, 193, 226, 195),
//                       selectedTextColor: whiteColor,
//                     ),
//                     SegmentTab(
//                       label: 'Active',
//                       backgroundColor: Color.fromARGB(255, 193, 226, 195),
//                     ),
//                     SegmentTab(
//                       label: 'Expired',
//                       backgroundColor: Color.fromARGB(255, 193, 226, 195),
//                     ),
//                     SegmentTab(
//                       label: 'Terminated',
//                       backgroundColor: Color.fromARGB(255, 193, 226, 195),
//                     ),
//                     SegmentTab(
//                       label: 'Closed',
//                       backgroundColor: Color.fromARGB(255, 193, 226, 195),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: TabBarView(
//                   physics: BouncingScrollPhysics(),
//                   children: [
//                     ReservedDealsScreen(),
//                     ActiveDealsScreen(),
//                     ExpiredDealsScreen(),
//                     TerminatedDealsScreen(),
//                     ClosedDealsScreen(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
