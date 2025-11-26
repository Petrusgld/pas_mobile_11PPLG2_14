import 'package:flutter_application_1/Controller/bookmark_controller.dart';
import 'package:flutter_application_1/Controller/profile_controller.dart';
import 'package:flutter_application_1/Controller/show_controller.dart';
import 'package:flutter_application_1/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
    Get.lazyPut<ShowController>(() => ShowController());
    Get.lazyPut<BookmarkController>(() => BookmarkController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}