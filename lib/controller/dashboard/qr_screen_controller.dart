import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restaurant_bill/controller/dashboard/billing_screen_controller.dart';
import 'package:restaurant_bill/repo/add_bills_repo.dart';

class QrScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();

  CameraController? cameraController;
  List<CameraDescription>? cameras;

  RxBool isInitialized = false.obs;
  RxBool isLoading = false.obs;
  RxBool flashOn = false.obs;

  Rx<File?> capturedImage = Rx<File?>(null);

  /// Initialize camera
  Future<void> initCamera() async {
    try {
      isLoading.value = true;

      final permission = await Permission.camera.request();

      if (!permission.isGranted) {
        Get.snackbar("Permission", "Camera permission denied");
        return;
      }

      cameras = await availableCameras();

      cameraController = CameraController(
        cameras!.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();

      isInitialized.value = true;
    } catch (e) {
      Get.snackbar("Error", "Camera initialization failed");
    } finally {
      isLoading.value = false;
    }
  }

  /// Capture image from camera
  Future<void> captureImage() async {
    try {
      if (cameraController == null) return;

      isLoading.value = true;

      final XFile file = await cameraController!.takePicture();

      capturedImage.value = File(file.path);
    } catch (e) {
      Get.snackbar("Error", "Capture failed");
    } finally {
      isLoading.value = false;
    }
  }

  /// Pick image from gallery
  Future<void> pickFromGallery() async {
    try {
      isLoading.value = true;

      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );

      if (image != null) {
        capturedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image");
    } finally {
      isLoading.value = false;
    }
  }

  /// Flash
  Future<void> toggleFlash() async {
    if (cameraController == null) return;

    flashOn.value = !flashOn.value;

    await cameraController!.setFlashMode(
      flashOn.value ? FlashMode.torch : FlashMode.off,
    );
  }

  /// Upload bill
  Future<void> uploadBill() async {
    if (capturedImage.value == null) return;

    isLoading.value = true;

    await AddBillsRepo.addBillsRepo(
      billImage: capturedImage.value!,
      onSuccess: (message) {
        Get.snackbar("Success", message);

        if (Get.isRegistered<BillingScreenController>()) {
          Get.find<BillingScreenController>().fetchBills();
        }

        clearImage();

        Get.back();
      },
      onError: (message) {
        Get.snackbar("Error", message);
      },
    );

    isLoading.value = false;
  }

  /// Clear image
  void clearImage() {
    capturedImage.value = null;
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
