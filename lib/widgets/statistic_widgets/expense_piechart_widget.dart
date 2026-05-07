import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';

class ExpensePieChart extends StatelessWidget {
  const ExpensePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 64,
                  startDegreeOffset: -220,
                  sections: _buildSections(),
                ),
              ),

              // Center text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "TOTAL",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$0",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _LegendItem(
              color: AppColors.primaryColor,
              label: "FAST FOOD",
              status: "60%",
            ),
            _LegendItem(color: Colors.red, label: "DINING", status: "25%"),
            _LegendItem(color: Colors.yellow, label: "CAFE", status: "15%"),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildSections() {
    return [
      PieChartSectionData(
        value: 60,
        color: AppColors.primaryColor,
        radius: 15,
        showTitle: false,
      ),

      PieChartSectionData(
        value: 15,
        color: Colors.yellow,
        radius: 15,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 25,
        color: Colors.red,
        radius: 15,
        showTitle: false,
      ),
    ];
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String status;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: CustomTextStyles.f12W600(color: AppColors.textColor),
        ),
        Text(
          status,
          style: CustomTextStyles.f12W600(color: AppColors.textColor),
        ),
      ],
    );
  }
}
