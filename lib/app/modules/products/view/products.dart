// product_screen.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../components/list_card.dart';
import '../../product_detail/views/product_detail_view.dart';
import '../controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final String callFrom;

  const ProductScreen({Key? key, required this.callFrom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    final ProductController controller = Get.put(ProductController(callFrom));

    return WillPopScope(
      onWillPop: () async {
        Get.delete<ProductController>(); // Clean up when back
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  children: [
                    if(callFrom!='/products?limit=100')
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {Get.delete<ProductController>();
                          Navigator.pop(context);}
                      ),
                    SizedBox(width: 10.w),
                    Text(callFrom=='/products?limit=100'?'All Products':
                      callFrom.split('/').last,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  onChanged: (value) {
                    controller.searchQuery.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Search by name or brand',
                    hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, size: 20.sp, color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(() => Text(
                    '${controller.filteredProducts.length} results found',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  )),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.blueAccent),
                    );
                  }
                  if (controller.filteredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: controller.filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = controller.filteredProducts[index];
                      return GestureDetector(
                        onTap: () => Get.to(() => ProductDetailsScreen(productId: product.id!)),
                        child: ProductCardWidget(product: product),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
