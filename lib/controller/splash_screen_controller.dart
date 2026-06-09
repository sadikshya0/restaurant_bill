import 'package:get/get.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';
import 'package:restaurant_bill/views/dashboard/dash_screen.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if (c.isUserLoggendIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
  }
}
