import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/billing_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/widgets/custom/custom_textfield.dart';
import 'package:restaurant_bill/widgets/home_widgets/recent_billing_widget.dart';

class BillingScreen extends StatelessWidget {
  BillingScreen({super.key});

  final BillingScreenController controller = Get.put(BillingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bills",
              style: CustomTextStyles.f16W600(color: AppColors.textColor),
            ),
            const Icon(Icons.search),
          ],
        ),
        elevation: 4,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              CustomTextField(
                hint: "Search by restaurant name and date..",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                preIconPath: Icons.search,
                fillColor: AppColors.lGrey,
                border: AppColors.lGrey,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildFilterButton("All", 0, 55),
                  buildFilterButton("Today", 1, 69),
                  buildFilterButton("This Month", 2, 85),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Obx(() {
                  final index = controller.selectedIndex.value;

                  final filtered = controller.bills.where((bill) {
                    final date = bill["dateTime"] as DateTime;

                    if (index == 1) {
                      return controller.isToday(date);
                    } else if (index == 2) {
                      return controller.isThisMonth(date);
                    }
                    return true; // All
                  }).toList();

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final bill = filtered[index];

                      return RecentBillsWidget(
                        title: bill["title"],
                        dateTime: bill["dateTime"].toString(),
                        price: bill["price"],
                        colors: bill["color"],
                        status: bill["status"],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilterButton(String text, int index, double width) {
    final controller = Get.put(BillingScreenController());
    return Obx(() {
      final isSelected = controller.selectedIndex.value == index;

      return InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          controller.changeIndex(index);
        },
        child: Container(
          height: 33,
          margin: EdgeInsets.only(right: 14),
          width: width,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.lGrey,
                blurRadius: 2,
                spreadRadius: 1.5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: CustomTextStyles.f12W400(
                color: isSelected
                    ? AppColors.whiteColor
                    : AppColors.secondaryTextColor,
              ),
            ),
          ),
        ),
      );
    });
  }
}
