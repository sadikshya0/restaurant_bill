import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/utils/image_path.dart';
import 'package:restaurant_bill/views/dashboard/bill_view_screen.dart';

class RecentBillsWidget extends StatelessWidget {
  const RecentBillsWidget({
    super.key,
    required this.title,
    required this.dateTime,
    required this.price,
    required this.colors,
    required this.status,
  });
  final String title;
  final String dateTime;
  final String price;
  final Color colors;
  final String status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => BillViewScreen());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.f14W600(
                          color: AppColors.textColor,
                        ),
                      ),

                      Text(
                        "\$$price",
                        style: CustomTextStyles.f16W600(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(
                    dateTime,
                    style: CustomTextStyles.f12W400(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: BoxDecoration(
                          color: colors.withOpacity(0.15),
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
                        child: Center(
                          child: Text(
                            status,
                            style: CustomTextStyles.f12W600(color: colors),
                          ),
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
