import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/widgets/points_widgets/points_history.dart';
import 'package:restaurant_bill/widgets/points_widgets/reward_card.dart.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Center(
          child: Text("Loyality Points", style: CustomTextStyles.f16W600()),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Points",
                              style: CustomTextStyles.f16W600(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(ImagePath.dollar),
                                Text(
                                  "1500 points",
                                  style: CustomTextStyles.f16W600(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 12,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.whiteColor),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 11,
                                width: 237,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15),
                        Text(
                          "500 Points until next reward",
                          style: CustomTextStyles.f14W600(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                RewardCard(
                  cafeName: "Cafe Aroma",
                  description: "Buy anything from Cafe Aroma",
                  rewardText: "10% Discount on next bill",
                  points: "20pts",
                  imagePath: ImagePath.cafe,
                  isSvg: false,
                ),
                SizedBox(height: 15),

                RewardCard(
                  cafeName: "Station",
                  description: "Buy 1 Get 1 Free",
                  rewardText: "Free Coffee",
                  points: "18pts",
                  imagePath: ImagePath.burger,
                  isSvg: true,
                ),

                SizedBox(height: 20),
                Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    ImagePath.food,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Points History",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PointsHistory(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      title: "Payment",
                      points: "+10 pts",
                      iconPath: ImagePath.payment,
                    ),

                    PointsHistory(
                      color: Colors.amber.withOpacity(0.3),
                      title: "Voucher",
                      points: "+15 pts",
                      iconPath: ImagePath.voucher,
                    ),
                    PointsHistory(
                      color: Colors.amber.withOpacity(0.3),
                      title: "desert",
                      points: "+10 pts",
                      iconPath: ImagePath.desert,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
