import 'package:dio/dio.dart' as dio;
import 'package:flutter_mvvm_clean_artchitecture/data/network/api_constants.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/responses/authentication_response.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(dio.Dio dio, {String baseUrl}) = _AppServiceClient;

  @Headers(<String, dynamic>{"Content-Type": "application/json"})
  @POST("/customers/login")
  Future<AuthenticationResponse> login(Map<String, String> body);
}
