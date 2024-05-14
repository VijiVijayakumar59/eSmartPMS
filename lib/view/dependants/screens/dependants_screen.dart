import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/custom_textform/textform_widget.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class DependantScreen extends StatelessWidget {
  const DependantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController relationController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController passportController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Color.fromARGB(255, 247, 232, 201),
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
                text: "DEPENDANTS",
                fontSize: 20,
                color: themeColor,
                fontWeight: FontWeight.w500,
              ),
              const KHeight(size: 0.01),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          height: size.height * 0.42,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 247, 216, 155),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                CustomTextformWidget(
                                  controller: nameController,
                                  hintText: "Name",
                                  textColor: greyColor,
                                  borderColor: const Color.fromARGB(255, 136, 136, 136),
                                ),
                                const KHeight(size: 0.005),
                                CustomTextformWidget(
                                  controller: relationController,
                                  hintText: "Relation",
                                  textColor: greyColor,
                                  borderColor: const Color.fromARGB(255, 136, 136, 136),
                                ),
                                const KHeight(size: 0.005),
                                CustomTextformWidget(
                                  controller: genderController,
                                  hintText: "Gender",
                                  textColor: greyColor,
                                  borderColor: const Color.fromARGB(255, 136, 136, 136),
                                ),
                                const KHeight(size: 0.005),
                                CustomTextformWidget(
                                  controller: contactController,
                                  hintText: "Contact No",
                                  textColor: greyColor,
                                  borderColor: const Color.fromARGB(255, 136, 136, 136),
                                ),
                                const KHeight(size: 0.005),
                                CustomTextformWidget(
                                  controller: dobController,
                                  hintText: "Date of Birth",
                                  textColor: greyColor,
                                  borderColor: const Color.fromARGB(255, 136, 136, 136),
                                ),
                                const KHeight(size: 0.005),
                                CustomTextformWidget(
                                  controller: passportController,
                                  hintText: "Passport No",
                                  textColor: greyColor,
                                  borderColor: const Color.fromARGB(255, 136, 136, 136),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          )),
        ),
      ),
    ));
  }
}
