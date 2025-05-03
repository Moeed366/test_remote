import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


import '../../../data/services/api_service.dart';
import '../model/Category_model.dart';


class ProductCategoryController extends GetxController {




  var categories = <CategoryModel>[].obs;
  var filteredCategories = <CategoryModel>[].obs;
  var searchQuery = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    debounce(searchQuery, (query) {
      filterCategories(query);
    }, time: const Duration(milliseconds: 300));
  }


  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final response = await NetworkService().get(
        endpoint: '/products/categories',
        showLoader: false,
      );
      log('Response data: ${response.data}', name: 'fetchCategories');
      log('Response type: ${response.data.runtimeType}', name: 'fetchCategories');
      if (response == null) {
        Get.snackbar('Error', 'No response from server');
        return;
      }
      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData is List<dynamic>) {
          categories.assignAll(
            jsonData.map((item) {
              if (item is Map<String, dynamic>) {
                return CategoryModel.fromJson(item);
              } else {
                log('Invalid category item: $item', name: 'fetchCategories');
                return null;
              }
            }).where((item) => item != null).cast<CategoryModel>().toList(),
          );
          filteredCategories.assignAll(categories);
        } else if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('error')) {
            Get.snackbar('Error', jsonData['error'] as String? ?? 'Unknown error');
            return;
          }
          final categoryData = jsonData['data'] ?? jsonData;
          if (categoryData is List<dynamic>) {
            categories.assignAll(
              categoryData.map((item) {
                if (item is Map<String, dynamic>) {
                  return CategoryModel.fromJson(item);
                } else {
                  log('Invalid category item: $item', name: 'fetchCategories');
                  return null;
                }
              }).where((item) => item != null).cast<CategoryModel>().toList(),
            );
            filteredCategories.assignAll(categories);
          } else {
            Get.snackbar('Error', 'Invalid categories format');
          }
        } else {
          Get.snackbar('Error', 'Unexpected response format: ${jsonData.runtimeType}');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch categories: ${response.statusCode}');
        if (response.data is Map<String, dynamic> && response.data.containsKey('message')) {
          Get.snackbar('Error', response.data['message']);
        }
      }
    } catch (e, stackTrace) {
      Get.snackbar('Error', 'An error occurred: $e');
      log('Error in fetchCategories: $e', stackTrace: stackTrace, name: 'fetchCategories');
    } finally {
      isLoading(false);
    }
  }

  void filterCategories(String query) {
    if (query.isEmpty) {
      filteredCategories.assignAll(categories);
    } else {
      filteredCategories.assignAll(categories.where((category) =>
          category.name!.toLowerCase().contains(query.toLowerCase())));
    }
  }






}