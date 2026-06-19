import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/controller/dashboard/profile_controller.dart';
import 'package:restaurant_bill/repo/logout_repo.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/about_screen.dart';
import 'package:restaurant_bill/views/dashboard/dash_screen.dart';
import 'package:restaurant_bill/views/dashboard/edit_profile_screen.dart';
import 'package:restaurant_bill/views/dashboard/favourite_screen.dart';
import 'package:restaurant_bill/views/dashboard/help_screen.dart';
import 'package:restaurant_bill/views/dashboard/privacy_screen.dart';
import 'package:restaurant_bill/widgets/profile_widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final coreController = Get.put(CoreController());
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offAll(() => DashScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
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
            child: SingleChildScrollView(
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
                            Obx(() {
                              final user =
                                  Get.find<CoreController>().currentUser.value;
                              final pickedImage =
                                  controller.selectedImage.value;

                              return Container(
                                height: 95,
                                width: 95,
                                decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryColor.withOpacity(
                                      0.75,
                                    ),
                                    width: 4,
                                  ),
                                ),
                                child: ClipOval(
                                  child: pickedImage != null
                                      ? Image.file(
                                          pickedImage,
                                          fit: BoxFit.cover,
                                        )
                                      : (user?.profileImage != null &&
                                            user!.profileImage!.isNotEmpty)
                                      ? Image.file(
                                          File(user.profileImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset(
                                            ImagePath.profile,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              );
                            }),
                            Positioned(
                              bottom: 4,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),

                                      child: Wrap(
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text("Camera"),
                                            onTap: () async {
                                              Get.back();
                                              await controller.pickFromCamera();
                                            },
                                          ),

                                          ListTile(
                                            leading: Icon(Icons.photo),
                                            title: Text("Gallery"),
                                            onTap: () async {
                                              Get.back();
                                              await controller
                                                  .pickFromGallery();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },

                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.backGroundDark
                                            .withOpacity(0.15),
                                        blurRadius: 2,
                                        spreadRadius: 1.5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),

                                  child: Center(
                                    child: Icon(Icons.camera_alt, size: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        Obx(
                          () => Text(
                            coreController.currentUser.value?.fullName ?? "",
                            style: CustomTextStyles.f18W600(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Obx(
                          () => Text(
                            coreController.currentUser.value?.email ?? "",
                            style: CustomTextStyles.f14W600(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        InkWell(
                          onTap: () {
                            Get.offAll(() => EditProfileScreen());
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Account Setting",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),

                  SizedBox(height: 10),

                  InkWell(
                    onTap: () {
                      Get.offAll(() => FavouriteScreen());
                    },
                    child: ProfileMenuTile(
                      title: "Favourites",
                      iconPath: ImagePath.heart,
                    ),
                  ),

                  SizedBox(height: 10),

                  InkWell(
                    onTap: () {
                      Get.offAll(() => PrivacyScreen());
                    },
                    child: ProfileMenuTile(
                      title: "Privacy and security",
                      iconPath: ImagePath.privacy,
                    ),
                  ),

                  SizedBox(height: 10),

                  InkWell(
                    onTap: () {
                      Get.offAll(() => HelpScreen());
                    },
                    child: ProfileMenuTile(
                      title: "Help and support",
                      iconPath: ImagePath.help,
                    ),
                  ),

                  SizedBox(height: 10),

                  InkWell(
                    onTap: () {
                      Get.offAll(() => AboutScreen());
                    },
                    child: ProfileMenuTile(
                      title: "About",
                      iconPath: ImagePath.about,
                    ),
                  ),

                  SizedBox(height: 40),

                  InkWell(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Logout"),
                          content: Text("Do you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                Get.back();

                                await LogoutRepo.logoutRepo(
                                  onSuccess: (msg) {
                                    Get.snackbar("Success", msg);
                                    Get.find<CoreController>().logOutUser();
                                  },
                                  onError: (msg) {
                                    Get.snackbar("Error", msg);
                                  },
                                );
                              },
                              child: Text("Cancel"),
                            ),

                            TextButton(
                              onPressed: () {
                                Get.back();

                                final coreController =
                                    Get.find<CoreController>();
                                coreController.logOutUser();
                              },
                              child: Text(
                                "Logout",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 6),
                          Text("Logout", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
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
