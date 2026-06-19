import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/utils/api.dart';

class ForgetPasswordRepo {
  static Future<void> forgetPasswordRepo({
    required String email,
    required Function(String successMessage) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {"Accept": "application/json"};
      var body = {"email": email};

      http.Response response = await http.post(
        Uri.parse(Api.forgetPasswordUrl),
        headers: headers,
        body: body,
      );

      log("URL: ${Api.forgetPasswordUrl}");
      log("Request Body: $body");
      log("Response: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == "success") {
        onSuccess(data["message"]);
      } else {
        onError(data["message"] ?? "Something went wrong");
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Server error. Please try again.");
    }
  }
}
