import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bookmark_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/product_page.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [ProductPage(), BookmarkPage(), ProfilePage()];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}