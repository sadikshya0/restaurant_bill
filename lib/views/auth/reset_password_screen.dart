import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:restaurant_bill/controller/auth/reset_screen_controller.dart';
import 'package:restaurant_bill/repo/reset_password_repo.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/views/auth/new_password_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  ResetPasswordScreen({super.key, required this.email});

  final c = Get.put(ResetScreenController());

  void verifyOtp() async {
    final otp = c.pinController.text.trim();

    if (otp.isEmpty || otp.length < 6) {
      Get.snackbar("Error", "Please enter valid 6 digit OTP");
      return;
    }

    c.isLoading.value = true;

    await ResetPasswordRepo.resetPasswordRepo(
      email: email,
      otp: otp,
      new_password: "",
      onSuccess: (msg) {
        c.isLoading.value = false;

        Get.snackbar("Success", msg);

        Get.to(() => NewPasswordScreen(email: email, otp: otp));
      },
      onError: (msg) {
        c.isLoading.value = false;

        Get.snackbar("Error", msg);
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
          "Verify Your Email",
          style: CustomTextStyles.f18W600(color: AppColors.textColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                  Icons.security,
                  color: AppColors.whiteColor,
                  size: 60,
                ),
              ),

              const SizedBox(height: 40),

              Text(
                "Please Enter The 6 Digit Code Sent to $email",
                textAlign: TextAlign.center,
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),

              const SizedBox(height: 40),

              Pinput(
                length: 6,
                controller: c.pinController,
                defaultPinTheme: PinTheme(
                  width: 45,
                  height: 45,
                  textStyle: CustomTextStyles.f14W400(
                    color: AppColors.textColor,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.secondaryTextColor),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 60,
                  textStyle: CustomTextStyles.f14W400(
                    color: AppColors.textColor,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  // TODO: resend OTP API
                },
                child: Text(
                  "Resend Code",
                  style: CustomTextStyles.f14W600(color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: c.isLoading.value ? null : verifyOtp,
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
                        "Verify OTP",
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
