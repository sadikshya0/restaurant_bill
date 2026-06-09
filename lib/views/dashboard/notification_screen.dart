import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/notification_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/dash_screen.dart';
import 'package:restaurant_bill/widgets/custom/custom_textfield.dart';
import 'package:restaurant_bill/widgets/notification_widget/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.offAll(() => DashScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "Notifications",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hint: "Search",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  preIconPath: Icons.search,
                  fillColor: AppColors.lGrey,
                  border: AppColors.lGrey,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.primaryColor.withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All ",
                                style: CustomTextStyles.f12W400(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      controller.unreadCount.value.toString(),
                                      style: CustomTextStyles.f10W400(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.primaryColor.withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Unread ",
                                style: CustomTextStyles.f12W400(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      controller.unreadCount.value.toString(),
                                      style: CustomTextStyles.f10W400(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.markAllAsRead();
                      },
                      child: Text(
                        "Mark all as read",
                        style: CustomTextStyles.f12W400(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Today",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                NotificationTile(
                  iconPath: ImagePath.gift,
                  title: "Offer Alter",
                  description: "20% off at Burger House. Valid today!",
                  time: "2min ago",
                  iconBgColor: AppColors.lOrange.withOpacity(0.3),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor.withOpacity(0.5)),

                SizedBox(height: 10),
                NotificationTile(
                  iconPath: ImagePath.stars,
                  title: "Loyalty Updates",
                  description:
                      "You earned 10 loyalty points from your last bill.",
                  time: "5min ago",
                  iconBgColor: AppColors.lOrange.withOpacity(0.7),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor.withOpacity(0.5)),
                SizedBox(height: 20),
                Text(
                  "Yesterday",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                NotificationTile(
                  iconPath: ImagePath.money,
                  title: "Spending Alerts",
                  description: "You've spent Rs. 5,000 on food this month.”",
                  time: "1h ago",
                  iconBgColor: AppColors.primaryColor.withOpacity(0.3),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor.withOpacity(0.5)),

                SizedBox(height: 10),
                NotificationTile(
                  iconPath: ImagePath.reminder,
                  title: "Visit Reminders",
                  description:
                      "Your favorite restaurant is nearby. Check new offers!",
                  time: "5h ago",
                  iconBgColor: Colors.blueGrey.withOpacity(0.7),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor.withOpacity(0.5)),
                SizedBox(height: 20),
                Text(
                  "Monday, October 11, 2025",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),

                NotificationTile(
                  iconPath: ImagePath.stars,
                  title: "Loyalty Updates",
                  description:
                      "You earned 10 loyalty points from your last bill.",
                  time: "9min ago",
                  iconBgColor: AppColors.lOrange.withOpacity(0.7),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor.withOpacity(0.5)),
                SizedBox(height: 10),
                NotificationTile(
                  iconPath: ImagePath.gift,
                  title: "Offer Alter",
                  description: "New combo offer available at Cafe Aroma",
                  time: "9min ago",
                  iconBgColor: AppColors.lOrange.withOpacity(0.3),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor.withOpacity(0.5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
