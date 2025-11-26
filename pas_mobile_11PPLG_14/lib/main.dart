import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/splash_binding.dart';
import 'package:flutter_application_1/routes/pages.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.splashScreenPage,
      getPages: AppPages.pages,
    );
  }
}
