import 'package:get/get.dart';
import 'package:restaurant_bill/model/notification.dart' as model;
import 'package:restaurant_bill/repo/delete_all_notification_repo.dart';
import 'package:restaurant_bill/repo/delete_notification_repo.dart';
import 'package:restaurant_bill/repo/get_notification_repo.dart';
import 'package:restaurant_bill/repo/mark_all_notification_repo.dart';
import 'package:restaurant_bill/repo/mark_notifications_repo.dart';

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

  List<model.Notification> get filteredNotifications {
    if (selectedTab.value == 1) {
      return notifications.where((n) => n.isRead == false).toList();
    }
    return notifications;
  }

  void changeTab(int index) {
    selectedTab.value = index;
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

  Future<void> markAsRead(String id) async {
    await MarkNotificationsRepo.markNotificationRepo(
      notification_id: id,
      onSuccess: (_) {
        fetchNotification(); // refresh
      },
      onError: (msg) {
        Get.snackbar("Error", msg);
      },
    );
  }

  Future<void> markAllAsRead() async {
    await MarkAllNotificationsRepo.markAllNotificationRepo(
      onSuccess: (message) {
        Get.snackbar("Success", message);

        fetchNotification();
      },
      onError: (msg) {
        Get.snackbar("Error", msg);
      },
    );
  }

  Future<void> deleteNotification(String id) async {
    await DeleteNotificationRepo.deleteNotificationRepo(
      notification_id: id,
      onSuccess: (message) {
        Get.snackbar("Success", message);

        notifications.removeWhere((n) => n.id.toString() == id);
      },
      onError: (msg) {
        Get.snackbar("Error", msg);
      },
    );
  }

  Future<void> deleteAllNotifications() async {
    await DeleteAllNotificationRepo.deleteAllNotificationRepo(
      onSuccess: (message) {
        Get.snackbar("Success", message);

        fetchNotification();
      },
      onError: (msg) {
        Get.snackbar("Error", msg);
      },
    );
  }
}
