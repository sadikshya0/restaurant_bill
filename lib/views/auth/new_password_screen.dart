import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/auth/new_password_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/validator.dart';
import 'package:restaurant_bill/widgets/custom/custom_password_textfield.dart';

class NewPasswordScreen extends StatelessWidget {
  final String email;
  final String otp;

  NewPasswordScreen({super.key, required this.email, required this.otp});

  final c = Get.put(NewPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackgroundDark,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text(
          "Create New Password",
          style: CustomTextStyles.f18W600(color: AppColors.textColor),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.security_sharp,
                    color: AppColors.whiteColor,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 40),

                Text(
                  "Your password must be different from previous passwords",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),

                const SizedBox(height: 40),

                Obx(
                  () => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    preIconPath: Icons.password,
                    hint: "New Password",
                    eye: c.passwordObscure.value,
                    onEyeClick: c.togglePassword,
                    controller: c.passwordController,
                    textInputAction: TextInputAction.next,
                  ),
                ),

                const SizedBox(height: 20),

                Obx(
                  () => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    preIconPath: Icons.password,
                    hint: "Confirm Password",
                    eye: c.confirmPasswordObscure.value,
                    onEyeClick: c.toggleConfirmPassword,
                    controller: c.confirmPasswordController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: c.isLoading.value ? null : () => c.resetPassword(email, otp),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: c.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Reset Password",
                        style: CustomTextStyles.f18W600(
                          color: AppColors.whiteColor,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
