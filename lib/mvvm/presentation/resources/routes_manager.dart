import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/app/di.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/login/LoginView.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/main/main_view.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/onboarding/onboarding_view.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/register.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/splash/splash_view.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/storedetails/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashView());
        }
      case Routes.loginRoute:
        {
          initLoginModule();
          return MaterialPageRoute(builder: (_) => LoginView());
        }
      case Routes.registerRoute:
        {
          return MaterialPageRoute(builder: (_) => Register());
        }
      case Routes.forgotPasswordRoute:
        {
          return MaterialPageRoute(builder: (_) => ForgotPassword());
        }
      case Routes.onBoardingRoute:
        {
          return MaterialPageRoute(builder: (_) => OnBoardingView());
        }
      case Routes.mainRoute:
        {
          return MaterialPageRoute(builder: (_) => MainView());
        }
      case Routes.storeDetailsRoute:
        {
          return MaterialPageRoute(builder: (_) => StoreDetails());
        }
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(StringManager.noPageFound),
              ),
              body: Text(StringManager.noPageFound),
            ));
  }
}
