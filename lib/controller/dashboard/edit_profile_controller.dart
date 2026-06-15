import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/repo/update_profile_repo.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/storage_keys.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';

class EditProfileController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  Rx<File?> selectedImage = Rx<File?>(null);
  RxString selectedGender = "".obs;
  RxString selectedDOB = "".obs;
  RxBool isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    setUserData();
  }

  void setUserData() {
    final user = Get.find<CoreController>().currentUser.value;

    fullNameController.text = user?.fullName ?? "";
    phoneController.text = user?.phone ?? "";
    emailController.text = user?.email ?? "";
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Image selection failed");
    }
  }

  Future<void> pickFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> pickFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> updateProfile() async {
    if (isLoading.value) return;

    if (fullNameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      Get.snackbar("Error", "Name and phone are required");
      return;
    }

    try {
      isLoading.value = true;

      await UpdateProfileRepo.updateProfileRepo(
        fullName: fullNameController.text.trim(),
        phone: phoneController.text.trim(),
        profileImage: selectedImage.value,
        onSuccess: (message) {
          final core = Get.find<CoreController>();
          final user = core.currentUser.value;

          if (user != null) {
            user.fullName = fullNameController.text.trim();
            user.phone = phoneController.text.trim();

            if (selectedImage.value != null) {
              user.profileImage = selectedImage.value!.path;
            }

            core.currentUser.refresh();

            // Save updated user to local storage here
            StorageHelper.saveUser(user);
          }

          Get.snackbar(
            "Success",
            message.isNotEmpty ? message : "Profile updated successfully",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.transparent,
            colorText: AppColors.textColor,
          );

          Get.offAll(() => ProfileScreen());
        },
        onError: (message) {
          Get.snackbar(
            "Error",
            message.isNotEmpty ? message : "Failed to update profile",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.transparent,
            colorText: AppColors.textColor,
          );
        },
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
