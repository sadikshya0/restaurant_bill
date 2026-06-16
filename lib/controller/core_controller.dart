import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_bill/model/user.dart';
import 'package:restaurant_bill/repo/logout_repo.dart';
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

  Future<void> logOutUser() async {
    final user = currentUser.value;

    if (user == null) return;

    await LogoutRepo.logoutRepo(
      email: user.email ?? "",
      password: user.password ?? "",
      onSuccess: (msg) {
        currentUser.value = null;

        if (Get.isDialogOpen == true) {
          Get.back();
        }

        Future.delayed(const Duration(milliseconds: 100), () {
          Get.offAll(() => LoginScreen());
        });
      },
      onError: (msg) {
        Get.snackbar("Error", msg, snackPosition: SnackPosition.BOTTOM);
      },
    );
  }
}
