import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              color: AppColors.primaryColor,
              height: 25,
              width: 25,
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: CustomTextStyles.f14W600(color: AppColors.textColor),
              ),
            ),

            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
