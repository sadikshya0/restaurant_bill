import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/notification_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
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
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Get.offAll(() => DashScreen()),
        ),
        title: Text(
          "Notifications",
          style: CustomTextStyles.f16W600(color: AppColors.textColor),
        ),
        centerTitle: true,
      ),

      body: Obx(() {
        final notifications = controller.notifications;

        return notifications.isEmpty
            ? const Center(child: Text("No notifications"))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      /// SEARCH
                      CustomTextField(
                        hint: "Search",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        preIconPath: Icons.search,
                        fillColor: AppColors.lGrey,
                        border: AppColors.lGrey,
                      ),

                      const SizedBox(height: 10),

                      /// COUNTERS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _buildTab("All", controller.allCount),
                              const SizedBox(width: 8),
                              _buildTab("Unread", controller.unreadCount),
                            ],
                          ),

                          TextButton(
                            onPressed: controller.markAllAsRead,
                            child: Text(
                              "Mark all as read",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// LIST
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final n = notifications[index];

                          return Column(
                            children: [
                              NotificationTile(
                                type: n.type,
                                title: n.title ?? "",
                                description: n.message ?? "",
                                time: n.createdAt ?? "",
                                showDot: !(n.isRead ?? false),
                                onTap: () {},
                              ),
                              Divider(
                                color: AppColors.secondaryTextColor.withOpacity(
                                  0.5,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  Widget _buildTab(String title, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Text(title),
          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              count.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
