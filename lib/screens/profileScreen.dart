import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spennd/controllerandmodels/TransactionController.dart';
import 'package:spennd/main.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 11, 11),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 20),
              child: GestureDetector(
                onTap: () {
                  controller.getStorage.remove('user');
                  controller.getStorage.write('isSeen', 'notDone');
                },
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Change Username',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 30, 30, 30),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
