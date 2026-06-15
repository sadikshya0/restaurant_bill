import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/utils/api.dart';

class UpdateProfileRepo {
  static Future<void> updateProfileRepo({
    required String fullName,
    required String phone,
    File? profileImage,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.currentUser.value?.token?.trim();

      var request = http.MultipartRequest("POST", Uri.parse(Api.updateUrl));

      request.headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      // Fields
      request.fields['full_name'] = fullName;
      request.fields['phone'] = phone;

      if (profileImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath('profile_image', profileImage.path),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log("STATUS: ${response.statusCode}");
      log("BODY: ${response.body}");

      final data = jsonDecode(response.body);

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
