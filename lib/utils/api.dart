class Api {
  static const String baseUrl = "http://192.168.1.154/restaurant-billing/api";

  static const String loginUrl = "$baseUrl/login.php";
  static const String registerUrl = "$baseUrl/register_user.php";
  static const String otpUrl = "$baseUrl/verify_otp.php";
  static const String billsUrl = "$baseUrl/get_bills.php";
  static const String wishlistUrl = "$baseUrl/get_wishlist.php";
  static const String addWishlistUrl = "$baseUrl/add_wishlist.php";
  static const String deleteUrl = "$baseUrl/delete_wishlist.php";
}
