import 'dart:ui';
import 'package:esmartpms/controller/deals_controller/deals_controller.dart';
import 'package:esmartpms/controller/profile_controller/profile_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/custom_textform/textform_widget.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController changePswdController = TextEditingController();
  TextEditingController primaryContactController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  DealController dealController = DealController();
  @override
  void initState() {
    super.initState();
    //ProfileController().fetchUserProfile();
    fetchProfileDetails();
  }

  void fetchProfileDetails() async {
    try {
      final profileData = await ProfileController().fetchUserProfile();
      nameController.text = profileData.name;
      emailController.text = profileData.email;
      passwordController.text = profileData.password;
      primaryContactController.text = profileData.contact;
      permanentAddressController.text = profileData.address.trim();
      nationalIdController.text = profileData.nationalId;

      countryController.text = profileData.country;
    } catch (e) {
      debugPrint('Error fetching profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 2,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: blackColor,
              )),
          title: Image.asset(
            "assets/images/PMSlogo.png",
            fit: BoxFit.contain,
            height: size.height * 0.064,
            width: double.infinity,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            Image.asset(
              "assets/images/profile-background.jpg",
              height: size.height * 0.88,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(46, 117, 189, 0.63).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 28, right: 28),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          const CustomText(
                                            text: "PROFILE VIEW",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: whiteColor,
                                          ),
                                          const KHeight(size: 0.01),
                                          // const CircleAvatar(
                                          //   backgroundColor: whiteColor,
                                          //   radius: 40,
                                          //   child: Icon(
                                          //     Icons.person_2_outlined,
                                          //     size: 40,
                                          //     color: greyColor,
                                          //   ),
                                          // ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: nameController,
                                            hintText: "Name/Username",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: emailController,
                                            hintText: "Email",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: passwordController,
                                            hintText: "Password",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: changePswdController,
                                            hintText: "Change Password",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: primaryContactController,
                                            hintText: "Primary Contact",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: permanentAddressController,
                                            hintText: "Permanent Address",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: nationalIdController,
                                            hintText: "National ID (NID)",
                                          ),
                                          const KHeight(size: 0.01),
                                          CustomTextformWidget(
                                            textColor: whiteColor,
                                            borderColor: whiteColor,
                                            controller: countryController,
                                            hintText: "Country",
                                          ),
                                          const KHeight(size: 0.01),
                                          // ElevatedButton(
                                          //     style: const ButtonStyle(
                                          //       backgroundColor: MaterialStatePropertyAll(whiteColor),
                                          //     ),
                                          //     onPressed: () {
                                          //       dealController.fetchData();
                                          //     },
                                          //     child: const CustomText(
                                          //       text: "Submit",
                                          //       color: blackColor,
                                          //     ))
                                        ]))))))))
          ])
        ])));
  }
}
