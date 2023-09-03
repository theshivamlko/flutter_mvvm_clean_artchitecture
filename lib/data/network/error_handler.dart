import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_artchitecture/app/extensions.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/failure.dart';

class ResponseError {
  static Map<int, String> errorCodes = {
    0: "Something Gone Wrong",
    HttpStatus.networkConnectTimeoutError: "No Internet Connection"
  };
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = error.response!.statusCode.getFailure();
    } else {
      failure = 0.getFailure();
    }
   }
}
