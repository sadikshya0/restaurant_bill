import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';
import 'package:restaurant_bill/widgets/about_widgets/feature_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offAll(() => ProfileScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "About",
            style: CustomTextStyles.f18W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        ImagePath.scan,
                        height: 32,
                        width: 36,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "BistroScan",
                    style: CustomTextStyles.f20W600(color: AppColors.textColor),
                  ),
                ),
                Center(
                  child: Text(
                    "Smart Bill Manager",
                    style: CustomTextStyles.f12W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 8,
                      bottom: 4,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(ImagePath.pizza),
                              ),
                            ),
                            Text(
                              "Your Smart Bill Companion",
                              style: CustomTextStyles.f12W600(
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Bistro Scan is designed to simplify restaurant bill management. Our app allows users to scan and securely store bills, track spending habits, and earn loyalty rewards effortlessly. From QR-based bill verification to detailed expense insights, Bistro Scan helps you stay organized and in control of your dining expenses — all in one place.",
                          style: CustomTextStyles.f12W400(
                            color: AppColors.secondaryTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Why BistroScan ?",
                  style: CustomTextStyles.f14W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 15),
                FeatureCard(
                  title: "Smart Split Techonology",
                  description:
                      "Fairly divide tax, tips, and items between any number of diners.",
                  iconPath: ImagePath.people,
                ),
                SizedBox(height: 15),
                FeatureCard(
                  title: "Expense Insights",
                  description:
                      "Visualize your dining habits and stay on top of your monthly budget.",
                  iconPath: ImagePath.clock,
                ),
                SizedBox(height: 15),
                FeatureCard(
                  title: "Cloud Sync & Backup",
                  description:
                      "Access your bill history across all your devices instantly.",
                  iconPath: ImagePath.cloud,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Crafted with ",
                      style: CustomTextStyles.f12W700(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Icon(Icons.favorite, color: Colors.redAccent, size: 16),

                    Text(
                      " by Team BistroScan",
                      style: CustomTextStyles.f12W700(
                        color: AppColors.primaryColor,
                      ),
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
