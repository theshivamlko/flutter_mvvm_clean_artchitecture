import 'dart:async';

import 'package:flutter_mvvm_clean_artchitecture/domain/usecase/login_usecase.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/base/BaseViewModel.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController<String> _userNameController =
      StreamController<String>.broadcast();
  final StreamController<String> _passwordController =
      StreamController<String>.broadcast();

  final StreamController<bool> _buttonController =
      StreamController<bool>.broadcast();

  var loginObject = LoginObject("", "");

  late LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase);

  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
  }

  @override
  void start() {
    setUserName("abc@gmail.com");
    setPassword("123456");
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameController.sink;

  @override
  login() async {
    print(loginObject);
    (await loginUseCase?.execute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        ?.fold((failure) {
      print(failure.message);
    }, (data) {
      print(data.customerModel?.name);
    });
  }

  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid =>
      _userNameController.stream.map((username) => _isUserValid(username));

  _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  _isUserValid(String username) {
    return username.isNotEmpty;
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    print(loginObject);
    loginObject = LoginObject(loginObject.username, password);
    inputIsAllInput.add(false);
    print(password);
    print(loginObject);
  }

  @override
  setUserName(String username) {
    inputUserName.add(username);
    print(loginObject);
    loginObject = LoginObject(username, loginObject.password);
    inputIsAllInput.add(false);
    print(username);
    print(loginObject);
  }

  @override
  // TODO: implement inputIsAllInput
  Sink get inputIsAllInput => _buttonController.sink;

  @override
  // TODO: implement outputIsAllInputsValid
  Stream<bool> get outputIsAllInputsValid =>
      _buttonController.stream.map((event) => _isAllInputValid());

  bool _isAllInputValid() {
    var res = _isPasswordValid(loginObject.username) &&
        _isUserValid(loginObject.password);
    print(res);
    return res;
  }
}

abstract class LoginViewModelInputs {
  setUserName(String username);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputIsAllInput;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
