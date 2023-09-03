import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_artchitecture/app/extensions.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/failure.dart';

class ResponseError {
  static Map<int, String> errorCodes = {
    0: "Something Gone Wrong",
    HttpStatus.networkConnectTimeoutError: "No Internet Connection",
    2: "Request Timeout",
  };
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    print("ErrorHandler $error");

    if (error is DioException) {
      print("ErrorHandler2 ${error.response?.statusCode}");
      print("ErrorHandler3 ${error.error}");
      print("ErrorHandler4 ${error.type.index}");

      failure = error.type.index.getFailure();
    } else {
      failure = 0.getFailure();
    }
   }
}
