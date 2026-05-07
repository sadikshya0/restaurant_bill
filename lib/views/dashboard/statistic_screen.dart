import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/widgets/statistic_widgets/expense_piechart_widget.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Statistics",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 162,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 4,
                        spreadRadius: 3,
                        color: AppColors.lGrey,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "MONTHLY GOAL",
                              style: CustomTextStyles.f12W600(
                                color: AppColors.whiteColor.withOpacity(0.3),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 22,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: SvgPicture.asset(ImagePath.target),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Text(
                          "Stay under \$500",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$0",
                                  style: CustomTextStyles.f16W600(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  "/500",
                                  style: CustomTextStyles.f12W600(
                                    color: AppColors.whiteColor.withOpacity(
                                      0.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 17,
                              width: 52,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  "0% used",
                                  style: CustomTextStyles.f12W600(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        SvgPicture.asset(ImagePath.tick),
                        SizedBox(height: 10),
                        Container(
                          height: 12,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                // spreadRadius: 3,
                                // blurRadius: 3,
                                color: AppColors.lGrey,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Great job you are well within your budget.",
                            style: CustomTextStyles.f12W600(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryTextColor.withOpacity(0.3),
                    ),
                    // boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 4,
                    // )],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                      bottom: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EXPENSE DISTRIBUTION",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        SizedBox(height: 40),
                        ExpensePieChart(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 104,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(spreadRadius: 1)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GROWTH TREND",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Spending Increased",
                              style: CustomTextStyles.f16W600(
                                color: AppColors.whiteColor,
                              ),
                            ),

                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  82,
                                  6,
                                  1,
                                ).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.redAccent,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "You have spend \$0 more than last month ",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.yellow),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ACTIVE GOALS",
                              style: CustomTextStyles.f16W600(
                                color: Colors.brown,
                              ),
                            ),
                            Container(
                              height: 26,
                              width: 78,
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "EDIT GOALS",
                                  style: CustomTextStyles.f12W600(
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cafe Fasting",
                              style: CustomTextStyles.f12W600(
                                color: Colors.brown,
                              ),
                            ),
                            Text(
                              "14/30 days",
                              style: CustomTextStyles.f12W600(
                                color: Colors.brown,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.deepOrange),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 9,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Weekend Saver",
                              style: CustomTextStyles.f12W600(
                                color: Colors.brown,
                              ),
                            ),
                            Text(
                              "\$30 saved",
                              style: CustomTextStyles.f12W600(
                                color: Colors.brown,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.deepOrange),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 9,
                                width: 94,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
