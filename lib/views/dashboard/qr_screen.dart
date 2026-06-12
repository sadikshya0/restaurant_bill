import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/qr_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<QrScreen> {
  final QrScreenController controller = Get.put(QrScreenController());

  @override
  void initState() {
    super.initState();
    controller.initCamera();
  }

  @override
  void dispose() {
    Get.delete<QrScreenController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackgroundDark,

      appBar: AppBar(
        backgroundColor: AppColors.onBackgroundDark,
        title: Text(
          "Scan Receipt",
          style: CustomTextStyles.f20W600(color: AppColors.textColor),
        ),
        centerTitle: true,

        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.toggleFlash,
              icon: Icon(
                controller.flashOn.value ? Icons.flash_on : Icons.flash_off,
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Obx(() {
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

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// Upload section
                Text(
                  "Align receipt inside the frame",
                  style: TextStyle(color: AppColors.textColor),
                ),

                SizedBox(height: 20),

                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
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

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: image == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: controller.pickFromGallery,
                              icon: Icon(
                                Icons.photo_library_outlined,
                                color: AppColors.textColor,
                                size: 30,
                              ),
                            ),

                            GestureDetector(
                              onTap: controller.captureImage,
                              child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.textColor,
                                    width: 4,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.camera,
                                    color: AppColors.textColor,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),

                            IconButton(
                              onPressed: controller.clearImage,
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.textColor,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controller.clearImage,
                                child: Text("Retake"),
                              ),
                            ),

                            SizedBox(width: 15),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: controller.uploadBill,
                                child: Text("Use Receipt"),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
