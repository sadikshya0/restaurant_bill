import 'package:get/get.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/repo/delete_account_repo.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';

class PrivacyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxBool isDataSharingEnabled = false.obs;
  RxBool isLoading = false.obs;

  /// Profile Visibility
  RxBool isProfileVisible = false.obs;

  /// 2FA
  RxBool isTwoFactorEnabled = false.obs;

  /// Toggle methods
  void toggleDataSharing(bool value) {
    isDataSharingEnabled.value = value;
  }

  void toggleProfileVisibility(bool value) {
    isProfileVisible.value = value;
  }

  void toggleTwoFactor(bool value) {
    isTwoFactorEnabled.value = value;
  }

  Future<void> deleteAccount() async {
    print("Delete button clicked");

    isLoading.value = true;

    await DeleteAccountRepo.deleteAccountRepo(
      onSuccess: (message) {
        print("Success: $message");
        isLoading.value = false;

        Get.snackbar("Success", message);

        final coreController = Get.find<CoreController>();
        coreController.currentUser.value = null;

        Get.offAll(() => LoginScreen());
      },
      onError: (msg) {
        print("Error: $msg");
        isLoading.value = false;
        Get.snackbar("Error", msg);
      },
    );
  }
}
