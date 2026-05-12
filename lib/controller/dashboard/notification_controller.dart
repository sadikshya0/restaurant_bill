import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxInt selectedTab = 0.obs;

  RxInt allCount = 25.obs;
  RxInt unreadCount = 15.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void markAllAsRead() {
    unreadCount.value = 0;
  }
}
