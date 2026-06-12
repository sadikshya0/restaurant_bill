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
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final notifications = controller.filteredNotifications;
        return Padding(
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

              SizedBox(height: 10),

              Row(
                children: [
                  Obx(
                    () => Wrap(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () => controller.changeTab(0),
                          child: _buildTab(
                            "All",
                            controller.allCount,
                            controller.selectedTab.value == 0,
                          ),
                        ),

                        GestureDetector(
                          onTap: () => controller.changeTab(1),
                          child: _buildTab(
                            "Unread",
                            controller.unreadCount,
                            controller.selectedTab.value == 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: controller.markAllAsRead,
                        child: Text(
                          "Mark All as Read",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: Text(
                                "Delete all notifications?",
                                style: CustomTextStyles.f14W600(
                                  color: AppColors.textColor,
                                ),
                              ),
                              content: Text(
                                "This action will permanently remove all notifications.",
                                style: CustomTextStyles.f14W400(
                                  color: AppColors.textColor,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    "Cancel",
                                    style: CustomTextStyles.f12W600(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    controller.deleteAllNotifications();
                                  },
                                  child: Text(
                                    "Delete",
                                    style: CustomTextStyles.f12W600(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete_sweep, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
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
                          onTap: () => controller.markAsRead(n.id.toString()),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                controller.deleteNotification(n.id.toString()),
                          ),
                        ),
                        Divider(
                          color: AppColors.secondaryTextColor.withOpacity(0.5),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTab(String title, int count, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
          SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: isActive ? AppColors.primaryColor : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
