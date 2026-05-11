import 'package:get/get.dart';

class PrivacyController extends GetxController {
  /// Data Sharing
  RxBool isDataSharingEnabled = false.obs;

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
}
