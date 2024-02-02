import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:spennd/controllerandmodels/TransactionController.dart';
import 'package:spennd/home.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  TransactionController controller = Get.put(TransactionController());
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    navigatetoMain();
  }

  void navigatetoMain() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Get.offAll(
        () => controller.getStorage.hasData('isSeen')
            ? (controller.getStorage.read('isSeen') == 'notDone')
                ? explainScreen()
                : Home()
            : explainScreen(),
        transition: Transition.downToUp);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        color: Color.fromARGB(255, 11, 11, 11),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 180,
                height: 180,
                child: Lottie.asset('assets/images/wallet2.json',
                    repeat: false,
                    options:
                        LottieOptions(enableApplyingOpacityToLayers: false))),
            SizedBox(
              height: 30,
            ),
            Text(
              'Spennd',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  TextEditingController userNameController = TextEditingController();
  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: const Color.fromARGB(255, 13, 13, 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                      width: 180,
                      child: Lottie.asset('assets/images/person.json')),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'What Should We \nCall You?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: TextField(
                    controller: userNameController,
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    cursorColor: Colors.greenAccent,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.white, width: 3)),
                        prefixIcon: Icon(
                          Icons.info_sharp,
                          color: Colors.grey,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.white, width: 3)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                  child: GestureDetector(
                    onTap: () {
                      if (userNameController.text == '') {
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Come On !',
                            message: 'Please Enter Your name..',

                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.failure,
                          ),
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      } else {
                        controller.getStorage
                            .write('user', userNameController.text);
                        Get.offAll(() => Home());
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: 60,
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class explainScreen extends StatefulWidget {
  explainScreen({super.key});

  @override
  State<explainScreen> createState() => _explainScreenState();
}

class _explainScreenState extends State<explainScreen> {
  List Lottieanims = [
    'assets/images/page1one.json',
    'assets/images/atm.json',
    'assets/images/bargraph.json',
    'assets/images/stable.json',
  ];

  List Headlines = [
    'Welcome To',
    'All your Finances in',
    'Track Your',
    'Be Financially'
  ];

  List ColoredLines = ['Spennd', 'One Place', 'Expenses', 'Stable'];

  List Taglines = [
    'Plan Your Finances with Us ',
    'Get the Big Picture of all your Transactions',
    'Get Statistics and know what you spend on.',
    'Lead a prosperous Life by just planning your finances Well.'
  ];

  int explainIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  (explainIndex > 1) ? explainIndex-- : explainIndex = 0;
                });
              },
              color: const Color.fromARGB(255, 46, 46, 46),
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.grey,
                size: 26,
              )),
        ),
        backgroundColor: Color.fromARGB(255, 16, 16, 16),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '${Headlines[explainIndex]}\n',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: '${ColoredLines[explainIndex]}',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w600))
                        ],
                      )),
                ),
                Lottie.asset('${Lottieanims[explainIndex]}'),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 60,
                    child: Text(
                      '${Taglines[explainIndex]}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 100, right: 100, top: 30, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: (explainIndex == 0) ? 40 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: (explainIndex == 0)
                                ? Colors.blue
                                : Color.fromARGB(255, 68, 68, 68),
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: (explainIndex == 1) ? 40 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: (explainIndex == 1)
                                ? Colors.blue
                                : Color.fromARGB(255, 68, 68, 68),
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: (explainIndex == 2) ? 40 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: (explainIndex == 2)
                                ? Colors.blue
                                : Color.fromARGB(255, 68, 68, 68),
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: (explainIndex == 3) ? 40 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: (explainIndex == 3)
                                ? Colors.blue
                                : Color.fromARGB(255, 68, 68, 68),
                            borderRadius: BorderRadius.circular(40)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        (explainIndex <= 2)
                            ? explainIndex++
                            : (
                                controller.getStorage.write('isSeen', 'Done'),
                                Get.offAll(OnBoarding()),
                                transition: Transition.rightToLeft
                              );
                        Transition.leftToRight;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.maxFinite,
                      child: explainIndex == 3
                          ? Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          : Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
