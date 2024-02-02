// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:spennd/controllerandmodels/TransactionController.dart';

import 'package:spennd/controllerandmodels/Transactionmodel.dart';
import 'package:spennd/home.dart';

class Details extends StatelessWidget {
  final TransactionModal data;
  final int ind;
  Details({
    Key? key,
    required this.data,
    required this.ind,
  }) : super(key: key);

  TransactionController controller = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbardetails(),
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.currency_rupee_rounded,
                    color: this.data.isIncome
                        ? Colors.greenAccent
                        : Colors.redAccent,
                    size: 40,
                  ),
                  Text(
                    this.data.Tamount.toString(),
                    style: TextStyle(
                        fontSize: 56,
                        color: this.data.isIncome
                            ? Colors.greenAccent
                            : Colors.redAccent),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: IntrinsicHeight(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          this.data.isIncome
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    'Paid By :',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    'Paid To :',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 10),
                              child: Text(
                                this.data.Tname,
                                maxLines: null,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20),
                            child: Text(
                              'Note :',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 10, bottom: 20),
                              child: Text(
                                this.data.TNote,
                                maxLines: null,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20),
                            child: Text(
                              'Date :',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 10, bottom: 20),
                              child: Text(
                                this.data.Tdate,
                                maxLines: null,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20),
                            child: Text(
                              'Time :',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 10, bottom: 20),
                              child: Text(
                                this.data.Ttime,
                                maxLines: null,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 41, 41, 41),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: GestureDetector(
                onTap: () {
                  controller.removeTransaction(ind);
                  Get.offAll(() => Home());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.delete_solid,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Remove Transaction',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appbardetails() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 28, 28, 28))),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.grey,
          )),
    );
  }
}
