import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppColors {
  static const Color primaryTeal = Color(0xFF4A7C6D);

  static const Color blackText = Colors.black;
  static const Color whiteText = Colors.white;
  static Color getBodyColor() {
    return Get.isDarkMode ? bodyColorDark : bodyColor;
  }

  static Color getContainerColor() {
    return Get.isDarkMode ? containerColorDark : whiteColor;
  }

  static Color getBackgroundColor() {
    return Get.isDarkMode ? containerColorDark : backgroundColor;
  }

  static Color getShadowColor() {
    return Get.isDarkMode ? shadowColorDark : shadowColor;
  }

  static Color getTitleColor() {
    return Get.isDarkMode ? titleColorDark : titleColor;
  }

  static Color getTextColor() {
    return Get.isDarkMode ? textColorDark : textColor;
  }

  static Color getTextColor2() {
    return Get.isDarkMode ? textColorDark : textColor2;
  }

  static Color getInputColor() {
    return Get.isDarkMode ? bodyColorDark : inputColor;
  }

  static Color getBorderColor() {
    return Get.isDarkMode ? borderColorDark : borderColor;
  }

  static Color getBtnColor() {
    return Get.isDarkMode ? primaryColor : btnColor;
  }

  // Primary Colors
  static const Color whiteColor = Color(0xFFffffff);
  static const Color grey = Colors.grey;
  static const Color darkGrey = Color(0xFF555555 );
  static const Color graphite = Color(0xFF757575 );
  static const Color blue = Colors.blueAccent;
  static const Color blackColor = Color(0xFF000000);
  static const Color blackShade = Color(0xFF444746);
  static const Color credentialIconColor = Color(0xFF49454F);
  static Color primaryColor = const Color(0xFFfd6b30);
  static const Color successColor = Color(0xFF5fbe67);
  static const Color dangerColor = Color(0xFFFF536A);
  static const Color infoColor = Color(0xFF8fceff);
  static const Color violetColor = Color(0xFF9093fe);
  static const Color orangeColor = Color(0xFFff8254);
  static const Color warningColor = Color(0xFFffc457);
  static const Color purple = Color(0xFF946DB8);
  static const Color fbColor = Color(0xff1877F2);
  static const Color navyBlue = Color(0xff1D192B);

  static const Color bodyColor = Color(0xFFFFF9F1);
  static const Color backgroundColor = Color(0xFFFFFCF7);
  static const Color shadowColor = Color(0xFFeeeeee);
  static const Color scaffoldColor = Color(0xFF0b1727);
  static const Color borderColor = Color(0xFFe7e7e9);
  static const Color btnColor = Color(0xFF010103);
  static const Color lightgrey = Color(0xFFD4CED9);
  static const Color buttonColor = Color(0xFF946DB8);
  static const Color blueColor = Color(0xE5223159);

  static const Color disableContinue = Color(0xFFD4CED9);
  static const Color pinkbuttonColor = Color(0xFFDD7CA1);
  static const Color peachbuttonColor = Color(0xFFEFB4AB);
  static const Color hostbuttonColor = Color(0xFFDD7CA1);


  static const Color inputColor = Color(0xFFf7f7f8);

  // Text Colors
  static const Color titleColor = Color(0xFF29313F);
  static const Color textColor = Color(0xFF6e6d7a);
  static const Color textColor2 = Color(0xFFB8BCC4);
  static const Color textColor3 = Color(0xFF946DB8);
  static const Color titleColorDark = Color(0xFFf1f7f7);
  static const Color textColorDark = Color(0xFFD9E7FD);

  // dark mode
  static const Color bodyColorDark = Color(0xFF0f1925); //0xFF0f1925
  static const Color containerColorDark = Color(0xFF1c293a);
  static const Color shadowColorDark = Color(0x00000000);
  static const Color borderColorDark = Color(0xFF293C55);
  static const Color inputColorDark = Color(0xFF182E4E);

  static const Color erieBlack = Color(0xFF232323);
  static const Color lightBlack = Color(0xFF202226);
  static const Color ashGrey = Color(0xFFE5E7EB);
  static const Color smokeGrey = Color(0xFF838383);
  static const Color charCoal = Color(0xFF49454F);
  static const Color brightPurple = Color(0xFF946DB8);

  static const Color lightPeach = Color(0xFFEFB4AB);
  static const Color graphiteGray = Color(0xFFA3A3A3);
  //
  static const Color amethyst = Color(0xFF946DB8);
  static const Color searchbarGray = Color(0xFFF4F4F4);
  static const Color frostedGray = Color(0xFFF6F6F6);
  static const Color melon = Color(0xFFEFB4AB);
  static const Color thulianPink = Color(0xFFDD7CA1);
  static const Color greyBorder = Color(0xFF79747E);
  static const Color white2 = Color(0xFFF4F4F4);
  static const Color darkPurple = Color(0xFF6750A4);
  static const Color liGrey = Color(0xFFD3CCD9);
  static const Color primary = Color(0xFFEFB4AB);

}