import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../components/description_title.dart';
import '../../../components/detail_item.dart';
import '../../../components/product_banner.dart';
import '../../../components/product_gallery.dart';
import '../../../components/rating.dart';
import '../../../components/section_title.dart';

import '../../favorites/controllers/favorites_controller.dart';
import '../../favorites/views/favorites_view.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    final ProductDetailsController controller = Get.put(ProductDetailsController());
    final FavoritesController favoritesController = Get.find<FavoritesController>();

    controller.fetchProductDetails(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        final product = controller.product.value;
        if (product == null) {
          return const Center(child: Text('Product not found'));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductBanner(
                imageUrl: product.thumbnail ?? (product.images?.isNotEmpty ?? false ? product.images![0] : ''),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Details:',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Obx(() => IconButton(
                          icon: Icon(
                            favoritesController.isFavorite(productId)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favoritesController.isFavorite(productId)
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () => favoritesController.toggleFavorite(product),
                        )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DetailItem(label: 'Name:', value: product.title ?? 'N/A'),
                    DetailItem(label: 'Price:', value: '\$${product.price ?? 0}'),
                    DetailItem(label: 'Category:', value: product.category ?? 'N/A'),
                    DetailItem(label: 'Brand:', value: product.brand ?? 'N/A'),
                    RatingItem(label: 'Rating:', rating: product.rating?.toString() ?? 'N/A'),
                    DetailItem(label: 'Stock:', value: product.stock?.toString() ?? '0'),
                    const SizedBox(height: 10),
                    const SectionTitle(title: 'Description:'),
                    DescriptionText(description: product.description ?? 'No description available.'),
                    const SizedBox(height: 10),
                    const SectionTitle(title: 'Product Gallery:'),
                    ProductGallery(images: product.images),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}