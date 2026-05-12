import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class NotificationTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final String time;
  final Color iconBgColor;
  final bool showDot;
  final VoidCallback? onTap;

  const NotificationTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.time,
    required this.iconBgColor,
    this.showDot = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBgColor,
            ),
            child: Center(
              child: SvgPicture.asset(iconPath, height: 25, width: 25),
            ),
          ),

          const SizedBox(width: 12),

          /// TITLE + DESCRIPTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.f12W600(color: AppColors.textColor),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: CustomTextStyles.f12W400(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          /// TIME
          Column(
            children: [
              if (showDot)
                Icon(Icons.circle, color: AppColors.primaryColor, size: 10),

              const SizedBox(height: 4),

              Text(
                time,
                style: CustomTextStyles.f10W400(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
