import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class PointsHistory extends StatelessWidget {
  final Color color;
  final String title;
  final String points;
  final String iconPath;
  final VoidCallback? onTap;

  const PointsHistory({
    super.key,
    required this.color,
    required this.title,
    required this.points,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        width: 105,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.lGrey, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: SvgPicture.asset(iconPath, height: 16, width: 16),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              title,
              style: CustomTextStyles.f12W600(color: AppColors.textColor),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              points,
              style: CustomTextStyles.f16W600(color: AppColors.green),
            ),
          ],
        ),
      ),
    );
  }
}
