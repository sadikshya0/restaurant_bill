import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';
import 'package:restaurant_bill/widgets/help_widgets/help_card.dart';
import 'package:restaurant_bill/widgets/help_widgets/help_question_tile.dart';
import 'package:restaurant_bill/widgets/help_widgets/support_option_card.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offAll(() => ProfileScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Column(
            children: [
              Text(
                "Help and Support",
                style: CustomTextStyles.f18W600(color: AppColors.textColor),
              ),
              SizedBox(width: 4),
              Text(
                "Find answers or chat with us",
                style: CustomTextStyles.f12W400(color: AppColors.textColor),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COMMON TOPICS",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: HelpCard(
                            title: "Scanning",
                            iconPath: ImagePath.scan,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: HelpCard(
                            title: "Payment",
                            iconPath: ImagePath.pay,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: HelpCard(
                            title: "Account",
                            iconPath: ImagePath.account,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: HelpCard(
                            title: "Featurs",
                            iconPath: ImagePath.feature,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  "COMMON TOPICS",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        HelpQuestionTile(
                          title: "How do I split a bill with friends ?",
                        ),
                        Divider(
                          color: AppColors.secondaryTextColor.withOpacity(0.2),
                        ),

                        HelpQuestionTile(
                          title: "The scanner isn't reading my receipt",
                        ),
                        Divider(
                          color: AppColors.secondaryTextColor.withOpacity(0.2),
                        ),

                        HelpQuestionTile(
                          title: "Can i export my scan history ?",
                        ),
                        Divider(
                          color: AppColors.secondaryTextColor.withOpacity(0.2),
                        ),

                        HelpQuestionTile(title: "Is my payment info secure ?"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Still need help?",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SupportOptionCard(
                        title: "Live Chat",
                        subtitle: "Speak with our own team.",
                        icon: Icons.message_rounded,
                      ),
                      SizedBox(width: 20),
                      SupportOptionCard(
                        title: "Email",
                        subtitle: "Response within 24 hour.",
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(width: 20),

                      SupportOptionCard(
                        title: "Phone",
                        subtitle: "Available Mon-Fri, 9am-5pm.",
                        icon: Icons.phone,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
