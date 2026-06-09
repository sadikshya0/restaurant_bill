import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:restaurant_bill/utils/api.dart';

class RegisterRepo {
  static Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required Function(String successMessage, String userId) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {"Accept": "application/json"};
      var body = {
        "full_name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
      http.Response response = await http.post(
        Uri.parse(Api.registerUrl),
        headers: headers,
        body: body,
      );
      log("URL ${Uri.parse(Api.registerUrl)}");
      log("$body");
      dynamic data = jsonDecode(response.body);
      log("User register : $data");
      if (data["status"] == "success") {
        onSuccess(data["message"], data['user_id'].toString());
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
