// ignore_for_file: unnecessary_null_comparison, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:esmartpms/controller/visitor_controller/add_visitor_controller.dart';
import 'package:esmartpms/model/visitor_model.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/custom_textform/textform_widget.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/size/constant_width.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddVisitorScreen extends StatefulWidget {
  const AddVisitorScreen({super.key});

  @override
  State<AddVisitorScreen> createState() => _AddVisitorScreenState();
}

class _AddVisitorScreenState extends State<AddVisitorScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController actionController = TextEditingController();
  TextEditingController resolvedController = TextEditingController();
  TextEditingController complaintDetailsController = TextEditingController();
  TextEditingController solutionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController inTimeController = TextEditingController();
  TextEditingController outTimeController = TextEditingController();
  TextEditingController visitorsDescriptionController = TextEditingController();
  TextEditingController visitorRemarksController = TextEditingController();
  TextEditingController passNoController = TextEditingController();
  TextEditingController visitorRequestController = TextEditingController();
  TextEditingController otherInfoController = TextEditingController();
  AddVisitorController addVisitorController = AddVisitorController();
  List<File> selectedVisPhotos = [];
  List<File> selectedIdPhotos = [];

  DateTime selectedDate = DateTime.now();
  String complexValue = 'Complex :';
  String unitValue = 'Unit :';
  String floorValue = 'Floor :';
  String visitorType = 'Visitor Type :';
  String closedValue = 'Closed : (Y/N)';
  String passReturnValue = "Pass Return(Y/N)";

  var complex = ['Complex :', 'Complex 1', 'Complex 2'];
  var unit = ['Unit :', 'Unit 370', 'Unit 375'];
  var floor = ['Floor :', 'Floor 97', 'Floor 34'];
  var visitor = ['Visitor Type :', 'guest', 'guest2'];
  var closed = ['Closed : (Y/N)', "Yes", "No"];
  var passReturn = ["Pass Return(Y/N)", "Yes", "No"];

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
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const CustomText(
                        text: "ADD VISITOR",
                        fontSize: 21,
                        color: themeColor,
                        fontWeight: FontWeight.bold,
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
                                  labelText: "Issued Date",
                                  hintText: "Issued Date",
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: blackColor),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select an issued date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const KWidth(size: 0.02),
                          SizedBox(
                            width: size.width * 0.46,
                            child: CustomTextformWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a mobile number';
                                }
                                return null;
                              },
                              controller: mobileController,
                              hintText: "Mobile *",
                              borderColor: greyColor,
                            ),
                          ),
                        ],
                      ),
                      CustomTextformWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: nameController,
                        hintText: "Name *",
                        borderColor: greyColor,
                      ),
                      const KHeight(size: 0.01),
                      CustomTextformWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                        controller: addressController,
                        hintText: "Address *",
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
                              value: complexValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: complex.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  complexValue = newValue!;
                                });
                              },
                            ),
                          ),
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
                              value: floorValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: floor.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  floorValue = newValue!;
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
                              value: unitValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: unit.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  unitValue = newValue!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.23,
                            child: CustomTextformWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter in-time';
                                }
                                return null;
                              },
                              controller: inTimeController,
                              hintText: "In-Time *",
                              borderColor: greyColor,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.23,
                            child: CustomTextformWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter out-time';
                                }
                                return null;
                              },
                              controller: outTimeController,
                              hintText: "Out-Time *",
                              borderColor: greyColor,
                            ),
                          ),
                        ],
                      ),
                      const KHeight(size: 0.01),
                      CustomTextformWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a visitors description';
                          }
                          return null;
                        },
                        controller: visitorsDescriptionController,
                        hintText: "Visitors Description *",
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
                              value: visitorType,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: visitor.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  visitorType = newValue!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.46,
                            child: CustomTextformWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter visitor remarks';
                                }
                                return null;
                              },
                              controller: visitorRemarksController,
                              hintText: "Visitor Remarks *",
                              borderColor: greyColor,
                            ),
                          ),
                        ],
                      ),
                      const KHeight(size: 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.46,
                            child: CustomTextformWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter pass no';
                                }
                                return null;
                              },
                              controller: passNoController,
                              hintText: "Pass No *",
                              borderColor: greyColor,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.46,
                            child: CustomTextformWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter visitor request';
                                }
                                return null;
                              },
                              controller: visitorRequestController,
                              hintText: "Visitor Request *",
                              borderColor: greyColor,
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
                                contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.02),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: blackColor),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              value: closedValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: closed.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  closedValue = newValue!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.45,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.02),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: blackColor),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              value: passReturnValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: passReturn.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  passReturnValue = newValue!;
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a date closed';
                            }
                            return null;
                          },
                        ),
                      ),
                      const KHeight(size: 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomText(text: "Photo"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(themeColor)),
                                child: const Text('Choose Image'),
                                onPressed: () {
                                  getImages(selectedVisPhotos);
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
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: "ID Photo",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(themeColor)),
                                child: const Text('Choose Image'),
                                onPressed: () {
                                  getImages(selectedIdPhotos);
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
                        ],
                      ),
                      const KHeight(size: 0.01),
                      TextFormField(
                        controller: otherInfoController,
                        decoration: const InputDecoration(
                          hintText: "Other Information *",
                        ),
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter other information';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                        ),
                        onPressed: () async {
                          final token = await SharedPrefController().getUserId();

                          if (formKey.currentState!.validate()) {
                            VisitorModel visitorModel = VisitorModel(
                                issueDate: dateController.text,
                                name: nameController.text,
                                mobile: mobileController.text,
                                address: addressController.text,
                                floorNo: floorValue,
                                unitNo: unitValue,
                                inTime: inTimeController.text,
                                outTime: outTimeController.text,
                                description: descriptionController.text,
                                type: visitorType,
                                remarks: visitorRemarksController.text,
                                request: visitorRequestController.text,
                                passNo: passNoController.text,
                                closed: closedValue,
                                complex: complexValue,
                                idPhoto: [],
                                visPhoto: [],
                                passReturn: passReturnValue,
                                otherInfo: otherInfoController.text,
                                owner: token!);
                            // Form is valid, proceed with further actions
                            await addVisitorController.addVisitor(visitorModel).then((value) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                  (route) => false);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Form submitted successfully')),
                              );
                            }).onError((e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            });
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

  Future<void> getImages(List<File> imageList) async {
    final pickedFiles = await picker.pickMultiImage(
      requestFullMetadata: true,
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );

    setState(() {
      if (pickedFiles != null) {
        imageList.clear();
        pickedFiles.forEach((pickedFile) {
          imageList.add(File(pickedFile.path));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No images selected')),
        );
      }
    });
  }
}
