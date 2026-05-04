import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_bill/controller/splash_screen_controller.dart';
import 'package:restaurant_bill/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 155,
                    width: 155,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.15),
                        width: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 22,
                    top: 22,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.secondaryColor,
                          width: 8,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 42,
                    bottom: 42,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/pizza.png'),
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                "BistroScan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                "Smart Bill Manager",
                style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
              ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.security, color: AppColors.whiteColor, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "SECURE PROCESSING",
                    style: TextStyle(fontSize: 12, color: AppColors.whiteColor),
                  ),
                ],
              ),

              // Image.asset('image/assets/pizza.png'),
              // CircularProgressIndicator(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: LinearProgressIndicator(
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.secondaryColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
