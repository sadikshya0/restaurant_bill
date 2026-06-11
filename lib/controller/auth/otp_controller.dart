import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_bill/repo/otp_repo.dart';
import 'package:restaurant_bill/utils/custom_snackbar.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class OtpController extends GetxController {
  final TextEditingController pinController = TextEditingController();

  var pin = ''.obs;

  void onChanged(String value) {
    pin.value = value;
  }

  void onCompleted(String value) {
    pin.value = value;
    print("Completed PIN: $value");
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }

  final loading = SimpleFontelicoProgressDialog(
    context: Get.context!,
    barrierDimisable: false,
  );
  void onSubmit(String id) async {
    loading.show(message: "Please wait..");
    await OtpRepo.otpRepo(
      id: id,
      otp: pinController.text,
      onSuccess: (message) async {
        loading.hide();
        Get.to(() => LoginScreen());
        CustomSnackBar.success(title: "Register", message: message);
      },
      onError: (message) {
        loading.hide();
        CustomSnackBar.error(title: "Register", message: message);
      },
    );
  }
}
