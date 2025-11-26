import 'package:flutter/material.dart';
import 'package:flutter_application_1/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final NavbarController baseController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 5, 36, 114),
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(color: const Color.fromARGB(252, 255, 255, 255), fontWeight: FontWeight.w500),
        ),
        elevation: 1,
        selectedIndex: baseController.currentIndex.value,
        onDestinationSelected: (value) => baseController.changeIndex(value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.category_rounded, color: Colors.white,), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.bookmark, color: Colors.white,), label: 'Favorite'),
          NavigationDestination(icon: Icon(Icons.person, color: Colors.white,), label: 'My Profile'),
        ],
      ),
    );
  }
}