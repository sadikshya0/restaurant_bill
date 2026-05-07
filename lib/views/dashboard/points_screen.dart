import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Loyality Points", style: CustomTextStyles.f16W600()),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
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
              Container(
                height: 74,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lGrey, width: 1),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(ImagePath.cafe, height: 60, width: 60),
                    Column(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
