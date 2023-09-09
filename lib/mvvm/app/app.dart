import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/theme_manager.dart';

// v 3.10.6
class MyApp extends StatefulWidget {
  MyApp._internal();

  int appState = 0;

  // Singleton
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      theme: ThemeManager.getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,

    );
  }
}
