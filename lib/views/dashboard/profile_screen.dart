import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/auth/login_screen.dart';
import 'package:restaurant_bill/widgets/profile_widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        title: Center(
          child: Text(
            "My Profile",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 18),

                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 95,
                            width: 95,

                            decoration: BoxDecoration(
                              color: AppColors.lGrey,
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: AppColors.primaryColor.withOpacity(0.75),
                                width: 4,
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: Image.asset(
                                ImagePath.profile,
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 4,
                            right: 8,

                            child: Container(
                              height: 25,
                              width: 25,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,

                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.backGroundDark.withOpacity(
                                      0.15,
                                    ),

                                    blurRadius: 2,
                                    spreadRadius: 1.5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),

                              child: const Center(
                                child: Icon(Icons.camera_alt, size: 16),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "John Doe",
                        style: CustomTextStyles.f18W600(
                          color: AppColors.whiteColor,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        "johndoe34@gmail.com",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.whiteColor,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 40,
                        width: 100,

                        decoration: BoxDecoration(
                          color: AppColors.textColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: CustomTextStyles.f12W600(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Account Setting",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),

                const SizedBox(height: 10),

                ProfileMenuTile(title: "Favourites", iconPath: ImagePath.heart),

                const SizedBox(height: 10),

                ProfileMenuTile(
                  title: "Privacy and security",
                  iconPath: ImagePath.privacy,
                ),

                const SizedBox(height: 10),

                ProfileMenuTile(
                  title: "Help and support",
                  iconPath: ImagePath.help,
                ),

                const SizedBox(height: 10),

                ProfileMenuTile(title: "About", iconPath: ImagePath.about),

                const SizedBox(height: 40),

                InkWell(
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },

                  child: Container(
                    height: 50,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1),

                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Icon(Icons.logout, color: Colors.red, size: 24),

                        const SizedBox(width: 2),

                        Text(
                          "Logout",
                          style: CustomTextStyles.f12W600(color: Colors.red),
                        ),
                      ],
                    ),
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
