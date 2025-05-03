import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AppConstants {
  ///====================================================================Networking==================(open)

  static String baseUrl = "https://dummyjson.com";
  static String filesBaseurl =
      "https://dummyjson.com";
  static String latitude = "40.8739084";
  static String longitude = "-74.2299074";
  static var serviceHeader = {
    'Accept': 'application/json',
    //'longitute': Longitude,
    //'latitute': Latitude,
    'Authorization': 'Bearer ${userToken.toString()}'
  };static String errorMessage = "";
  static DateTime currentTime = DateTime.now();
  static String userToken = "";
  static RxString userName = "".obs;
  static RxString userEmail = "".obs;
  static String userId = "";
  static RxString userProfileImage = "".obs;
  static RxString userGender = "Select Gender".obs;
  static String userFcmToken = "";
  static  String callUser = 'user';
  ///====================================================================System==================(open)
  static RxBool LoadingProgress = false.obs;
  static  String googleKey = "AIzaSyCvRYY_cKPzBLI1QqRgCOhP-BCnWXesEXg";

  ///====================================================================end urls==================(open)
  static  String loginUrl = '/RestApiKit/login';
  static  String otpUrl = '/verify-otp';
  static  String reSendUrl = '/verify-otp';
  static  String signUpUrl = '/register';
  static  String userListUrl = '/users?page=2';













































}
