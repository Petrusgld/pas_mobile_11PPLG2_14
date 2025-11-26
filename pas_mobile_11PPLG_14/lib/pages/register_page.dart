import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/customButton.dart';
import 'package:flutter_application_1/Component/customText.dart';
import 'package:flutter_application_1/Component/customTextField.dart';
import 'package:flutter_application_1/Component/spacing.dart';
import 'package:flutter_application_1/Controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                textAlign: TextAlign.center,
                text: "Sign Up",
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
                text: "Create your account to get started!",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 5, 36, 114),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ),
              ),

              const Spacing(height: 32),

              // Username
              CustomTextField(
                controller: registerController.username,
                hintText: "Username",
                outlineColor: const Color(0xFF0C033D),
                icon: Icons.person,
              ),

              const Spacing(height: 20),

              // Password
              CustomTextField(
                controller: registerController.password,
                hintText: "Password",
                outlineColor: const Color(0xFF0C033D),
                obsecureText: true,
                icon: Icons.lock,
              ),

              Spacing(height: 20,),

              CustomTextField(
                controller: registerController.fullName,
                hintText: "Full Name",
                outlineColor: const Color(0xFF0C033D),
                icon: Icons.auto_fix_normal_rounded,
              ),

              Spacing(height: 20,),

              CustomTextField(
                controller: registerController.email,
                hintText: "Email",
                outlineColor: const Color(0xFF0C033D),
                icon: Icons.email,
              ),

              const Spacing(height: 32),

              // Register Button
              SizedBox(
                width: double.infinity,
                child: Obx(() {
                  return registerController.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "Register",
                          width: 376,
                          height: 53,
                          onPressed: registerController.register,
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
          ),
        ),
      ),
    );
  }
}
