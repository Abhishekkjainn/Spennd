import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:spennd/controllerandmodels/TransactionController.dart';
import 'package:spennd/screens/HomeScreen.dart';
import 'package:spennd/screens/InsightsScreen.dart';
import 'package:spennd/screens/TransactionScreen.dart';
import 'package:spennd/screens/profileScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List Screens = [
  HomeScreen(),
  InsightsScreen(),
  TransactionScreen(),
  ProfileScreen()
];

int mainIndex = 0;
TransactionController controller = Get.put(TransactionController());

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 14, 14, 14),
        body: Screens[mainIndex],
        bottomNavigationBar: BottomBar());
  }

  Padding BottomBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(),
            child: GNav(
                tabBorderRadius: 40,
                tabActiveBorder: Border.all(color: Colors.blue, width: 3),
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 500),
                gap: 6,
                color: Colors.grey[500],
                activeColor: Colors.blue,
                iconSize: 26,
                tabBackgroundColor: Colors.blue.withOpacity(0.2),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                onTabChange: (value) {
                  setState(() {
                    mainIndex = value;
                  });
                },
                tabs: [
                  GButton(
                    icon: Icons.home_rounded,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.graph_circle,
                    text: 'Insights',
                  ),
                  GButton(
                    icon: Icons.history,
                    text: 'Transactions',
                  ),
                  GButton(
                    icon: CupertinoIcons.person_circle_fill,
                    text: 'Profile',
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
