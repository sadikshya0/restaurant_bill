import 'package:flutter/material.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class HelpQuestionTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const HelpQuestionTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: CustomTextStyles.f12W400(
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),

          const SizedBox(width: 10),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
