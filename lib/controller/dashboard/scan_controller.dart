import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  CameraController? cameraController;
  List<CameraDescription>? cameras;

  final ImagePicker picker = ImagePicker();

  RxBool isInitialized = false.obs;
  RxBool isLoading = false.obs;
  RxBool flashOn = false.obs;

  Rx<File?> capturedImage = Rx<File?>(null);

  /// INIT CAMERA
  Future<void> initCamera() async {
    try {
      isLoading.value = true;

      await Permission.camera.request();

      cameras = await availableCameras();

      cameraController = CameraController(
        cameras!.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();

      isInitialized.value = true;
    } catch (e) {
      Get.snackbar("Error", "Camera init failed");
    } finally {
      isLoading.value = false;
    }
  }

  /// CAPTURE FROM CAMERA
  Future<void> captureImage() async {
    try {
      if (cameraController == null) return;

      isLoading.value = true;

      final file = await cameraController!.takePicture();

      capturedImage.value = File(file.path);
    } catch (e) {
      Get.snackbar("Error", "Capture failed");
    } finally {
      isLoading.value = false;
    }
  }

  /// PICK FROM GALLERY (NEW)
  Future<void> pickFromGallery() async {
    try {
      isLoading.value = true;

      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null) {
        capturedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Gallery open failed");
    } finally {
      isLoading.value = false;
    }
  }

  /// FLASH
  Future<void> toggleFlash() async {
    if (cameraController == null) return;

    flashOn.value = !flashOn.value;

    await cameraController!.setFlashMode(
      flashOn.value ? FlashMode.torch : FlashMode.off,
    );
  }

  /// CLEAR
  void clearImage() {
    capturedImage.value = null;
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
