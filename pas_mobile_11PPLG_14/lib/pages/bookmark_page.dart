import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/customText.dart';
import 'package:flutter_application_1/Component/spacing.dart';
import 'package:flutter_application_1/Controller/bookmark_controller.dart';
import 'package:flutter_application_1/Controller/show_controller.dart';
import 'package:get/get.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});

  final BookmarkController bookmarkController = Get.find<BookmarkController>();
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
          final bookmarks = showController.productsList
              .where((show) => show.isBookmarked)
              .toList();

          if (bookmarks.isEmpty) {
            return const Center(child: CustomText(text: 'you dont have Favorite Product'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await showController.fetchProducts();
            },
            child: ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final productShow = bookmarks[index];

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
                        Spacing(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                      text: '${productShow.title}',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showController.toogleBookmark(
                                        productShow.id,
                                      );
                                    },
                                    child: Icon(
                                      productShow.isBookmarked
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: productShow.isBookmarked
                                          ? Color.fromARGB(255, 241, 157, 0)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacing(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      const Spacing(width: 4),
                                      CustomText(
                                        text:
                                            '${productShow.rating.rate ?? "-"}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacing(height: 10),
                                      CustomText(
                                        maxLines: 4,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                        text: cleanDesc(
                                          productShow.description,
                                        ),
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
