import 'package:get/get.dart';
import 'package:restaurant_bill/model/notification.dart' as model;
import 'package:restaurant_bill/repo/get_notification_repo.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchNotification();
  }

  RxInt selectedTab = 0.obs;

  RxBool isLoading = false.obs;

  RxList<model.Notification> notifications = <model.Notification>[].obs;

  int get allCount => notifications.length;

  int get unreadCount => notifications.where((n) => n.isRead == false).length;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void markAllAsRead() {
    for (var n in notifications) {
      n.isRead = true;
    }
    notifications.refresh();
  }

  void fetchNotification() {
    isLoading.value = true;

    GetNotificationRepo.getNotificationRepo(
      onSuccess: (data) {
        isLoading.value = false;
        notifications.assignAll(data);
      },
      onError: (msg) {
        isLoading.value = false;
        Get.snackbar("Error", msg);
      },
    );
  }
}
