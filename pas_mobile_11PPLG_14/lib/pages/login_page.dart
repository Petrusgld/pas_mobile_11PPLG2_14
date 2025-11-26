import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/customButton.dart';
import 'package:flutter_application_1/Component/customText.dart';
import 'package:flutter_application_1/Component/customTextField.dart';
import 'package:flutter_application_1/Component/spacing.dart';
import 'package:flutter_application_1/Controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Obx(() {
            return controller.isLoading.value
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomText(
                        textAlign: TextAlign.center,
                        text: "Sign In",
                        style: TextStyle(
                          fontSize: 50,
                          color: Color.fromARGB(255, 5, 36, 114),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                        ),
                      ),

                      const Spacing(height: 2),

                      const CustomText(
                        textAlign: TextAlign.center,
                        text:
                            "Search your Products, and buy it",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF0C033D),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                        ),
                      ),

                      const Spacing(height: 32),

                      // Username Field
                      CustomTextField(
                        controller: controller.username,
                        hintText: "Username",
                        outlineColor: const Color(0xFF0C033D),
                        icon: Icons.person,
                      ),

                      const Spacing(height: 16),

                      // Password Field
                      CustomTextField(
                        controller: controller.password,
                        hintText: "Password",
                        outlineColor: const Color(0xFF0C033D),
                        obsecureText: true,
                        icon: Icons.lock,
                      ),

                      const Spacing(height: 32),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: Obx(() {
                          return controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  text: "Login",
                                  width: 376,
                                  height: 53,
                                  onPressed: controller.login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 5, 36, 114),
                                  ),
                                  labelColor: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                );
                        }),
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
