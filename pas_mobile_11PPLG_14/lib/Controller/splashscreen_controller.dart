import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("token");

    if (username != null && username.isNotEmpty) {
      Get.offAllNamed(AppRoutes.navbarPage);
    } else {
      Get.offAllNamed(AppRoutes.registerPage);
    }
  }
}
