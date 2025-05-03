import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/services/api_service.dart';
import '../model/product_detail_model.dart'; // Your SingleProductModel

class ProductDetailsController extends GetxController {
  // Observable to hold the product data
  var product = Rxn<SingleProductModel>(); // Use Rxn for nullable reactive variable
  var isLoading = true.obs; // Track loading state
  var errorMessage = ''.obs; // Track error messages


  Future<void> fetchProductDetails(int productId) async {
    try {
      isLoading(true);
      final response = await NetworkService().get(
        endpoint: '/products/$productId',
        showLoader: false,
      );
      if (response == null) {
        errorMessage.value = 'No response from server';
        return;
      }
      if (response.statusCode == 200) {
        final jsonData = response.data;
        log('Raw JSON: $jsonData', name: 'fetchProductDetails');
        log('JSON Type: ${jsonData.runtimeType}', name: 'fetchProductDetails');
        if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('error')) {
            errorMessage.value = jsonData['error'] as String? ?? 'Unknown error';
            return;
          }
          final productData = jsonData['data'] ?? jsonData;
          if (productData is Map<String, dynamic>) {
            product.value = SingleProductModel.fromJson(productData);
          } else {
            errorMessage.value = 'Invalid product data format';
          }
        } else {
          errorMessage.value = 'Unexpected response format: ${jsonData.runtimeType}';
        }
      } else {
        errorMessage.value = 'Failed to load product: ${response.statusCode}';
        if (response.statusMessage?.isNotEmpty ?? false) {
          errorMessage.value += ' - ${response.statusMessage}';
        }
        if (response.data is Map<String, dynamic> && response.data.containsKey('message')) {
          errorMessage.value += ' - ${response.data['message']}';
        }
      }
    } catch (e, stackTrace) {
      errorMessage.value = 'Error: $e';
      log('Error in fetchProductDetails: $e', stackTrace: stackTrace, name: 'fetchProductDetails');
    } finally {
      isLoading(false);
    }
  }

}