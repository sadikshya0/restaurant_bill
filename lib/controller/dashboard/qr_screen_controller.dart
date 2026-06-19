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
        Get.snackbar(
          "Permission Denied",
          "Camera permission is required to scan QR or capture bills.",
        );
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

      Get.snackbar("Success", "Camera initialized successfully");
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to initialize camera. Please restart the app.",
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Capture image from camera
  Future<void> captureImage() async {
    try {
      if (cameraController == null) {
        Get.snackbar("Error", "Camera not ready");
        return;
      }

      isLoading.value = true;

      final XFile file = await cameraController!.takePicture();

      capturedImage.value = File(file.path);

      Get.snackbar("Success", "Image captured successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to capture image. Try again.");
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

        Get.snackbar("Success", "Image selected from gallery");
      } else {
        Get.snackbar("Info", "No image selected");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image from gallery");
    } finally {
      isLoading.value = false;
    }
  }

  /// Flash toggle
  Future<void> toggleFlash() async {
    if (cameraController == null) return;

    flashOn.value = !flashOn.value;

    await cameraController!.setFlashMode(
      flashOn.value ? FlashMode.torch : FlashMode.off,
    );

    Get.snackbar(
      "Flash",
      flashOn.value ? "Flash turned ON" : "Flash turned OFF",
    );
  }

  /// Upload bill
  Future<void> uploadBill() async {
    if (capturedImage.value == null) {
      Get.snackbar("Warning", "Please select or capture an image first");
      return;
    }

    try {
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
    } catch (e) {
      Get.snackbar("Error", "Something went wrong while uploading bill");
    } finally {
      isLoading.value = false;
    }
  }

  void clearImage() {
    capturedImage.value = null;

    Get.snackbar("Retake", "You can capture or select a new image");
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
