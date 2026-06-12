import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/utils/api.dart';

class DeleteNotificationRepo {
  static Future<void> deleteNotificationRepo({
    required String notification_id,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.currentUser.value?.token?.trim();

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      http.Response response = await http.delete(
        Uri.parse(
          "${Api.deleteNotificationUrl}?notification_id=$notification_id",
        ),
        headers: headers,
      );

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"] ?? "Something went wrong");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
