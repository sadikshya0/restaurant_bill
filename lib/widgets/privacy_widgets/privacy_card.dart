import 'package:flutter/material.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class PrivacyCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget trailing;

  const PrivacyCard({
    super.key,
    required this.title,
    required this.description,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.lGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyles.f12W600(
              color: AppColors.secondaryTextColor,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  description,
                  style: CustomTextStyles.f10W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),

              trailing, // flexible widget
            ],
          ),
        ],
      ),
    );
  }
}
