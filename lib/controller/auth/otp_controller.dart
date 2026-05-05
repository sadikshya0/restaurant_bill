import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
}
