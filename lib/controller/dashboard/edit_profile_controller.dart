import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  /// Selected Image
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString selectedGender = "".obs;

  RxString selectedDOB = "".obs;

  /// Image Picker Instance
  final ImagePicker _picker = ImagePicker();

  /// Pick from Camera
  Future<void> pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image from camera");
    }
  }

  /// Pick from Gallery
  Future<void> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image from gallery");
    }
  }
}
