import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/repo/reset_password_repo.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';

class NewPasswordScreenController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  RxBool isLoading = false.obs;

  void togglePassword() {
    passwordObscure.value = !passwordObscure.value;
  }

  void toggleConfirmPassword() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  void resetPassword(String email, String otp) async {
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    if (password.isEmpty || confirm.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    if (password != confirm) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    await ResetPasswordRepo.resetPasswordRepo(
      email: email,
      otp: otp,
      new_password: password,
      onSuccess: (msg) {
        isLoading.value = false;
        Get.snackbar("Success", msg);
        Get.offAll(() => LoginScreen());
      },
      onError: (msg) {
        isLoading.value = false;
        Get.snackbar("Error", msg);
      },
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
