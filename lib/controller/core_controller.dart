import 'dart:developer';
import 'package:get/get.dart';
import 'package:restaurant_bill/model/user.dart';
import 'package:restaurant_bill/repo/logout_repo.dart';
import 'package:restaurant_bill/utils/storage_keys.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';

class CoreController extends GetxController {
  Rx<Users?> currentUser = Rxn<Users>();
  RxString userToken = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadCurrentUser();
  }

  /// LOAD USER FROM STORAGE
  void loadCurrentUser() {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken() ?? "";

    log("User Email: ${currentUser.value?.email}");
    log("Token: ${userToken.value}");
  }

  /// CHECK LOGIN STATUS
  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  /// 🔥 SINGLE CLEAN LOGOUT FLOW
  Future<void> logOutUser() async {
    final user = currentUser.value;

    if (user == null) {
      await StorageHelper.clearAll();
      Get.offAll(() => LoginScreen());
      return;
    }

    await LogoutRepo.logoutRepo(
      onSuccess: (msg) async {
        await StorageHelper.clearAll();

        currentUser.value = null;
        userToken.value = "";

        if (Get.isDialogOpen == true) {
          Get.back();
        }

        Get.offAll(() => LoginScreen());

        Get.snackbar("Success", msg, snackPosition: SnackPosition.BOTTOM);
      },
      onError: (msg) async {
        // fallback: still logout locally (important for security)
        await StorageHelper.clearAll();

        currentUser.value = null;
        userToken.value = "";

        Get.offAll(() => LoginScreen());

        Get.snackbar("Error", msg, snackPosition: SnackPosition.BOTTOM);
      },
    );
  }
}
