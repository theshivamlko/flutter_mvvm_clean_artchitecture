import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/error_handler.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/failure.dart';

extension NotNullString on String? {
  String orEmpty() {
    return this == null ? "" : this!;
  }
}

extension NotNullInt on int? {
  int orZero() {
    return this == null ? 0 : this!;
  }
}

extension FailureExtension on int? {
  Failure getFailure() {
    switch (this) {
      case HttpStatus.networkConnectTimeoutError:
        return Failure(HttpStatus.networkConnectTimeoutError,
            ResponseError.errorCodes[HttpStatus.networkConnectTimeoutError]!);
      case 2:
        return Failure(DioExceptionType.receiveTimeout.index,
            ResponseError.errorCodes[DioExceptionType.receiveTimeout.index]!);

      default:
        return Failure(0, ResponseError.errorCodes[0]!);
    }
  }
}
