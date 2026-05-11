import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class HelpCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const HelpCard({
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
        height: 100,
        width: 155,
        decoration: BoxDecoration(
          color: AppColors.lGrey,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, height: 40, width: 60),

            const SizedBox(height: 6),

            Text(
              title,
              style: CustomTextStyles.f12W600(
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
