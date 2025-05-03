import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dart:convert';
import '../../products/controller/product_controller.dart';
import '../../products/view/products.dart';
import '../controller/category_controller.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductCategoryController controller = Get.put(ProductCategoryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
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
              Text('${controller.filteredCategories.length} results found'),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 8.h,
                    childAspectRatio: 1,
                  ),
                  itemCount: controller.filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = controller.filteredCategories[index];
                    return GestureDetector(onTap: (){


                      Get.put(ProductController(category.url!.replaceFirst('https://dummyjson.com', '')));

                      Get.to(()=>ProductScreen(callFrom: category.url!.replaceFirst('https://dummyjson.com', ''),),);},
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.network(
                              'https://hips.hearstapps.com/hmg-prod/images/gh-best-skincare-products-6557978b58b57.png?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              //errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
                            ),
                          ),

                          Positioned(bottom:60,left: 20,
                            child: Text(
                              category.name.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),

    );
  }
}