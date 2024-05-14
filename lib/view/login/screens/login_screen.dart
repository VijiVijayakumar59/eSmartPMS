// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:developer';

import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:flutter/material.dart';
import 'package:esmartpms/controller/auth_controller/auth_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';

final loginKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SharedPrefController sharedPrefController = SharedPrefController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: loginKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const KHeight(size: 0.1),
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      elevation: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        height: size.height * 0.14,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            "assets/images/PMSlogo.png",
                            fit: BoxFit.contain,
                            height: size.height * 0.064,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const KHeight(size: 0.06),
                  const CustomText(
                    text: "Username *",
                    color: themeColor,
                  ),
                  const KHeight(size: 0.01),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return "Enter Valid Email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: themeColor,
                      ),
                      hintText: "Username",
                    ),
                  ),
                  const KHeight(size: 0.02),
                  const CustomText(
                    text: "Password *",
                    color: themeColor,
                  ),
                  const KHeight(size: 0.01),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: themeColor,
                      ),
                      hintText: "Password",
                    ),
                  ),
                  const KHeight(size: 0.02),
                  const CustomText(
                    text: "Property Code *",
                    color: themeColor,
                  ),
                  const KHeight(size: 0.01),
                  TextFormField(
                    controller: codeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter property code';
                      }
                      return null;
                    },
                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: "Property Code",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  const KHeight(size: 0.05),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.5,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(themeColor),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (loginKey.currentState!.validate()) {
                            Map<String, dynamic> loginResult = await authService.login(
                              emailController.text,
                              passwordController.text,
                              codeController.text,
                            );
                            if (loginResult['status'] == 'success') {
                              log('Login successful');
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const HomeScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login failed. Please try again.'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.person),
                              SizedBox(width: size.width * 0.02),
                              const CustomText(text: "Login"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
