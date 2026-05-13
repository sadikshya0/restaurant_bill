import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/scan_controller.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ScanController controller = Get.put(ScanController());

  @override
  void initState() {
    super.initState();
    controller.initCamera();
  }

  @override
  void dispose() {
    Get.delete<ScanController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),

        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.toggleFlash,
              icon: Icon(
                controller.flashOn.value ? Icons.flash_on : Icons.flash_off,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (!controller.isInitialized.value ||
            controller.cameraController == null) {
          return const Center(
            child: Text(
              "Camera not ready",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final image = controller.capturedImage.value;

        return Column(
          children: [
            const SizedBox(height: 12),

            const Text(
              "Align receipt inside the frame",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),

            /// SCANNER AREA
            Expanded(
              child: Center(
                child: Container(
                  height: 420,
                  width: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: image != null
                        ? Image.file(image, fit: BoxFit.cover)
                        : CameraPreview(controller.cameraController!),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ACTIONS (WITH GALLERY INCLUDED)
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// GALLERY
                  IconButton(
                    onPressed: controller.pickFromGallery,
                    icon: const Icon(
                      Icons.photo_library_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  /// CAPTURE
                  GestureDetector(
                    onTap: controller.captureImage,
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),

                  /// CLEAR
                  IconButton(
                    onPressed: controller.clearImage,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
