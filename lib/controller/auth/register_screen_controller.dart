import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/repo/register_repo.dart';
import 'package:restaurant_bill/utils/custom_snackbar.dart';
import 'package:restaurant_bill/views/auth/otp_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class RegisterScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordobscure = true.obs;
  RxBool confirmPasswordobscure = true.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isChecked = false.obs;
  void onPasswordEyeClick() {
    passwordobscure.value = !passwordobscure.value;
  }

  void onConfirmPasswordEyeClick() {
    confirmPasswordobscure.value = !confirmPasswordobscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
    context: Get.context!,
    barrierDimisable: false,
  );
  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await RegisterRepo.register(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        onSuccess: (message, userId) async {
          loading.hide();
          Get.to(() => OtpScreen(userId: userId));
          CustomSnackBar.success(
            title: "Register Successful!!",
            message: "Please check your email for verification.",
          );
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Register", message: message);
        },
      );
    }
  }
}
