import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class QrScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();

  /// Selected receipt image
  Rx<File?> selectedImage = Rx<File?>(null);

  RxBool isLoading = false.obs;

  /// PICK FROM GALLERY
  Future<void> pickFromGallery() async {
    try {
      isLoading.value = true;

      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );

      if (image != null) {
        selectedImage.value = File(image.path);

        Get.snackbar(
          "Success",
          "Receipt uploaded successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// CLEAR IMAGE
  void clearImage() {
    selectedImage.value = null;
  }
}
