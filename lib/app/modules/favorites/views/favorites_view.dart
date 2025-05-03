import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/favorites_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController controller = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Obx(() => Text('${controller.filteredProducts.length} results found')),
            SizedBox(height: 16.h),
            Obx(() => Expanded(
              child: ListView.builder(
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = controller.filteredProducts[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: NetworkImage(
                          product.thumbnail ?? (product.images?.isNotEmpty ?? false ? product.images![0] : ''),
                        ),
                        onBackgroundImageError: (exception, stackTrace) => const Icon(Icons.broken_image, size: 50),
                      ),
                      title: Text(
                        product.title ?? 'N/A',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${product.price ?? 0}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                '${product.rating?.toString() ?? 'N/A'} ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                            ],
                          ),
                        ],
                      ),
                      trailing: Obx(() => IconButton(
                        icon: Icon(
                          controller.favoriteProducts.contains(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.favoriteProducts.contains(product)
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: () {
                          controller.toggleFavorite(product);
                        },
                      )),
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}