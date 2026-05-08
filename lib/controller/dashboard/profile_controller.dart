import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      selectedImage.value = File(image.path);
    }
  }

  /// Pick Image From Gallery
  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
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
    Get.offAllNamed('/login');
  }
}
