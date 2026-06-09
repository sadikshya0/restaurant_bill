import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/model/bills.dart';
import 'package:restaurant_bill/utils/api.dart';

class GetbillsRepo {
  static Future<void> billsRepo({
    required Function(List<Bills> bills) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.currentUser.value?.token?.trim();

      log("TOKEN => $token");

      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      log("HEADERS => $headers");
      var url = Uri.parse(Api.billsUrl);

      final response = await http.get(url, headers: headers);

      log("STATUS CODE: ${response.statusCode}");
      log("RAW RESPONSE: ${response.body}");

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final rawList = data['data'];

        if (rawList != null && rawList is List) {
          final bills = billsFromJson(rawList);
          onSuccess(bills);
        } else {
          onSuccess([]); // ✅ safe empty state
        }
      } else {
        onError(data['message'] ?? "Something went wrong");
      }
    } catch (e, s) {
      log("ERROR: $e");
      log("STACK: $s");
      onError("Sorry! something went wrong");
    }
  }
}
