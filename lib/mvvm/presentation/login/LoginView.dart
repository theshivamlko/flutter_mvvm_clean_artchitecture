import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/app/di.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/data_source/remote_data_source.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/app_api.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/repository/repository_impl.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/repository.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/usecase/login_usecase.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/login/login_viewmodel.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/image_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/routes_manager.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginViewModel loginViewModel = instance<LoginViewModel>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _bind() {
    loginViewModel.start();

    usernameController.addListener(() {
      loginViewModel.setUserName(usernameController.text);
    });
    passwordController.addListener(() {
      loginViewModel.setUserName(passwordController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      loginViewModel.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Widget getContent() {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage(ImageAssets.splashLogo)),
          StreamBuilder<bool>(
              stream: loginViewModel.outputIsUserNameValid,
              builder: (context, snapshot) {
                return TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Username",
                      errorText: (snapshot.data ?? true)
                          ? null
                          : "Enter valid username"),
                  onChanged: (s) => loginViewModel.setUserName(s),
                );
              }),
          StreamBuilder<bool>(
              stream: loginViewModel.outputIsPasswordValid,
              builder: (context, snapshot) {
                return TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      errorText: (snapshot.data ?? true)
                          ? null
                          : "Enter valid password"),
                  obscureText: true,
                  onChanged: (s) => loginViewModel.setPassword(s),
                );
              }),
          StreamBuilder<bool>(
              stream: loginViewModel.outputIsAllInputsValid,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false) ? () {

                            loginViewModel.login().catchError((error){
                            });
                          } : null,
                          child: Text("Login")),
                    ),
                  ],
                );
              }),
          Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.forgotPasswordRoute);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Forgot Password?"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }
}
