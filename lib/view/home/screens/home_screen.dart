import 'package:esmartpms/controller/auth_controller/auth_controller.dart';
import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/view/login/screens/login_screen.dart';
import 'package:esmartpms/view/menu/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // final bool isDeveloper;
  const HomeScreen({
    super.key,
    // required this.isDeveloper,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  // int selectedIndex = 0;
  // static const List<Widget> widgetOptions = <Widget>[
  //   MenuScreen(),
  //   Text('Live helper', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Live Helper', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  // void onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final isDeveloper = widgetOptions[0] is MenuScreen && (widgetOptions[0] as MenuScreen).isDeveloper;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/PMSlogo.png",
          fit: BoxFit.contain,
          height: size.height * 0.064,
          width: double.infinity,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await authService.logout().then((value) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          });
                        },
                        child: const Text("Yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("No"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout,
              color: blackColor,
            ),
          ),
        ],
      ),
      body: const MenuScreen(
          // isDeveloper: widget.isDeveloper,
          ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.calculate_outlined),
      //       label: "Home",
      //       backgroundColor: themeColor,
      //     ),
      //     if (isDeveloper)
      //       const BottomNavigationBarItem(
      //         icon: Icon(Icons.app_settings_alt_outlined),
      //         label: "Home",
      //         backgroundColor: themeColor,
      //       ),
      //     if (isDeveloper)
      //       const BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications_none_rounded),
      //         label: "home",
      //         backgroundColor: themeColor,
      //       ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.language),
      //       label: "Live Helper",
      //       backgroundColor: themeColor,
      //     ),
      //   ],
      //   type: BottomNavigationBarType.shifting,
      //   currentIndex: selectedIndex,
      //   selectedItemColor: whiteColor,
      //   iconSize: 30,
      //   onTap: onItemTapped,
      //   elevation: 5,
      // ),
    );
  }
}
