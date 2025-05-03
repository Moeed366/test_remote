import 'package:get/get.dart';
import '../../product_detail/model/product_detail_model.dart';

class FavoritesController extends GetxController {
  var favoriteProductIds = <int>{}.obs; // Track favorite product IDs
  var favoriteProducts = <SingleProductModel>[].obs;
  var filteredProducts = <SingleProductModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(searchQuery, (query) {
      filterProducts(query);
    }, time: const Duration(milliseconds: 300));
  }

  bool isFavorite(int productId) {
    return favoriteProductIds.contains(productId);
  }

  void toggleFavorite(SingleProductModel product) {
    if (product.id == null) return; // Guard against null ID
    if (favoriteProductIds.contains(product.id)) {
      favoriteProductIds.remove(product.id);
      favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      favoriteProductIds.add(product.id!);
      favoriteProducts.add(product);
    }
    filterProducts(searchQuery.value);
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(favoriteProducts);
    } else {
      filteredProducts.assignAll(favoriteProducts.where((product) =>
      product.title?.toLowerCase().contains(query.toLowerCase()) ?? false));
    }
  }
}