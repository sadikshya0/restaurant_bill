import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:restaurant_bill/utils/api.dart';

class ResetPasswordRepo {
  static Future<void> resetPasswordRepo({
    required String email,
    required String new_password,
    required String otp,
    required Function(String successMessage) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {"Accept": "application/json"};
      var body = {"email": email, "new_password": new_password, "otp": otp};
      http.Response response = await http.post(
        Uri.parse(Api.resetPasswordUrl),
        headers: headers,
        body: body,
      );
      log("URL ${Uri.parse(Api.resetPasswordUrl)}");
      log("$body");
      dynamic data = jsonDecode(response.body);
      log("Otp : $data");
      if (data["status"] == "success") {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
