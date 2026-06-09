import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/auth/register_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/utils/validator.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';
import 'package:restaurant_bill/widgets/custom/custom_password_textfield.dart';
import 'package:restaurant_bill/widgets/custom/custom_textfield.dart';
import 'package:restaurant_bill/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  final c = Get.put(RegisterScreenController());
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: c.formKey,
              child: Column(
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

                      child: Image.asset(ImagePath.star, fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(height: 10),

                  Center(
                    child: Text(
                      "Get Started",
                      style: CustomTextStyles.f32W600(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Center(
                    child: Text(
                      "Create an account to save your first bill",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Full Name",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    hint: "Enter your full name",
                    controller: c.nameController,
                    preIconPath: Icons.person,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  Text(
                    " Email Address",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    hint: "Enter your email address",
                    controller: c.emailController,
                    preIconPath: Icons.email,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Phone Number",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hint: "Enter your phone number",
                    controller: c.phoneController,
                    preIconPath: Icons.phone,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Password",
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
                      onEyeClick: c.onPasswordEyeClick,
                      controller: c.passwordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Confirm Password",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      preIconPath: Icons.lock,
                      hint: "Enter your confirm password",
                      eye: c.confirmPasswordobscure.value,
                      onEyeClick: c.onConfirmPasswordEyeClick,
                      controller: c.confirmPasswordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(height: 30),

                  CustomElevatedButton(
                    title: "Create Account",
                    onTap: () {
                      c.onSubmit();
                    },
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: CustomTextStyles.f16W600(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Get.offAll(() => LoginScreen());
                        },
                        child: Text(
                          "Sign In",
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
        ),
      ),
    );
  }
}
