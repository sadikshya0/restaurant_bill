import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class RewardCard extends StatelessWidget {
  final String cafeName;
  final String description;
  final String rewardText;
  final String points;
  final String imagePath;
  final bool isSvg;
  final VoidCallback? onRedeem;

  const RewardCard({
    super.key,
    required this.cafeName,
    required this.description,
    required this.rewardText,
    required this.points,
    required this.imagePath,
    this.isSvg = false,
    this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lGrey, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSvg
              ? Center(
                  child: SvgPicture.asset(imagePath, height: 50, width: 50),
                )
              : Image.asset(
                  imagePath,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cafeName,
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          color: AppColors.orange,
                          size: 18,
                        ),

                        Text(
                          points,
                          style: CustomTextStyles.f16W600(
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// Description
                Text(
                  description,
                  style: CustomTextStyles.f14W400(color: AppColors.textColor),
                ),

                /// Bottom Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        rewardText,
                        style: CustomTextStyles.f14W400(color: AppColors.green),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: onRedeem,
                      child: Container(
                        height: 24,
                        width: 70,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Redeem",
                            style: CustomTextStyles.f12W600(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
