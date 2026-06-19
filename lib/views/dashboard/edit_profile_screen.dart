import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/controller/dashboard/edit_profile_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';
import 'package:restaurant_bill/widgets/custom/custom_dropdown_field.dart';
import 'package:restaurant_bill/widgets/custom/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.offAll(() => ProfileScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "Edit Profile",
            style: CustomTextStyles.f18W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Obx(() {
                        final user =
                            Get.find<CoreController>().currentUser.value;

                        return Container(
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: controller.selectedImage.value != null
                                ? Image.file(
                                    controller.selectedImage.value!,
                                    fit: BoxFit.cover,
                                  )
                                : (user?.profileImage != null &&
                                      user!.profileImage!.isNotEmpty)
                                ? Image.file(
                                    File(user.profileImage!),
                                    fit: BoxFit.cover,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      ImagePath.profile,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        );
                      }),
                      Positioned(
                        bottom: 0,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),

                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text("Camera"),
                                      onTap: () async {
                                        Get.back();
                                        await controller.pickFromCamera();
                                      },
                                    ),

                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: const Text("Gallery"),
                                      onTap: () async {
                                        Get.back();
                                        await controller.pickFromGallery();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },

                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
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
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                CustomTextField(
                  hint: "Full Name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  controller: controller.fullNameController,
                ),
                SizedBox(height: 20),

                CustomTextField(
                  hint: "Email",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  readOnly: true,
                  controller: controller.emailController,
                ),
                SizedBox(height: 20),

                CustomTextField(
                  hint: "Phone number",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  controller: controller.phoneController,
                ),
                SizedBox(height: 20),

                Obx(
                  () => CustomDropdownField<String>(
                    hint: "Gender",
                    value: controller.selectedGender.value.isEmpty
                        ? null
                        : controller.selectedGender.value,
                    items: const ["Male", "Female", "Other"],
                    itemLabel: (item) => item,
                    onChanged: (value) {
                      controller.selectedGender.value = value!;
                    },
                  ),
                ),
                SizedBox(height: 40),
                Obx(
                  () => InkWell(
                    onTap: controller.isLoading.value
                        ? null
                        : () {
                            controller.updateProfile();
                          },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Save",
                                style: CustomTextStyles.f14W600(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                      ),
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
