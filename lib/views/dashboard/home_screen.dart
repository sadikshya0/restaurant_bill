import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/core_controller.dart';
import 'package:restaurant_bill/controller/dashboard/billing_screen_controller.dart';
import 'package:restaurant_bill/controller/dashboard/home_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/notification_screen.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';
import 'package:restaurant_bill/widgets/home_widgets/recent_billing_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final c = Get.put(HomeScreenController());
  final coreController = Get.put(CoreController());

  final controller = Get.put(BillingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Hi, foodie!", style: CustomTextStyles.f16W600()),
                SizedBox(width: 5),
                Image.asset(
                  ImagePath.wave,
                  height: 19,
                  width: 19,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),

            Text(
              "Track your dining habbits effortlessly",
              style: CustomTextStyles.f12W400(
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.offAll(() => NotificationScreen());
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                border: Border.all(color: AppColors.lGrey, width: 1),
              ),
              child: SvgPicture.asset(ImagePath.notification),
            ),
          ),

          SizedBox(width: 12),

          InkWell(
            onTap: () {
              Get.offAll(() => ProfileScreen());
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor.withOpacity(0.5),
                border: Border.all(color: AppColors.lGrey, width: 2),
              ),
              child: Center(
                child: Text(
                  "JD",
                  style: CustomTextStyles.f12W600(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 73,
                        width: 169,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lGrey,
                              blurRadius: 6,
                              spreadRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TOTAL SPENT",
                              style: CustomTextStyles.f12W600(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "\$ 160.78",
                              style: CustomTextStyles.f18W600(
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        height: 73,
                        width: 169,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lGrey,
                              blurRadius: 6,
                              spreadRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOYALTY POINTS",
                              style: CustomTextStyles.f12W600(
                                color: AppColors.whiteColor.withOpacity(0.3),
                              ),
                            ),
                            SizedBox(height: 5),
                            Obx(
                              () => Text(
                                "${coreController.currentUser.value?.loyaltyPoints} pts",
                                style: CustomTextStyles.f18W600(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lGrey,
                        blurRadius: 6,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              ImagePath.graph,
                              height: 30,
                              width: 30,
                              fit: BoxFit.scaleDown,
                            ),
                            Text(
                              "Recent Spending",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,

                            /// Hide borders
                            borderData: FlBorderData(show: false),

                            /// Grid lines (dotted style feel)
                            gridData: FlGridData(
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: AppColors.lGrey,
                                  strokeWidth: 1,
                                  dashArray: [5, 5],
                                );
                              },
                              show: true,
                              drawVerticalLine: false,
                              horizontalInterval: 20,
                            ),

                            /// X-axis labels
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 50,
                                  getTitlesWidget: (value, meta) {
                                    int index = value.toInt();
                                    if (index < c.labels.length) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          c.labels[index],
                                          style: TextStyle(
                                            color: AppColors.secondaryTextColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    }
                                    return Text('');
                                  },
                                ),
                              ),
                            ),

                            /// Bars
                            barGroups: List.generate(c.labels.length, (index) {
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: c.values[index],
                                    width: 80,
                                    borderRadius: BorderRadius.circular(10),

                                    /// Gradient like your UI
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor,
                                        AppColors.primaryColor,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Bills",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "View All",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.bills.isEmpty) {
                    return Text(
                      "No Bills",
                      style: CustomTextStyles.f14W400(color: AppColors.lGrey),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.bills.length,
                    itemBuilder: (context, index) {
                      final bill = controller.bills[index];
                      return RecentBillsWidget(bills: bill);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
