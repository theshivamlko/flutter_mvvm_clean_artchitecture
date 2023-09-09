
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/app/app_pref.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  AppPreference _appPreference;

  DioFactory(this._appPreference);

  Future<Dio> getDio() async {

    String lang=await _appPreference.getLanguage();
    Dio dio = Dio();
    Map<String, dynamic> headers = {
   //   "contentType": "application/json",
      // "apiKey": "bdnd82e2njdfn0ufjsnfkjs="
    };
    int _timeOut = 6; // secs

    BaseOptions options = BaseOptions(
      headers: headers,
      sendTimeout: Duration(seconds: _timeOut),
      receiveTimeout: Duration(seconds: _timeOut),
    );
    dio.options = options;
    if(kDebugMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true
      ));
    }

    return dio;
  }
}
