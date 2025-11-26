import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/customText.dart';
import 'package:flutter_application_1/Component/spacing.dart';
import 'package:flutter_application_1/Controller/show_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ShowController showController = Get.find<ShowController>();

  String cleanDesc(String raw) {
    return raw.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (showController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (showController.productsList.isEmpty) {
            return const Center(child: CustomText(text: 'No TV Shows Found'));
          }

          return RefreshIndicator(
            onRefresh: () {
              return showController.fetchProducts();
            },
            child: ListView.builder(
              itemCount: showController.productsList.length,
              itemBuilder: (context, index) {
                final productShow = showController.productsList[index];

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            productShow.image,
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Spacing(width: 10),

                        // text area
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // title dan bookmark
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: CustomText(
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      text: productShow.title,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showController.toogleBookmark(productShow.id);
                                    },
                                    child: Icon(
                                      productShow.isBookmarked
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: productShow.isBookmarked
                                          ?  Color.fromARGB(255, 241, 157, 0)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),

                              const Spacing(height: 8),

                              // Rating
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const Spacing(width: 4),
                                  CustomText(
                                    text: '${productShow.rating.rate ?? "-"}',
                                  ),
                                ],
                              ),

                              const Spacing(height: 10),

                              // Description Products
                              CustomText(
                                maxLines: 4,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                                text: cleanDesc(productShow.description),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
