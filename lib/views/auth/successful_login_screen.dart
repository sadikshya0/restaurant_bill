import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/home_screen.dart';
import 'package:restaurant_bill/widgets/custom/elevated_button.dart';

class SuccessfulLoginScreen extends StatelessWidget {
  SuccessfulLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Verified",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
          child: Column(
            children: [
              Image.asset(ImagePath.security),
              SizedBox(height: 20),

              Text(
                "Login Successful",
                style: CustomTextStyles.f20W600(color: AppColors.textColor),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to Bill Scanner App",
                style: CustomTextStyles.f14W400(color: AppColors.textColor),
              ),

              SizedBox(height: 100),

              CustomElevatedButton(
                title: "Home",
                onTap: () {
                  Get.offAll(() => HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
