import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/auth/login_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/utils/validator.dart';
import 'package:restaurant_bill/views/auth/register_screen.dart';
import 'package:restaurant_bill/views/dashboard/dash_screen.dart';
import 'package:restaurant_bill/widgets/custom/custom_password_textfield.dart';
import 'package:restaurant_bill/widgets/custom/custom_textfield.dart';
import 'package:restaurant_bill/widgets/custom/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(ImagePath.wave),
                ),
              ),

              SizedBox(height: 20),
              Center(
                child: Text(
                  "Welcome Back!",
                  style: CustomTextStyles.f32W600(color: AppColors.textColor),
                ),
              ),

              SizedBox(height: 8),
              Center(
                child: Text(
                  "Sign in to continue tracking your meals",
                  style: CustomTextStyles.f12W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),

              SizedBox(height: 30),
              Text(
                "PHONE NUMBER",
                style: CustomTextStyles.f16W600(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 10),

              CustomTextField(
                hint: "Enter your phone number",
                preIconPath: Icons.mobile_friendly,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
              ),

              SizedBox(height: 20),

              Text(
                "PASSWORD",
                style: CustomTextStyles.f16W600(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 10),

              Obx(
                () => CustomPasswordField(
                  validator: Validators.checkPasswordField,
                  preIconPath: Icons.lock,
                  hint: "Enter your password",
                  eye: c.passwordobscure.value,
                  onEyeClick: c.onEyeClick,
                  controller: c.passwordController,
                  textInputAction: TextInputAction.done,
                ),
              ),

              SizedBox(height: 20),

              Align(
                alignment: AlignmentGeometry.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              CustomElevatedButton(
                title: "Login",
                onTap: () {
                  Get.offAll(() => DashScreen());
                },
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.offAll(() => RegisterScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: CustomTextStyles.f16W600(
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
    );
  }
}
