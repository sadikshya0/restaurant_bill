import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/repo/login_repo.dart';
import 'package:restaurant_bill/utils/custom_snackbar.dart';
import 'package:restaurant_bill/utils/storage_keys.dart';
import 'package:restaurant_bill/views/auth/successful_login_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordobscure = true.obs;

  final passwordController = TextEditingController();
  final emailcontroller = TextEditingController();

  RxBool isChecked = false.obs;
  void onEyeClick() {
    passwordobscure.value = !passwordobscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
    context: Get.context!,
    barrierDimisable: false,
  );
  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await LoginRepo.loginRepo(
        email: emailcontroller.text,
        password: passwordController.text,
        onSuccess: (user, token, message) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
          Get.find<CoreController>().loadCurrentUser();
          Get.to(() => SuccessfulLoginScreen());
          CustomSnackBar.success(title: "Login", message: message);
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Login", message: message);
        },
      );
    }
  }
}
