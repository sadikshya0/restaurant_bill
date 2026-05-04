import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordobscure = true.obs;

  final passwordController = TextEditingController();
  final phonecontroller = TextEditingController();

  RxBool isChecked = false.obs;
  void onEyeClick() {
    passwordobscure.value = !passwordobscure.value;
  }
}
