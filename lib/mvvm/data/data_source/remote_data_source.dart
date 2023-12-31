import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/app_api.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/request/login_request.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/authentication_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/authentication.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    try {
      return await _appServiceClient.login(
          loginRequest.email!!, loginRequest.password!!);
    } catch (e) {
      print("RemoteDataSourceImpl $e");
      rethrow;
    }
  }
}
