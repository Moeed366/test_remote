import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import '../../components/loader.dart';
import '../../components/my_snack_bar.dart';
import '../../utils/app_constant.dart';



class NetworkService {
  Dio _dio = Dio();
  NetworkService() {
    BaseOptions baseOptions = BaseOptions(
        receiveTimeout: Duration(seconds: 10),
        connectTimeout: Duration(seconds: 10),
        sendTimeout: Duration(seconds: 10),
        baseUrl: AppConstants.baseUrl,
        maxRedirects: 2,
        responseType: ResponseType.json,
        headers: AppConstants.serviceHeader);
    _dio = Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log("--------Request URL: ${options.baseUrl}${options.path}");
        return handler.next(options);
      },
    ));
  }

  /* Future<void> checkConnectivityAndExecuteRequest(
      Function requestFunction) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar("No Internet", "You are not connected to the internet",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      requestFunction();
    }
  }*/

  Future<dynamic> get({required String endpoint, required bool showLoader}) async {
    if (kDebugMode) {
      log(
          "get>>|  ${AppConstants.serviceHeader}         |-------------| $endpoint");
    }
    try {
      if (showLoader) {
        AppConstants.LoadingProgress.value = true;
        ProgressIndicator1().showloadingindicator();
      }
      final response = await _dio.get(
        endpoint,
      );
      if (showLoader) {
        AppConstants.LoadingProgress.value = false;
        ProgressIndicator1().hideLoadingDialog();
      }
      if (kDebugMode) {
        log("${response?.data} __________________GET______________________");
      }


      return response;
      // _showErrorSnackbar(response.statusCode);
    } on DioError catch (e) {
      if (showLoader) {
        AppConstants.LoadingProgress.value = false;
        ProgressIndicator1().hideLoadingDialog();
      }

      ErrorResponse exceptionresponse = handleDioError(e);
      if (kDebugMode) {
        log(
            "${e.response?.data} ${exceptionresponse.errorMessage}-------------${exceptionresponse.errorStatusCode}");
      }


      return Response(
          requestOptions: RequestOptions(path: endpoint),
          statusMessage: exceptionresponse.errorMessage,
          statusCode: exceptionresponse.errorStatusCode);
    }
  }

  Future<Response?> post(
      {required String endpoint,
        required FormData? data,
        required bool showLoader}) async {
    if (kDebugMode) {
      log("post>>|         ${data?.fields}  |-------------| $endpoint");
    }
    try {
      if (showLoader) {
        AppConstants.LoadingProgress.value = true;
        ProgressIndicator1().showloadingindicator();
      }
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      if (showLoader) {
        AppConstants.LoadingProgress.value = false;
        ProgressIndicator1().hideLoadingDialog();
      }
      if (kDebugMode) {
        log("${response?.data} ___________________POST_____________________");
      }
      return response;
      // _showErrorSnackbar(response.statusCode);
    } on DioError catch (e) {
      if (showLoader) {
        AppConstants.LoadingProgress.value = false;
        ProgressIndicator1().hideLoadingDialog();
      }
      ErrorResponse exceptionresponse = handleDioError(e);
      if (kDebugMode) {
        log(
            "${e.response?.data['message']}----------- ${exceptionresponse.errorMessage}-------------${exceptionresponse.errorStatusCode}");
      }


      return Response(
          requestOptions: RequestOptions(path: endpoint),
          statusMessage: exceptionresponse.errorMessage,
          statusCode: exceptionresponse.errorStatusCode);
    }
  }

  ErrorResponse handleDioError(DioException error) {
    String message;
    switch (error.type) {
      case DioExceptionType.cancel:
        message = 'Request to the server was cancelled.';
        mySnackBar(type: MType.error, message: message);
        return ErrorResponse(
          errorMessage: message,
          errorStatusCode: 1,
        );
        // This can happen if you cancel the request manually.
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Connection timeout with the server.';
        mySnackBar(type: MType.error, message: message);
        return ErrorResponse(
          errorMessage: message,
          errorStatusCode: 2,
        );
        // This usually happens if the server is taking too long to reply.
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with the server.';
        mySnackBar(type: MType.error, message: message);
        return ErrorResponse(
          errorMessage: message,
          errorStatusCode: 3,
        );
        // This occurs if the request takes too long to send data.
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with the server.';
        mySnackBar(type: MType.error, message: message);
        return ErrorResponse(
          errorMessage: message,
          errorStatusCode: 4,
        );

      case DioExceptionType.unknown:
      // This is a generic error type for all other errors.
        message = 'Unexpected error occurred: ${error.message}';

        if (error.error is SocketException) {
          message = 'No Internet connection';
        }
        mySnackBar(type: MType.error, message: message);
        return ErrorResponse(
          errorMessage: message,
          errorStatusCode: 6,
        );
      case DioExceptionType.connectionTimeout:
        mySnackBar(type: MType.error, message: 'Connection Time Out');
        return ErrorResponse(
          errorMessage:  'Connection Time Out',
          errorStatusCode: 90,
        );
      case DioExceptionType.badCertificate:
        mySnackBar(type: MType.error, message: 'badCertificate');
        return ErrorResponse(
          errorMessage:  'badCertificate',
          errorStatusCode: 91,
        );
      case DioExceptionType.badResponse:
        mySnackBar(type: MType.error, message: error.response!.data['message'].toString());
        return ErrorResponse(
          errorMessage:  error.response!.data['message'].toString(),
          errorStatusCode: int.parse(error.response!.statusCode.toString()),
        );
      case DioExceptionType.connectionError:
        mySnackBar(type: MType.error, message: 'connectionError');
        return ErrorResponse(
          errorMessage:  'connectionError',
          errorStatusCode: 93,
        );
    }
  }
}

class ErrorResponse {
  int errorStatusCode;
  String errorMessage;
  ErrorResponse({required this.errorMessage, required this.errorStatusCode});
}
