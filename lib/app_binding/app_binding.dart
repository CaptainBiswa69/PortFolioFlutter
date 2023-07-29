import 'package:get/get.dart';
import 'package:myportforlio_flutter/screens/home_screen/home_controller.dart';

class AppBinding {
  static Future<void> init() async {
    Get.lazyPut<HomeController>(
        () => HomeController());
  }
}
