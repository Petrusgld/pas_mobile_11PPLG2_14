import 'package:flutter_application_1/Controller/show_controller.dart';
import 'package:flutter_application_1/db_helper/db_helper.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:get/get.dart';

class BookmarkController extends GetxController {
  var isLoading = false.obs;
  final DbHelper dbHelper = DbHelper();
  final ShowController showController = Get.find<ShowController>();
  final RxList<ProductModel> bookmarkedProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchBookmarkedShows();
  }

  Future<void> fetchBookmarkedShows() async {
    bookmarkedProducts.value = await showController.productsList
        .where((shows) => shows.isBookmarked)
        .toList();
  }

  void toogleBookmark(int productId) async {
    final index = showController.productsList.indexWhere(
      (productShow) => productShow.id == productId,
    );
    if (index != -1) {
      final currentStatus = showController.productsList[index].isBookmarked;
      showController.productsList[index].isBookmarked = !currentStatus;
      showController.productsList.refresh();

      if (showController.productsList[index].isBookmarked) {
        await dbHelper.insertBookmark(
          showController.productsList[index],
        );
      } else {
        await dbHelper.deleteById(
          showController.productsList[index].id,
        );
      }
      await dbHelper.printAllData();
    }
  }
}
