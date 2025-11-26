import 'package:flutter_application_1/Controller/show_controller.dart';
import 'package:get/get.dart';

class ShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowController>(() => ShowController());
  }
}
