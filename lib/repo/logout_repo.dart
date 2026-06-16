import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/utils/api.dart';

class LogoutRepo {
  static Future<void> logoutRepo({
    required String email,
    required String password,

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

      var body = {"email": email, "password": password};

      http.Response response = await http.post(
        Uri.parse(Api.logoutUrl),
        headers: headers,
        body: body,
      );

      dynamic data = jsonDecode(response.body);
      log("body: $body");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
