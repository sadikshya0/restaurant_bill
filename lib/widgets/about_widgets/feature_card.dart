import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: AppColors.lGrey,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON
            Container(
              height: 33,
              width: 33,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor.withOpacity(0.5),
              ),

              child: Center(
                child: SvgPicture.asset(iconPath, height: 18, width: 18),
              ),
            ),

            const SizedBox(width: 12),

            /// TEXTS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    title,
                    style: CustomTextStyles.f12W600(color: AppColors.textColor),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    description,
                    style: CustomTextStyles.f10W600(color: AppColors.textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
