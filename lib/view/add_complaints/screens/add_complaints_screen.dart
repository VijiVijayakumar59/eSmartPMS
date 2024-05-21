// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:esmartpms/controller/complaint_controller/add_complaint_controller.dart';
import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/custom_textform/textform_widget.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddComplaintScreen extends StatefulWidget {
  const AddComplaintScreen({super.key});

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController actionController = TextEditingController();
  TextEditingController resolvedController = TextEditingController();
  TextEditingController complaintDetailsController = TextEditingController();
  TextEditingController solutionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  AddComplaintController addComplaintController = AddComplaintController();

  DateTime selectedDate = DateTime.now();
  String assignedValue = 'Assigned To :';
  String statusValue = 'Status :';
  String floorValue = 'Floor :';

  var assigned = [
    'Assigned To :',
    'assign1',
    'assign2',
  ];

  var status = [
    'Status :',
    'Closed',
    'Open',
  ];

  var floor = [
    'Floor :',
    'Floor 97',
    'Floor 34',
  ];

  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(211, 227, 251, 0.902),
        resizeToAvoidBottomInset: false,
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              },
              icon: const Icon(
                Icons.home,
                color: greyColor,
                size: 26,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SizedBox(
              height: size.height * 0.9,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomText(
                      text: "ADD COMPLAINTS",
                      fontSize: 21,
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const KHeight(size: 0.01),
                    CustomTextformWidget(
                      controller: titleController,
                      hintText: "Title *",
                      borderColor: greyColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const KHeight(size: 0.01),
                    CustomTextformWidget(
                      controller: descriptionController,
                      hintText: "Descriptions *",
                      borderColor: greyColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const KHeight(size: 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              selectDate(context);
                            },
                            child: TextFormField(
                              controller: dateController,
                              decoration: InputDecoration(
                                fillColor: whiteColor,
                                contentPadding: const EdgeInsets.all(8),
                                prefixIcon: GestureDetector(
                                  onTap: () {
                                    selectDate(context);
                                  },
                                  child: const Icon(Icons.calendar_month),
                                ),
                                labelText: "Date",
                                hintText: "Date",
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: blackColor),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a date';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const KWidth(size: 0.02),
                        // SizedBox(
                        //   width: size.width * 0.46,
                        //   child: DropdownButtonFormField(
                        //     decoration: InputDecoration(
                        //       contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
                        //       border: OutlineInputBorder(
                        //         borderSide: const BorderSide(color: blackColor),
                        //         borderRadius: BorderRadius.circular(14),
                        //       ),
                        //     ),
                        //     value: complexValue,
                        //     icon: const Icon(Icons.keyboard_arrow_down),
                        //     items: complex.map((String item) {
                        //       return DropdownMenuItem(
                        //         value: item,
                        //         child: Text(item),
                        //       );
                        //     }).toList(),
                        //     onChanged: (String? newValue) {
                        //       setState(() {
                        //         complexValue = newValue!;
                        //       });
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                    const KHeight(size: 0.02),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //       width: size.width * 0.45,
                    //       child: DropdownButtonFormField(
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
                    //           border: OutlineInputBorder(
                    //             borderSide: const BorderSide(color: blackColor),
                    //             borderRadius: BorderRadius.circular(14),
                    //           ),
                    //         ),
                    //         value: unitValue,
                    //         icon: const Icon(Icons.keyboard_arrow_down),
                    //         items: unit.map((String item) {
                    //           return DropdownMenuItem(
                    //             value: item,
                    //             child: Text(item),
                    //           );
                    //         }).toList(),
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             unitValue = newValue!;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     const KWidth(size: 0.02),
                    //     SizedBox(
                    //       width: size.width * 0.45,
                    //       child: DropdownButtonFormField(
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
                    //           border: OutlineInputBorder(
                    //             borderSide: const BorderSide(color: blackColor),
                    //             borderRadius: BorderRadius.circular(14),
                    //           ),
                    //         ),
                    //         value: floorValue,
                    //         icon: const Icon(Icons.keyboard_arrow_down),
                    //         items: floor.map((String item) {
                    //           return DropdownMenuItem(
                    //             value: item,
                    //             child: Text(item),
                    //           );
                    //         }).toList(),
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             floorValue = newValue!;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const KHeight(size: 0.01),
                    CustomTextformWidget(
                      controller: descriptionController,
                      hintText: "Action Taken *",
                      borderColor: greyColor,
                    ),
                    const KHeight(size: 0.01),
                    CustomTextformWidget(
                      controller: descriptionController,
                      hintText: "Resolved (Y/N) *",
                      borderColor: greyColor,
                    ),
                    const KHeight(size: 0.02),
                    CustomTextformWidget(
                      controller: descriptionController,
                      hintText: "Solution Remark *",
                      borderColor: greyColor,
                    ),
                    const KHeight(size: 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: blackColor),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            value: assignedValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: assigned.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                assignedValue = newValue!;
                              });
                            },
                          ),
                        ),
                        // const KWidth(size: 0.02),
                        SizedBox(
                          width: size.width * 0.45,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: blackColor),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            value: statusValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: status.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                statusValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const KHeight(size: 0.02),

                    GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          fillColor: whiteColor,
                          contentPadding: const EdgeInsets.all(8),
                          prefixIcon: const Icon(Icons.calendar_month),
                          labelText: "Date Closed",
                          hintText: "Date Closed",
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: blackColor),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    const KHeight(size: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(themeColor)),
                          child: const Text('Choose Image'),
                          onPressed: () {
                            getImages();
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.4,
                          child: selectedImages.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: selectedImages.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Image.file(selectedImages[index]),
                                    );
                                  },
                                )
                              : const Center(child: CustomText(text: "No File Chosen")),
                        ),
                      ],
                    ),
                    const KHeight(size: 0.01),
                    ElevatedButton(
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(greenColor)),
                      onPressed: () async {
                        final token = await SharedPrefController().getUserId();
                        if (formKey.currentState!.validate()) {
                          // ComplaintModel model = ComplaintModel(
                          //   leadId: "$token",
                          //   title: titleController.text,
                          //   description: descriptionController.text,
                          //   date: dateController.text,
                          //   ownerId: token!,
                          //   complex: complexValue,
                          //   unit: unitValue,
                          //   floor: floorValue,
                          //   images: "",
                          // );

                          try {
                            // await addComplaintController.addComplaint(model);
                            await addComplaintController.addComplaint(
                              titleController.text,
                              descriptionController.text,
                              dateController.text,
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Form submitted successfully')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: ${e.toString()}')),
                            );
                          }
                        }
                      },
                      child: const CustomText(text: "Submit"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Future<void> getImages() async {
    final pickedFiles = await picker.pickMultiImage(
      requestFullMetadata: true,
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );

    setState(() {
      if (pickedFiles != null) {
        selectedImages.clear();
        for (var pickedFile in pickedFiles) {
          selectedImages.add(File(pickedFile.path));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No images selected')),
        );
      }
    });
  }
}
