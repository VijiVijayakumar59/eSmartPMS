// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/custom_textform/textform_widget.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
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

  DateTime selectedDate = DateTime.now();
  String dropdownValue = 'Complex :';

  var complex = [
    'Complex :',
    'Complex 1',
    'Complex 2',
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
        resizeToAvoidBottomInset: false,
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
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SizedBox(
              height: size.height * 0.9,
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
                  ),
                  const KHeight(size: 0.01),
                  CustomTextformWidget(
                    controller: descriptionController,
                    hintText: "Descriptions *",
                    borderColor: greyColor,
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
                              prefixIcon: const Icon(Icons.calendar_month),
                              labelText: "Date",
                              hintText: "Date",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: blackColor),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const KWidth(size: 0.02),
                      SizedBox(
                        width: size.width * 0.46,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: blackColor),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: complex.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
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
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: complex.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
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
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: complex.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const KHeight(size: 0.01),
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
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: complex.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
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
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: complex.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const KHeight(size: 0.01),
                  CustomTextformWidget(
                    controller: descriptionController,
                    hintText: "Solution Remark *",
                    borderColor: greyColor,
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
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(themeColor)),
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
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(greenColor)),
                    onPressed: () {},
                    child: const CustomText(text: "Submit"),
                  )
                ],
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
