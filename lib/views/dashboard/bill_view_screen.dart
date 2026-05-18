import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';

class BillViewScreen extends StatelessWidget {
  const BillViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "Bill View",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 530,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset(ImagePath.bil),
                ),
                SizedBox(height: 20),
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
                        Icons.download,
                        color: AppColors.whiteColor,
                        size: 24,
                      ),
                      Text(
                        "Export as PDF/CSV",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                      Icon(Icons.share, color: AppColors.whiteColor, size: 24),
                      Text(
                        "Share Bill",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  "Rate",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border, color: Colors.amber),
                    Icon(Icons.star_border, color: Colors.amber),
                    Icon(Icons.star_border, color: Colors.amber),
                    Icon(Icons.star_border, color: Colors.amber),
                    Icon(Icons.star_border, color: Colors.amber),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
