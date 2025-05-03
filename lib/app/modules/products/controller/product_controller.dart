import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/services/api_service.dart';
import '../model/product_model.dart';


class ProductController extends GetxController {
  var searchQuery = ''.obs;
  var products = <Products>[].obs;
  var isLoading = false.obs;
  final String callFrom;

  ProductController(this.callFrom);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await NetworkService().get(
        endpoint:callFrom ,
        showLoader: false,
      );

      if (response.statusCode == 200) {
        final productsModel = ProductsModel.fromJson(response.data);
        products.assignAll(productsModel.products ?? []);
        print("================================${callFrom}===============================gggggggggggggggggggg");
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    } finally {
      isLoading.value = false;
    }
  }
  @override
  void dispose() {
    Get.delete<ProductController>();
    super.dispose();
  }
@override
  void onClose() {
  Get.delete<ProductController>();

    super.onClose();
  }
  List<Products> get filteredProducts {
    return products.where((product) {
      return (product.title?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false) ||
          (product.brand?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false);
    }).toList();
  }
}