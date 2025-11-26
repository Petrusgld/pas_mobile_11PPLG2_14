import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/bottomNav.dart';
import 'package:flutter_application_1/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarPage extends StatelessWidget {
  NavbarPage({super.key});

  final navbarController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: navbarController.currentIndex.value,
          children: navbarController.pages,
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}