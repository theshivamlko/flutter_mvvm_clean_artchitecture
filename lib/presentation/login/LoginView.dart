import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/login/login_viewmodel.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/image_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel loginViewModel = LoginViewModel(null);

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
                decoration: InputDecoration(hintText: "Username",

                errorText: (snapshot.data??true)?null:"Enter valid username"
                ),
                onChanged: (s) => loginViewModel.setUserName(s),
              );
            }
          ),
          StreamBuilder<bool>(
              stream: loginViewModel.outputIsPasswordValid,
            builder: (context, snapshot) {
              return TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                    errorText: (snapshot.data??true)?null:"Enter valid password"
                ),
                obscureText: true,
                onChanged: (s) => loginViewModel.setPassword(s),
              );
            }
          ),

          StreamBuilder<bool>(
            stream: loginViewModel.outputIsAllInputsValid,

            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Expanded(
                    flex: 1,

                    child: ElevatedButton(onPressed:(snapshot.data??false)? (){

                    }:null,

                        child: Text("Login")),
                  ),
                ],
              );
            }
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
