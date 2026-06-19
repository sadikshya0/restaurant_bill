import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetScreenController extends GetxController {
  final pinController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
