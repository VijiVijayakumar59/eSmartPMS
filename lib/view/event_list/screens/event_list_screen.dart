import 'package:esmartpms/controller/events/event_list_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/event_list/widgets/event_list_itle_widget.dart';
import 'package:flutter/material.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  final EventListController eventListController = EventListController();
  List<dynamic> _events = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchAndSortData();
  }

  Future<void> _fetchAndSortData() async {
    try {
      final data = await eventListController.fetchData();
      setState(() {
        _events = data['data'];
        _events.sort((a, b) => _parseDate(b['s_date']).compareTo(_parseDate(a['s_date'])));
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  DateTime _parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      print('Error parsing date: $e');
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
            ),
          ),
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
          child: _isLoading ? const CircularProgressIndicator() : _buildEventList(),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const CustomText(
        text: "EVENT LIST",
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: themeColor,
      ),
      const KHeight(size: 0.01),
      _events.isEmpty
          ? const Center(child: CustomText(text: "No Data Available"))
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _events.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var event = _events[index];
                return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                            width: double.infinity,
                            height: size.height * 0.12,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  const EventListTitleWidget(),
                                  const KWidth(size: 0.04),
                                  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    CustomText(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      text: ": ${event['title']}",
                                      color: greyColor,
                                    ),
                                    const KHeight(size: 0.007),
                                    CustomText(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      text: ": ${event['venue']}",
                                      color: greyColor,
                                    ),
                                    const KHeight(size: 0.007),
                                    CustomText(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      text: ": ${event['status']}",
                                      color: yellowColor,
                                    )
                                  ])
                                ])))));
              })
    ]));
  }
}
