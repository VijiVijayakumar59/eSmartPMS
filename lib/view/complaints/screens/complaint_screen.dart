import 'package:esmartpms/controller/complaint_controller/complaint_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/add_complaints/screens/add_complaints_screen.dart';
import 'package:esmartpms/view/complaints/widgets/complaint_title_widget.dart';
import 'package:flutter/material.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  ComplaintController complaintController = ComplaintController();
  Map<String, dynamic> _data = {};

  @override
  void initState() {
    super.initState();
    complaintController.fetchComplaints().then((data) {
      setState(() {
        data['data'].sort((a, b) => _parseDate(b['c_date']).compareTo(_parseDate(a['c_date'])));
        _data = data;
      });
    }).catchError((error) {
      print('Error fetching data: $error');
      // Handle error
    });
  }

  DateTime _parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      print('Error parsing date: $e');
      // Return a default date if parsing fails
      return DateTime(1970, 1, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(
                  text: "COMPLAINTS",
                  fontSize: 21,
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                ),
                const KHeight(size: 0.01),
                _data.isEmpty
                    ? const Center(child: CustomText(text: "No Data Available"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _data['data'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Color containerColor = index % 2 == 0 ? secondaryColor : lightGreen;
                          var complaint = _data['data'][index];
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: size.height * 0.27,
                                decoration: BoxDecoration(
                                  color: containerColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(children: <Widget>[
                                            Positioned.fill(
                                              child: Container(
                                                // color: greenColor,
                                                decoration: const BoxDecoration(
                                                  color: greenColor,
                                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Icon(
                                                  Icons.visibility,
                                                  color: whiteColor,
                                                  size: 19,
                                                ))
                                          ])),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(children: <Widget>[
                                            Positioned.fill(
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: themeColor,
                                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Icon(
                                                Icons.delete_outline_rounded,
                                                color: whiteColor,
                                                size: 19,
                                              ),
                                            )
                                          ]))
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8,
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          const ComplaintTitleWidget(),
                                          const KWidth(size: 0.04),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                text: ": ${complaint['complaint_code']}",
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.012),
                                              const CustomText(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                text: ": N/A",
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.012),
                                              CustomText(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                text: ": ${complaint['c_date']}",
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.012),
                                              CustomText(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                text: ": ${complaint['c_title']}",
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.012),
                                              CustomText(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                text: ": ${complaint['c_description']}",
                                                color: greyColor,
                                              ),
                                              const KHeight(size: 0.012),
                                              CustomText(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                text: ": ${complaint['status']}",
                                                color: Colors.red,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddComplaintScreen(),
            ));
          },
        ),
      ),
    );
  }
}
