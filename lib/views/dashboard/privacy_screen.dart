import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/privacy_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';
import 'package:restaurant_bill/widgets/privacy_widgets/privacy_card.dart';

class PrivacyScreen extends StatelessWidget {
  final PrivacyController controller = Get.put(PrivacyController());
  PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offAll(() => ProfileScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "Privacy and security",
            style: CustomTextStyles.f18W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Settings",
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),
              SizedBox(height: 20),
              PrivacyCard(
                title: "Data Sharing",
                description:
                    "Allow app Usage to improve data features. Learn More",
                trailing: Obx(
                  () => Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: controller.isDataSharingEnabled.value,
                      onChanged: controller.toggleDataSharing,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              PrivacyCard(
                title: "Profile visibility",
                description: "Show my profile in search result.",
                trailing: Obx(
                  () => Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: controller.isProfileVisible.value,
                      onChanged: controller.toggleProfileVisibility,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text(
                "Security Settings",
                style: CustomTextStyles.f14W600(color: AppColors.textColor),
              ),
              SizedBox(height: 10),

              PrivacyCard(
                title: "Change Password",
                description:
                    "Update your current password to ensure your account     remain secure",
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              SizedBox(height: 10),

              PrivacyCard(
                title: "Two Factor Authentication",
                description: "Secure your account with 2FA",
                trailing: Obx(
                  () => Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: controller.isTwoFactorEnabled.value,
                      onChanged: controller.toggleTwoFactor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              PrivacyCard(
                title: "Recognized your device",
                description: "Manage your device you're logged into",
                trailing: Container(
                  height: 28,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.lGrey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Account Manage",
                style: CustomTextStyles.f14W600(color: AppColors.textColor),
              ),
              SizedBox(height: 10),
              PrivacyCard(
                title: "Recognized your device",
                description: "Manage your device you're logged into",
                trailing: Container(
                  height: 28,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.textColor),
                    color: AppColors.secondaryTextColor.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      "Manage Apps",
                      style: CustomTextStyles.f12W400(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              PrivacyCard(
                title: "Download your Data",
                description: "Request a copy of your account data. ",
                trailing: Container(
                  height: 28,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.textColor),
                    color: AppColors.secondaryTextColor.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      "Download Apps",
                      style: CustomTextStyles.f12W400(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              PrivacyCard(
                title: "Delete  Account",
                description: "Permanently delete your account.",
                trailing: Container(
                  height: 28,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.textColor),
                    color: Colors.redAccent.withOpacity(0.9),
                  ),
                  child: Center(
                    child: Text(
                      "Delete Account",
                      style: CustomTextStyles.f12W400(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
