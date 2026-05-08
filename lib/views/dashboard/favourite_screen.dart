import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
            "My Favourites",
            style: CustomTextStyles.f18W600(color: AppColors.textColor),
          ),
        ),
      ),
    );
  }
}
