import 'package:flutter/material.dart';


import '../themes/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.fontFamily= '',
    this.isLoading = false,
    required this.title,
    this.width = 314,
    this.height = 54,
    required this.onPress,
    this.textColor = AppColors.whiteColor,
    this.bgColor = AppColors.buttonColor,
    this.icon,
    this.iconSpacing = 8.0,
    this.hasBorder = false,
    this.postIcon, // ✅ Post icon after text
    this.postIconSpacing = 8.0,
  });

  final bool isLoading;
  final String fontFamily;
  final String title;
  final double width, height;
  final VoidCallback onPress;
  final Color textColor, bgColor;
  final Widget? icon;
  final Widget? postIcon; // ✅ Optional post icon
  final double iconSpacing;
  final double postIconSpacing;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: hasBorder
              ? Border.all(color: Colors.grey, width: 1.5)
              : null,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
              strokeWidth: 2.0,
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(width: iconSpacing),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                ),
              ),
              if (postIcon != null) ...[
                SizedBox(width: postIconSpacing),
                postIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
