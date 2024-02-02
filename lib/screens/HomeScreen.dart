import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spennd/controllerandmodels/TransactionController.dart';
import 'package:spennd/home.dart';
import 'package:spennd/screens/TransactionScreen.dart';
import 'package:spennd/screens/incomeScreen.dart';
import 'package:spennd/screens/transactionDetails.dart';
import 'package:spennd/screens/withdrawScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<TransactionController>(
              builder: (controller) {
                return CardContainer();
              },
            ),
            withdrawincomeRow(),
            TransactionHeading(),
            GetBuilder<TransactionController>(
              builder: (controller) {
                return (controller.TransactionList.isEmpty)
                    ? Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: double.maxFinite,
                        child: Text(
                          'No Transactions to Show',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 83, 83, 83),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ))
                    : TransactionBuilder();
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding TransactionBuilder() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ListView.builder(
        itemCount: (controller.TransactionList.length > 4)
            ? 5
            : controller.TransactionList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        controller.TransactionList[index].Tname[0]
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: 48,
                            color: controller.TransactionList[index].isIncome
                                ? Colors.greenAccent
                                : Colors.redAccent),
                      ),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 45, 45, 45)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.TransactionList[index].Tamount.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: controller.TransactionList[index].isIncome
                                  ? Colors.greenAccent
                                  : Colors.redAccent),
                        ),
                        Container(
                          width: 130,
                          child: Text(
                            controller.TransactionList[index].TNote,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 98, 98, 98)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(
                            () => Details(
                                data: controller.TransactionList[index],
                                ind: index),
                            transition: Transition.rightToLeft);
                      },
                      icon: Icon(CupertinoIcons.info_circle_fill))
                ],
              ),
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  borderRadius: BorderRadius.circular(50)),
            ),
          );
        },
      ),
    );
  }

  Padding TransactionHeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transactions',
            style: TextStyle(
                color: const Color.fromARGB(255, 225, 225, 225),
                fontSize: 26,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 20),
            child: GestureDetector(
              onTap: () {
                (controller.TransactionList.length > 4)
                    ? Get.to(() => TransactionScreen(),
                        transition: Transition.rightToLeft)
                    : null;
              },
              child: Container(
                height: 40,
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: (controller.TransactionList.length > 4)
                              ? Colors.greenAccent
                              : const Color.fromARGB(255, 66, 66, 66),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('See All',
                        style: TextStyle(
                            color: (controller.TransactionList.length > 4)
                                ? Colors.greenAccent
                                : const Color.fromARGB(255, 66, 66, 66),
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar AppBarMain() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      leading: Icon(
        CupertinoIcons.person_circle_fill,
        size: 30,
        color: Colors.grey,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 51, 51, 51),
              icon: Icon(
                CupertinoIcons.settings_solid,
                size: 26,
                color: Colors.grey,
              )),
        )
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            controller.GreetControl(controller.Time),
            style: TextStyle(
                color: const Color.fromARGB(255, 92, 92, 92),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
          GetBuilder<TransactionController>(
            builder: (controller) {
              return Text(
                controller.getStorage.hasData('user')
                    ? controller.getStorage.read('user')
                    : '',
                style: TextStyle(
                    color: const Color.fromARGB(255, 198, 198, 198),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              );
            },
          )
        ],
      ),
    );
  }

  Padding withdrawincomeRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => WithdrawScreen(),
                  transition: Transition.rightToLeftWithFade);
            },
            child: Container(
              width: 150,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 50),
                    child: Icon(
                      CupertinoIcons.arrow_down_left_circle_fill,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Withdraw',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 30, 42),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => IncomeScreen(),
                  transition: Transition.rightToLeftWithFade);
            },
            child: Container(
              width: 150,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 50),
                    child: Icon(
                      CupertinoIcons.arrow_up_right_circle_fill,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Income',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 190, 183, 237),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding CardContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Container(
        height: 220,
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 29, 29, 29),
                  const Color.fromARGB(255, 60, 60, 60)
                ]),
            // image: DecorationImage(
            //     image: AssetImage('assets/images/cardBackground.jpg'),
            //     fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Spennd',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3),
                  ),
                  Image.asset(
                    'assets/images/chip.png',
                    width: 40,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'Balance',
                style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 170, 217, 255)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 0),
              child: Row(
                children: [
                  Icon(
                    Icons.currency_rupee_rounded,
                    size: 30,
                    color: (controller.balance >= 0)
                        ? Colors.greenAccent
                        : Colors.redAccent,
                  ),
                  Text(
                    controller.balance.toString(),
                    style: TextStyle(
                        color: (controller.balance >= 0)
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.day.toString() +
                          '/' +
                          controller.month.toString() +
                          '/' +
                          controller.year.toString(),
                      style: TextStyle(
                          fontFamily: 'SourceCodePro',
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      '*******',
                      style: TextStyle(
                          fontFamily: 'SourceCodePro',
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
