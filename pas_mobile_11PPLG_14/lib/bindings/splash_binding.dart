import 'package:flutter_application_1/Controller/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}