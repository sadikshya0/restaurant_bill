import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/utils/api.dart';

class AddBillsRepo {
  static Future<void> addBillsRepo({
    required File billImage,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.currentUser.value?.token?.trim();

      if (token == null || token.isEmpty) {
        onError("Session expired. Please login again.");
        return;
      }

      final uri = Uri.parse(Api.addBillsUrl);

      final request = http.MultipartRequest("POST", uri);

      request.headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      request.files.add(
        await http.MultipartFile.fromPath('bill_image', billImage.path),
      );
      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 30),
      );

      final response = await http.Response.fromStream(streamedResponse);

      log("STATUS: ${response.statusCode}");
      log("BODY: ${response.body}");

      Map<String, dynamic> data = {};

      try {
        data = jsonDecode(response.body);
      } catch (e) {
        onError("Invalid server response");
        return;
      }

      final message = (data["message"] ?? "Something went wrong").toString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(message);
      } else {
        onError(message);
      }
    } catch (e) {
      log("UPLOAD ERROR: $e");
      onError(e.toString());
    }
  }
}
