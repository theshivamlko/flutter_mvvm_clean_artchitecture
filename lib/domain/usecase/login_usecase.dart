import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/failure.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/request/login_request.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/models/authentication.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/repository.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/usecase/base_usecase.dart';

class LoginUseCase
    implements BaseUseClass<LoginUseCaseInput, AuthenticationModel> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
