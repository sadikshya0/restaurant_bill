import 'package:flutter/material.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/widgets/notification_widget/notification_icon.dart';

class NotificationTile extends StatelessWidget {
  final String? type;
  final String title;
  final String description;
  final String time;
  final bool showDot;
  final VoidCallback? onTap;
  final Widget? trailing;
  const NotificationTile({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    this.showDot = true,
    this.onTap,
    this.trailing,
  });

  NotificationIcon _getNotificationIcon(String? type) {
    switch (type) {
      case "offer":
        return NotificationIcon(icon: Icons.local_offer, color: Colors.orange);

      case "loyalty":
        return NotificationIcon(icon: Icons.star, color: Colors.amber);

      case "money":
        return NotificationIcon(icon: Icons.attach_money, color: Colors.green);

      case "reminder":
        return NotificationIcon(icon: Icons.alarm, color: Colors.blue);

      default:
        return NotificationIcon(icon: Icons.notifications, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconData = _getNotificationIcon(type);

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
              color: iconData.color.withOpacity(0.15),
            ),
            child: Icon(iconData.icon, color: iconData.color, size: 22),
          ),

          const SizedBox(width: 12),

          /// CONTENT
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

          /// TIME + DOT
          Column(
            children: [
              if (showDot)
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),

              const SizedBox(height: 4),

              Text(
                time,
                style: CustomTextStyles.f10W400(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              if (trailing != null) ...[const SizedBox(height: 6), trailing!],
            ],
          ),
        ],
      ),
    );
  }
}
