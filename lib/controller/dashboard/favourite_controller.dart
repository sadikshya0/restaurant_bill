import 'package:get/get.dart';
import 'package:restaurant_bill/model/wishlist.dart';
import 'package:restaurant_bill/repo/add_wishlist_repo.dart';
import 'package:restaurant_bill/repo/delete_wishlist_repo.dart';
import 'package:restaurant_bill/repo/get_wishlist_repo.dart';
import 'package:restaurant_bill/utils/custom_snackbar.dart';

class FavouriteController extends GetxController {
  RxList<Wishlist> allWishlist = <Wishlist>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchWishlist();
  }

  bool isFavorite(int billId) {
    return allWishlist.any((b) => b.billId == billId.toString());
  }

  void toggleWishlistByBillId(int billId) {
    final Wishlist? existingBill = allWishlist.firstWhereOrNull(
      (item) => item.billId == billId.toString(),
    );
    if (existingBill != null) {
      deleteWishlist(existingBill.wishlistId!);
    } else {
      addToWishlist(billId);
    }
  }

  addToWishlist(int billId) async {
    isLoading.value = true;

    await AddWishlistRepo.addWishlistRepo(
      bill_id: billId.toString(),
      onSuccess: (message) {
        isLoading.value = false;
        fetchWishlist();
        CustomSnackBar.success(title: "Wishlist", message: message);
      },
      onError: (message) {
        isLoading.value = false;
        CustomSnackBar.error(title: "Wishlist", message: message);
      },
    );
  }

  void fetchWishlist() {
    isLoading.value = true;

    GetWishlistRepo.wishlistRepo(
      onSuccess: (data) {
        isLoading.value = false;
        allWishlist.assignAll(data);
      },
      onError: (msg) {
        isLoading.value = false;
        Get.snackbar("Error", msg);
      },
    );
  }

  deleteWishlist(String wishlistId) async {
    isLoading.value = true;

    await DeleteWishlistRepo.deleteWishlistRepo(
      wishlist_id: wishlistId,
      onSuccess: (msg) {
        isLoading.value = false;
        fetchWishlist();
        CustomSnackBar.success(title: "Wishlist", message: msg);
      },
      onError: (msg) {
        isLoading.value = false;
        CustomSnackBar.error(title: "Wishlist", message: msg);
      },
    );
  }
}
