import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/utils/storage_keys.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';

class ProfileController extends GetxController {
  /// User Info
  RxString userName = "John Doe".obs;
  RxString email = "johndoe34@gmail.com".obs;

  /// Image Picker
  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  /// Loading
  RxBool isLoading = false.obs;

  /// Edit Profile
  void editProfile({required String name, required String userEmail}) {
    userName.value = name;
    email.value = userEmail;
  }

  /// Pick Image From Camera
  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final file = File(image.path);
      selectedImage.value = file;

      _updateGlobalProfileImage(file);
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      selectedImage.value = file;

      _updateGlobalProfileImage(file);
    }
  }

  /// Menu Actions
  void onFavouritesTap() {
    Get.snackbar("Favourites", "Open favourites screen");
  }

  void onPrivacyTap() {
    Get.snackbar("Privacy & Security", "Open privacy settings");
  }

  void onHelpTap() {
    Get.snackbar("Help & Support", "Open help center");
  }

  void onAboutTap() {
    Get.snackbar("About", "Open about screen");
  }

  /// Logout
  void logout() {
    final core = Get.find<CoreController>();
    core.currentUser.value = null;

    selectedImage.value = null;
    Get.offAll(() => LoginScreen());
  }

  void _updateGlobalProfileImage(File file) {
    final core = Get.find<CoreController>();

    core.currentUser.update((user) {
      if (user != null) {
        user.profileImage = file.path;
      }
    });

    core.currentUser.refresh();

    /// OPTIONAL: persist locally
    StorageHelper.saveUser(core.currentUser.value!);
  }
}
