import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
