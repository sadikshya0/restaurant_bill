import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/dashboard/favourite_controller.dart';
import 'package:restaurant_bill/model/bills.dart';
import 'package:restaurant_bill/utils/colors.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:restaurant_bill/views/dashboard/profile_screen.dart';
import 'package:restaurant_bill/widgets/home_widgets/recent_billing_widget.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});
  final FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.onBackgroundDark,

        leading: InkWell(
          onTap: () {
            Get.offAll(() => ProfileScreen());
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 25),
        ),
        title: Center(
          child: Text(
            "My Favourites",
            style: CustomTextStyles.f18W600(color: AppColors.textColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.allWishlist.isEmpty) {
            return const Center(child: Text("No favourites yet"));
          }

          return ListView.builder(
            itemCount: controller.allWishlist.length,
            itemBuilder: (context, index) {
              final w = controller.allWishlist[index];

              final bill = Bills(
                id: w.billId,
                billNumber: w.billNumber,
                billImage: w.billImage,
                billDate: w.billDate,
                verificationStatus: w.verificationStatus,
                createdAt: w.createdAt,
              );
              return RecentBillsWidget(bills: bill);
            },
          );
        }),
      ),
    );
  }
}
