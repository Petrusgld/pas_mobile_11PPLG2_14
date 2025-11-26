import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/spacing.dart';
import 'package:flutter_application_1/Controller/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Spacing(height: 16),
            Text("Memeriksa sesi login..."),
          ],
        ),
      ),
    );
  }
}
