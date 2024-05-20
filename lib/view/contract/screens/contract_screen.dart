// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:esmartpms/controller/contract_controller/contract_details_controller.dart';
import 'package:esmartpms/model/contract_model.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/view/contract_details/widgets/key_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/text/custom_text.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  _ContractScreenState createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  ContractDetailsController contractDetailsController = ContractDetailsController();
  List<ContractModel> _data = [];
  @override
  void initState() {
    super.initState();
    contractDetailsController.fetchDetails().then((data) {
      setState(() {
        _data = data;
        // print(_data);
      });
    }).catchError((error) {
      print('Error fetching data: $error');
      // Handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: blackColor,
            )),
        backgroundColor: whiteColor,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            "assets/images/PMSlogo.png",
            fit: BoxFit.contain,
            height: size.height * 0.064,
            width: double.infinity,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const CustomText(
                  text: "CONTRACT",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
                const KHeight(size: 0.01),
                const CustomText(
                  text: "Mr. Lost and Found Office",
                  fontSize: 24,
                ),
                const KHeight(size: 0.01),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contractData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: ExpansionTile(
                            visualDensity: VisualDensity.comfortable,
                            collapsedBackgroundColor: lightGreen,
                            backgroundColor: const Color.fromARGB(255, 253, 230, 194),
                            textColor: themeColor,
                            iconColor: themeColor,
                            title: CustomText(
                              text: contractData[index].title,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              const Divider(thickness: 2),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: contractData[index]
                                      .data
                                      .entries
                                      .map((entry) => KeyValueWidget(
                                            head: entry.key,
                                            value: ': ${entry.value}',
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ContractScreen extends StatefulWidget {
//   const ContractScreen({super.key});

//   @override
//   _ContractScreenState createState() => _ContractScreenState();
// }

// class _ContractScreenState extends State<ContractScreen> {
//   ContractDetailsController contractDetailsController = ContractDetailsController();
//   List<ContractModel> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     contractDetailsController.fetchDetails().then((data) {
//       setState(() {
//         _data = data;
//       });
//     }).catchError((error) {
//       print('Error fetching data: $error');
//     });
//   }

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
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const HomeScreen(),
//                   ),
//                   (route) => false);
//             },
//             icon: const Icon(
//               Icons.home,
//               color: greyColor,
//               size: 26,
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 const CustomText(
//                   text: "CONTRACT",
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: themeColor,
//                   textDecoration: TextDecoration.underline,
//                 ),
//                 const SizedBox(height: 10),
//                 ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: _data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         elevation: 6,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: ExpansionTile(
//                             visualDensity: VisualDensity.comfortable,
//                             collapsedBackgroundColor: lightGreen,
//                             backgroundColor: const Color.fromARGB(255, 253, 230, 194),
//                             textColor: themeColor,
//                             iconColor: themeColor,
//                             title: CustomText(
//                               text: _data[index].title,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             children: [
//                               const Divider(thickness: 2),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: _data[index]
//                                       .data
//                                       .entries
//                                       .map((entry) => KeyValueWidget(
//                                             head: entry.key,
//                                             value: ': ${entry.value}',
//                                           ))
//                                       .toList(),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
