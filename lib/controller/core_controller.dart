import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_bill/model/user.dart';
import 'package:restaurant_bill/utils/storage_keys.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';

class CoreController extends GetxController {
  Rx<Users?> currentUser = Rxn<Users>();
  Rx<String> userToken = "".obs;

  @override
  void onInit() async {
    log("dsfsdfsdfdsfdsfsdf");
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
    log("current email---- ${currentUser.value?.email}--");
    log("current token--- ${currentUser.value?.token}--");
  }

  bool isUserLoggendIn() {
    log("dsfsdfsdfdsfdsfsdfsadas jksdhk");

    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    Get.offAll(() => LoginScreen());
  }
}
