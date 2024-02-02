import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spennd/controllerandmodels/TransactionController.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: const Color.fromARGB(255, 17, 17, 17),
          title: Text(
            'Transaction History',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.TransactionList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee_rounded,
                                      size: 26,
                                      color: controller
                                              .TransactionList[index].isIncome
                                          ? Colors.greenAccent
                                          : Colors.redAccent,
                                    ),
                                    Text(
                                      controller.TransactionList[index].Tamount
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                          color: controller
                                                  .TransactionList[index]
                                                  .isIncome
                                              ? Colors.greenAccent
                                              : Colors.redAccent),
                                    )
                                  ],
                                ),
                                Text(
                                  controller.TransactionList[index].Tdate,
                                  style: TextStyle(
                                      color: controller
                                              .TransactionList[index].isIncome
                                          ? Colors.greenAccent.withOpacity(0.5)
                                          : Colors.redAccent.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 20, left: 20, bottom: 10),
                            child: Container(
                              child: Text(
                                'Name : ${controller.TransactionList[index].Tname}',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: controller
                                            .TransactionList[index].isIncome
                                        ? Colors.greenAccent.withOpacity(0.7)
                                        : Colors.redAccent.withOpacity(0.7)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Text(
                              'Note : ${controller.TransactionList[index].TNote}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      controller.TransactionList[index].isIncome
                                          ? Colors.greenAccent.withOpacity(0.5)
                                          : Colors.redAccent.withOpacity(0.5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Time - ${controller.TransactionList[index].Ttime}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: controller
                                              .TransactionList[index].isIncome
                                          ? Colors.greenAccent.withOpacity(0.5)
                                          : Colors.redAccent.withOpacity(0.5)),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        controller.removeTransaction(index);
                                      });
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                      controller.TransactionList[index].isIncome
                                          ? Colors.greenAccent.withOpacity(0.2)
                                          : Colors.redAccent.withOpacity(0.2),
                                    )),
                                    icon: Icon(
                                      CupertinoIcons.delete_solid,
                                      color: controller
                                              .TransactionList[index].isIncome
                                          ? Colors.greenAccent.withOpacity(1)
                                          : Colors.redAccent.withOpacity(1),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 3,
                              color: controller.TransactionList[index].isIncome
                                  ? Colors.greenAccent
                                  : Colors.redAccent),
                          color: controller.TransactionList[index].isIncome
                              ? Colors.greenAccent.withOpacity(0.2)
                              : Colors.redAccent.withOpacity(0.2)),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
