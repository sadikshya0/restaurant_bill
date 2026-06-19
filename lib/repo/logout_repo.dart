import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/utils/api.dart';

class LogoutRepo {
  static Future<void> logoutRepo({
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.currentUser.value?.token?.trim();

      if (token == null || token.isEmpty) {
        onError("User token not found");
        return;
      }

      var headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

      http.Response response = await http.post(
        Uri.parse(Api.logoutUrl),
        headers: headers,
      );

      final data = jsonDecode(response.body);
      log("Logout response: $data");

      if (response.statusCode == 200 && data["status"] == "success") {
        onSuccess(data["message"] ?? "Logged out successfully");
      } else {
        onError(data["message"] ?? "Logout failed");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
