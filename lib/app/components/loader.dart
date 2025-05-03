
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../../main.dart';

import '../themes/colors.dart';


class AlertController extends GetxController {
  var isShowing = false.obs;

  void showAlert() {
    isShowing.value = true;
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              /*  GlowingProgressIndicator(
                  child: Image.asset(
                    AppImages.appLogo,
                    height: 100.h,
                    width: 100.w,
                  ),
                ),*/
                SizedBox(height: 6.h),
                LoadingAnimationWidget.staggeredDotsWave(
                  size:50.sp,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible:
          false, // Prevent dialog from dismissing on tap outside
    );
  }

  void hideAlert() {
    if (kDebugMode) {
      print("--Closing Loader /a-------${isShowing.value}-------------");
    }
    isShowing.value = false;
    if (kDebugMode) {
      print("--Closing Loader /b-------${isShowing.value}-------------");
    }
  }
}

class ProgressIndicator1 {
  void hideLoadingDialog() {
    Navigator.of(myNavigatorKey.currentContext!, rootNavigator: true).pop();
  }

  Future<void> showloadingindicator() async {
    return
        //  Get.dialog(SimpleDialog());

        showDialog<void>(
      context: myNavigatorKey.currentContext!,
      builder: (BuildContext context) {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             /*   GlowingProgressIndicator(
                    child: Image.asset(
            AppImages.appLogo,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                )),*/
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                LoadingAnimationWidget.staggeredDotsWave(
                  size: MediaQuery.of(context).size.height * 0.05,
                  color: AppColors.whiteColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
