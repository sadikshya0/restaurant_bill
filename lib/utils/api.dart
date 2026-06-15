class Api {
  static const String baseUrl = "http://192.168.1.154/restaurant-billing/api";
  static const String loginUrl = "$baseUrl/login.php";
  static const String registerUrl = "$baseUrl/register_user.php";
  static const String otpUrl = "$baseUrl/verify_otp.php";
  static const String billsUrl = "$baseUrl/get_bills.php";
  static const String wishlistUrl = "$baseUrl/get_wishlist.php";
  static const String addWishlistUrl = "$baseUrl/add_wishlist.php";
  static const String addBillsUrl = "$baseUrl/add_bill.php";
  static const String deleteUrl = "$baseUrl/delete_wishlist.php";
  static const String notificationUrl = "$baseUrl/get_notifications.php";
  static const String markNotificationUrl =
      "$baseUrl/mark_read_notification.php";
  static const String markAllNotificationUrl =
      "$baseUrl/mark_all_notifications.php";
  static const String deleteNotificationUrl =
      "$baseUrl/delete_notification.php";
  static const String deleteAllNotificationUrl =
      "$baseUrl/delete_all_notification.php";
  static const String updateUrl = "$baseUrl/update_profile.php";
}
