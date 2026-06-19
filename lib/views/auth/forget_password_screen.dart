import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/repo/forget_password_repo.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/views/auth/reset_password_screen.dart';
import 'package:restaurant_bill/widgets/custom/custom_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final RxBool isLoading = false.obs;

  void sendOtp() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    }

    isLoading.value = true;

    await ForgetPasswordRepo.forgetPasswordRepo(
      email: email,
      onSuccess: (message) {
        isLoading.value = false;

        Get.snackbar("Success", message);

        Get.to(() => ResetPasswordScreen(email: email));
      },
      onError: (message) {
        isLoading.value = false;

        Get.snackbar("Error", message);
      },
    );
  }

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
          "Forgot Password",
          style: CustomTextStyles.f18W600(color: AppColors.textColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.email, color: AppColors.whiteColor, size: 60),
              ),

              const SizedBox(height: 40),

              Text(
                "Enter your email address to receive an OTP to reset your password.",
                textAlign: TextAlign.center,
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),

              const SizedBox(height: 40),

              CustomTextField(
                controller: emailController,
                hint: "example@gmail.com",
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                preIconPath: Icons.email,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: isLoading.value ? null : sendOtp,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Send OTP",
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
