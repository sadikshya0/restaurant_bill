import 'package:flutter/material.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class SupportOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  const SupportOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.lGrey,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),

                    child: Icon(icon, color: AppColors.primaryColor, size: 18),
                  ),

                  const SizedBox(width: 4),

                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.f12W600(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                textAlign: TextAlign.left,
                style: CustomTextStyles.f10W600(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
