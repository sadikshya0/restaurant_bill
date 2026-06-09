import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/qr_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/scan_screen.dart';

class QrScreen extends StatelessWidget {
  final QrScreenController controller = Get.put(QrScreenController());
  QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Scan",
            style: CustomTextStyles.f20W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Scan Receipt",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.pickFromGallery,
                          child: Text(
                            "Upload Receipt",
                            style: CustomTextStyles.f14W600(
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.lGrey),
                  child: Center(child: Image.asset(ImagePath.mobile)),
                ),
                SizedBox(height: 30),
                Text(
                  "Scan your Receipt",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Text(
                  "Align your receipt within the frame and scan clearly. Ensure the restaurants name , total amount, and date are visible ",
                  style: CustomTextStyles.f14W400(
                    color: AppColors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80),

                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.document_scanner_outlined,
                        color: AppColors.whiteColor,
                        size: 24,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => ScanScreen());
                        },
                        child: Text(
                          "Start Scan",
                          style: CustomTextStyles.f14W600(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
