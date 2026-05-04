import 'package:get/get.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Simulate a delay for the splash screen (e.g., 3 seconds)
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the next screen (e.g., LoginScreen)
      Get.offAll(() => LoginScreen());
    });
  }
}
