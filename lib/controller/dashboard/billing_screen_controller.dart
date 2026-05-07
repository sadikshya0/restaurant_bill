import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingScreenController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }

  final List<Map<String, dynamic>> bills = [
    {
      "title": "001",
      "dateTime": DateTime(2026, 5, 6, 9, 45),
      "price": "124.53",
      "color": Colors.green,
      "status": "VERIFIED",
    },
    {
      "title": "005",
      "dateTime": DateTime(2026, 5, 5, 8, 43),
      "price": "100",
      "color": Colors.blue,
      "status": "COMPLETED",
    },
    {
      "title": "224",
      "dateTime": DateTime(2024, 10, 10, 5, 45),
      "price": "250",
      "color": Colors.green,
      "status": "VERIFIED",
    },
    {
      "title": "104",
      "dateTime": DateTime(2024, 12, 2, 6, 45),
      "price": "300",
      "color": Colors.green,
      "status": "VERIFIED",
    },
    {
      "title": "003",
      "dateTime": DateTime(2024, 1, 4, 2, 5),
      "price": "500",
      "color": Colors.blue,
      "status": "COMPLETED",
    },
  ];
}
