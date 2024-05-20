import 'package:esmartpms/controller/shared_preference_controller.dart';
import 'package:esmartpms/view/home/screens/home_screen.dart';
import 'package:esmartpms/view/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? loggedIn;
  bool? isDeveloper;
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final result = await SharedPrefController().isLoggedIn();
    final isDev = await SharedPrefController().getUserId();
    setState(() {
      isDeveloper = isDev == '440' ? true : false;
      loggedIn = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: loggedIn == true
          ? const HomeScreen(
              // isDeveloper: isDeveloper!,
              )
          : const LoginScreen(),
    );
  }
}
