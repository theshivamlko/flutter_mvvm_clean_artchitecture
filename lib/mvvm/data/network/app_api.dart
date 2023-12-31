import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/api_constants.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/authentication_response.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(dio.Dio dio, {String baseUrl}) = _AppServiceClient;

//  @Headers(<String, dynamic>{"Content-Type": "application/json"})
  @POST("/customer/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );
}
