import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/model/bills.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/bill_view_screen.dart';

class RecentBillsWidget extends StatelessWidget {
  const RecentBillsWidget({super.key, required this.bills});

  final Bills bills;

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "verified":
        return Colors.green;
      case "pending":
        return Colors.yellow;
      case "invalid":
      case "invalied": // handling typo from backend
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = bills.verificationStatus ?? "";
    final color = getStatusColor(status);

    return InkWell(
      onTap: () {
        Get.to(() => BillViewScreen());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        child: Row(
          children: [
            Image.asset(
              ImagePath.bill,
              height: 60,
              width: 60,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bills.billNumber ?? "",
                    style: CustomTextStyles.f14W600(color: AppColors.textColor),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    bills.billDate ?? "",
                    style: CustomTextStyles.f12W400(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lGrey.withOpacity(0.4),
                              blurRadius: 2,
                              spreadRadius: 1.5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          status.isEmpty ? "unknown" : status,
                          style: CustomTextStyles.f12W600(color: color),
                        ),
                      ),

                      SvgPicture.asset(ImagePath.heart),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
