import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/views/dashboard/billing_screen.dart';
import 'package:restaurant_bill/views/dashboard/home_screen.dart';
import 'package:restaurant_bill/views/dashboard/points_screen.dart';
import 'package:restaurant_bill/views/dashboard/qr_screen.dart';
import 'package:restaurant_bill/views/dashboard/statistic_screen.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    HomeScreen(),
    BillingScreen(),
    QrScreen(),
    StatisticScreen(),
    PointsScreen(),
  ]);
  RxInt currentIndex = RxInt(0);
  void changetab(int index) {
    currentIndex.value = index;
  }
}
