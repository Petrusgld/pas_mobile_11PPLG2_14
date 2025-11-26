import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/customButton.dart';
import 'package:flutter_application_1/Component/customCard.dart';
import 'package:flutter_application_1/Component/customText.dart';
import 'package:flutter_application_1/Controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(14),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/profile.png',
                          ),
                          radius: 50,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: CustomText(
                            text: 'Emmanuel Michael A.S',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MycardWidget(
                    text: "11 PPLG 2",
                    textStyle: TextStyle(fontSize: 18),
                    leadingIcon: Icon(Icons.class_rounded),
                  ),
                  MycardWidget(
                    text: "+6281386624608",
                    textStyle: TextStyle(fontSize: 18),
                    leadingIcon: Icon(Icons.phone),
                  ),
                  MycardWidget(
                    text: 'coysoti@gmail.com',
                    textStyle: TextStyle(fontSize: 18),
                    leadingIcon: Icon(Icons.email),
                  ),
                ],
              ),
              CustomButton(
                text: "Log out",
                onPressed: profileController.logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 14, 28, 135),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                labelColor: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
