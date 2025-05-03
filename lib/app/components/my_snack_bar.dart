import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';



void mySnackBar({required MType type, required String message}) {
  log("@@@@@@@@@@@@@@@@@@$message");
  Get.showSnackbar(
    GetSnackBar(
        maxWidth: 360.w,
        backgroundColor: AppColors.whiteColor,
        messageText: Text(
          "    $message",
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        forwardAnimationCurve: Curves.easeInOutCirc,
        //overlayBlur: 1,
        reverseAnimationCurve: Curves.easeInOutCirc,
        duration: const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.symmetric(vertical: 30.h),
        borderRadius: 30.r,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        icon: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CircleAvatar(
              radius: 30.r,
              backgroundColor: type == MType.failed
                  ? Colors.red
                  : type == MType.warning
                      ? Colors.yellow
                      : type == MType.success
                          ? Colors.green
                          : type == MType.info
                              ? Colors.blue
                              : Colors.red,
              child: Center(
                child: Icon(
                  type == MType.failed
                      ? Icons.highlight_remove
                      : type == MType.warning
                          ? Icons.warning_rounded
                          : type == MType.success
                              ? Icons.check_rounded
                              : type == MType.info
                                  ? Icons.info_outline
                                  : Icons.error_outline,
                  size: 30.h,
                  color: type == MType.failed
                      ? Colors.white
                      : type == MType.warning
                          ? Colors.black
                          : type == MType.success
                              ? Colors.white
                              : type == MType.info
                                  ? Colors.white
                                  : Colors.white,
                ),
              )),
        )),
  );
}

enum MType { failed, warning, success, info, error }
