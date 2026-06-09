import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/auth/register_screen.dart';
import 'package:restaurant_bill/views/auth/successful_login_screen.dart';
import 'package:restaurant_bill/widgets/custom/elevated_button.dart';
import 'package:pinput/pinput.dart';

import '../../controller/auth/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  final c = Get.put(OtpController());
  OtpScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offAll(() => RegisterScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "OTP",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(child: Image.asset(ImagePath.pizza)),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Verify with OTP",
                    style: CustomTextStyles.f16W600(color: AppColors.textColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Enter 4-digit OTP sent to +977-98XXXXXXX",
                    style: CustomTextStyles.f16W400(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 30),

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

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the OTP?",
                        style: CustomTextStyles.f12W600(
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Resend in 00:30",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Divider(
                    height: 40,
                    thickness: 1,
                    color: AppColors.secondaryTextColor.withOpacity(0.5),
                  ),
                  SizedBox(height: 30),
                  CustomElevatedButton(
                    title: "Verify & Login",
                    onTap: () {
                      c.onSubmit(userId);
                    },
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(title: "cancel", onTap: () {}),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Having difficult with OTP?",
                        style: CustomTextStyles.f12W600(
                          color: AppColors.textColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Get Help",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
