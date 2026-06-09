import 'package:get/get.dart';
import 'package:restaurant_bill/model/bills.dart';
import 'package:restaurant_bill/repo/get_bills_repo.dart';

class BillingScreenController extends GetxController {
  var selectedIndex = 0.obs;

  RxList<Bills> bills = <Bills>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllBills();
  }

  void getAllBills() async {
    isLoading.value = true;

    await GetbillsRepo.billsRepo(
      onSuccess: (result) {
        isLoading.value = false;
        bills.assignAll(result); // ✅ FIXED
      },
      onError: (message) {
        isLoading.value = false;
      },
    );
  }

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
}
