import 'package:flutter_application_1/db_helper/db_helper.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShowController extends GetxController {
  var isLoading = false.obs;
  var productsList = <ProductModel>[].obs;
  final dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
      );

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = productModelFromJson(
          response.body,
        );
        productsList.assignAll(data);
      } else {
        Get.snackbar('Error', 'Message error from server');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toogleBookmark(int productId) {
    final index = productsList.indexWhere((product) => product.id == productId);
    if (index != -1) {
      final currentStatus = productsList[index].isBookmarked;
      productsList[index].isBookmarked = !currentStatus;
      productsList.refresh();
      if (productsList[index].isBookmarked) {
        dbHelper.insertBookmark(productsList[index]);
      } else {
        dbHelper.deleteById(productsList[index].id);
      }
      dbHelper.printAllData();
    }
  }
}